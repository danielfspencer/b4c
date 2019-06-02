const program = require('commander')
const fs = require('fs')

// internal modules
const log = require('./modules/log.js')
const compiler = require('./compiler/interface.js')
const assembler = require('./assembler/interface.js')

function fail(message) {
  if (message) {
    log.error('main: ' + message)
  }
  process.exit(1)
}

function open_file(path) {
  let file
  try {
    file = fs.readFileSync(path)
  } catch (error) {
    fail('Unable to read file\n' + error.message)
  }
  return file
}

function write_file(path,data) {
  try {
    fs.writeFileSync(path, data)
  } catch (error) {
    fail('Unable to write to file\n' + error.message)
  }
}

program
  .version('compiler/assembler v0.44.1\ninterface v0.0.1')
  .arguments('<file>')
  .option('-o --output <filename>', 'output filename')
  .option('-c --compile', 'compile the input file')
  .option('-a --assemble', 'assemble the input file')
  .option('-v --verbose', 'print debugging messages')
  .option('-q --quiet', 'only print error messages')
  .on('--help', () => {
    console.log('  If neither -c nor -a is specified the input file\'s')
    console.log('  extension determines the mode')
    console.log('\nExamples:')
    console.log('  Compile program.b4 into program.asm')
    console.log('  $ b4c program.b4\n')
    console.log('  Compile and assemble program.b4 into program.bin')
    console.log('  $ b4c -ca program.b4\n')
    console.log('  Assemble program.asm into program.bin')
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
let mode_text
let verbose = program.verbose
let quiet = program.quiet

if (verbose && quiet) {
  fail('Options \'verbose\' and \'quiet\' cannot be specified at the same time')
} else if (verbose) {
  compiler.debug = true
  assembler.debug = true
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

if (compile && assemble) {
  mode_text = "compile + assemble"
} else if (compile) {
  mode_text = "compile"
} else if (assemble) {
  mode_text = "assemble"
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

log.debug('main: Input \'' + input_path + '\' -> Output \'' + output_path + '\' ')
log.debug('main: Mode: ' + mode_text)


let input_file = open_file(input_path)

if (compile) {
  compiler.compile(input_file.toString(), (result) => {

    if (assemble) {
      assembler.assemble(result, (result) => {
        write_file(output_path, result)
      }, fail)
    } else {
      write_file(output_path, result)
    }

  }, fail)
} else if (assemble) {
  assembler.assemble(input_file.toString(), (result) => {
    write_file(output_path, result)
  }, fail)
}
