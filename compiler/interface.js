const WebWorker = require('tiny-worker')
const path = require('path')
// not actually used but this tricks it into being loaded
// for the worker when packaged
const now = require('performance-now')

// internal modules
const log = require('../modules/log.js')

let callbacks
let worker

function start_worker() {
  worker = new WebWorker(path.join(__dirname, 'engine.js'))

  worker.onmessage = (msg) => {
    let data = msg.data

    switch (data[0]) {
      case 'update':
        // data[1] holds the percentage progress
        break
      case 'result':
        worker.terminate()
        if (data[1] === "") {
          callbacks.fail()
        } else {
          callbacks.success(data[1])
        }
        break
      case 'log':
        switch (data[1]) {
          case 'error':
          log.error('cmp : ' + data[2])
          break
          case 'warn':
          log.warn('cmp : ' +data[2])
          break
          case 'info':
          log.info('cmp : ' +data[2])
          break
          case 'debug':
          log.debug('cmp : ' +data[2])
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
    log.error('cmp : ' + msg)
  }
}

exports.compile = (input, success, fail) => {
  start_worker()
  callbacks = {success:success, fail:fail}
  worker.postMessage(['compile', input])
}

exports.benchmark = () => {
  start_worker()
  worker.postMessage(['bench', 100])
}
