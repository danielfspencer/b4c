const WebWorker = require('tiny-worker')

// internal modules
const log = require('../log.js')

const worker = new WebWorker('compiler/engine.js')

let result_callback

worker.onmessage = (msg) => {
  let data = msg.data
  switch (data[0]) {
    case 'update':
      // data[1] holds the percentage progress
      break
    case 'result':
      result_callback(data[1])
      break
    case 'log':
      switch (data[1]) {
        case 'error':
          log.error('worker: ' + data[2])
          break
        case 'warn':
          log.warn('worker: ' +data[2])
          break
        case 'info':
          log.info('worker: ' +data[2])
          break
        case 'debug':
          log.debug('worker: ' +data[2])
          break
      }
      break
    default:
      log.error('Unknown worker message type: \' ' + data[1] + ' \'')
      break
  }
}

worker.onerror = (e) => {
  let msg = 'Internal compiler error, line ' + e.lineno + ': \n' + e.message
  log.error(msg)
}

exports.compile = (input, callback) => {
  result_callback = callback
  let as_array = input.split('\n')
  worker.postMessage(['input', as_array])
  worker.postMessage(['compile'])
}

exports.benchmark = () => {
  worker.postMessage(['bench', 100])
}
