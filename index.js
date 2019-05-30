const program = require('commander')
const fs = require('fs')

// internal modules
const log = require('./log.js')
const compiler = require('./compiler/compile.js')

// .option('-s --size <size>', 'Pizza size', /^(large|medium|small)$/i, 'medium')
// .option('-d --drink [drink]', 'Drink', /^(coke|pepsi|izze)$/i)

program
  .version('compiler/assembler v0.44.1\ninterface v0.0.1')
  .option('-o --output <filename>', 'output filename', '<input name>.asm')
  .option('-v --verbose [verbose]', 'enables debugging messages',)

  .parse(process.argv)

// console.log(process.argv)
// compiler.compile("var int test 2 + 2", console.log)

let data = fs.readFileSync('input.b4')

compiler.compile(data.toString(), (result) => {
  fs.writeFileSync('output.asm', result)
})
