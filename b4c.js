const program = require('commander')
const fs = require('fs')

// internal modules
const log = require('./modules/log.js')
const interface = require('./modules/interface.js')
const { version } = require('./package.json')

const AST_DUMP = 'ast.json'

function fail(message) {
  if (message) {
    log.error(`main: ${message}`)
  }
  process.exit(1)
}

function read_file(path) {
  let file
  try {
    // stdin is file 0
    if (path === '-') {
      path = 0
    }
    file = fs.readFileSync(path).toString()
  } catch (error) {
    fail(`Unable to read file\n${error.message}`)
  }
  return file
}

function write_file(path,data) {
  try {
    if (path === "-") {
      process.stdout.write(data)
    } else {
      fs.writeFileSync(path, data)
    }
  } catch (error) {
    fail(`Unable to write to file\n${error.message}`)
  }
}

function dump_ast(ast) {
  if (should_dump_ast) {
    let string = JSON.stringify(ast, null, 2)
    write_file(AST_DUMP, string)
    log.info(`main: Abstract syntax tree written to '${AST_DUMP}'`)
  }
}

program
  .version(`v${version}`)
  .arguments('<file>')
  .option('-o --output <filename>', 'output filename')
  .option('-c --compile', 'compile the input file')
  .option('-a --assemble', 'assemble the input file')
  .option('-v --verbose', 'print debugging messages')
  .option('-d --dump', `dump the compiler's AST to ${AST_DUMP}`)
  .option('-q --quiet', 'only print error messages')
  .on('--help', () => {
    console.log('  If neither -c nor -a is specified then the input')
    console.log('  file\'s extension determines the mode\n')
    console.log('  - Compile program.b4 into program.asm')
    console.log('  $ b4c program.b4\n')
    console.log('  - Compile then assemble program.b4 into program.bin')
    console.log('  $ b4c -ca program.b4\n')
    console.log('  - Assemble program.asm into program.bin')
    console.log('  $ b4c program.asm')
  })
  .parse(process.argv)

if (program.args.length === 0) {
  program.help()
}

let compile
let assemble
let input_path = program.args[0]
let output_path
let verbose = program.verbose
let quiet = program.quiet
let should_dump_ast = program.dump

if (verbose && quiet) {
  fail(`Options 'verbose' and 'quiet' cannot be specified at the same time`)
} else if (verbose) {
  interface.debug = true
}

log.quiet = quiet

if (!(program.assemble || program.compile)) {  // user has not specified what mode they want
  // guess based on the input filename
  if (input_path.endsWith('.b4')) {
    compile = true
    assemble = false
  } else if (input_path.endsWith('.asm')) {
    compile = false
    assemble = true
  } else {
    fail('Unable to determine required action from input file type')
  }
} else {                                      // user has specified what mode they want
  compile = program.compile
  assemble = program.assemble
}

if (!compile && should_dump_ast) {
  fail(`The 'dump' option can only be specified when compiling`)
}

if (program.output) { // user has specified output file path
  output_path = program.output
} else {              // user has not specified output path
  let output_type
  if (assemble) {
    output_type = 'bin'
  } else {
    output_type = 'asm'
  }

  // replace input filename's type with new type
  new_path = input_path.split('.')
  if (new_path.length === 1) {  // add extension
    new_path.push(output_type)
  } else {  // replace old  extension
    new_path[new_path.length - 1] = output_type
  }
  output_path = new_path.join('.')
}

log.debug(`main: Input '${input_path}' -> Output '${output_path}'`)

if (compile && assemble) {
  log.debug(`main: mode 'compile + assemble'`)

  interface.compile(read_file(input_path))
  .then(([assembly, ast]) => {
    dump_ast(ast)
    return interface.assemble(assembly)
  })
  .then((binary) => write_file(output_path, binary))
  .catch(fail)

} else if (compile) {
  log.debug(`main: mode 'compile'`)

  interface.compile(read_file(input_path))
  .then(([asm, ast]) => {
    dump_ast(ast)
    write_file(output_path, asm)
  })
  .catch(fail)

} else if (assemble) {
  log.debug(`main: mode 'assemble'`)

  interface.assemble(read_file(input_path))
  .then((binary) => write_file(output_path, binary))
  .catch(fail)

}
