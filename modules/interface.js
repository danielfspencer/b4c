const log = require('../modules/log.js')

const vm = require('vm')
const fs = require('fs')
const path = require('path')
const { performance } = require('perf_hooks')

const COMPILER_ENGINE = fs.readFileSync(path.join(__dirname, '../compiler/engine.js'))
const COMPILER_LIBRARIES = fs.readFileSync(path.join(__dirname, '../compiler/libraries.js'))
const ASSEMBLER_ENGINE = fs.readFileSync(path.join(__dirname, '../assembler/engine.js'))

function create_context(files, log_prefix, handler) {
  // create fake WebWorker environment

  if (handler === undefined) {
    handler = log.handle_worker_log
  }
  const context = {
    importScripts: () => {},
    performance: performance,
    postMessage: (data) => handler(log_prefix, data),
  }

  // instantiate the context with the given global vars
  vm.createContext(context)
  // create dummy message handler to prevent errors when trying to register handlers
  vm.runInContext('let onmessage', context)

  // load & evaluate each file in the context
  for (const [source, name] of files) {
    vm.runInContext(source, context, {filename: name})
  }

  // set debug logging status
  vm.runInContext(`debug = ${exports.debug}`, context)
  return context
}

exports.debug = false

exports.compile = (input, handler) => {
  const LOG_PREFIX = ' cmp'
  let context = create_context([
    [COMPILER_LIBRARIES, '<libraries>'],
    [COMPILER_ENGINE, '<compiler>']
  ], LOG_PREFIX, handler)

  return new Promise((resolve, reject) => {
    let result = null
    try {
      result = context.compile_wrapped(input, false)
    } catch (e) {
      log.error(`${LOG_PREFIX}: [Internal compiler error]\n${e.stack}`)
    }

    if (result === null) {
      reject()
    } else {
      resolve([result + '\n', context.get_ast()])
    }
  })
}

exports.assemble = (input, handler) => {
  const LOG_PREFIX = ' asm'
  let context = create_context([
    [ASSEMBLER_ENGINE, '<assembler>'],
  ], LOG_PREFIX, handler)

  return new Promise((resolve, reject) => {
    let result = null
    try {
      result = context.assemble_wrapped(input)
    } catch (e) {
      log.error(`${LOG_PREFIX}: [Internal assembler error]\n${e.stack}`)
    }

    if (result === null) {
      reject()
    } else {
      resolve(result)
    }
  })
}
