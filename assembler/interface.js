const WebWorker = require('tiny-worker')

// internal modules
const log = require('../log.js')

let callbacks
let worker

function start_worker() {
  worker = new WebWorker('assembler/engine.js')

  worker.onmessage = (msg) => {
    let data = msg.data

    switch (data[0]) {
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
            log.error('asm : ' + data[2])
            break
          case 'warn':
            log.warn('asm : ' +data[2])
            break
          case 'info':
            log.info('asm : ' +data[2])
            break
          case 'debug':
            log.debug('asm : ' +data[2])
            break
        }
        break
      default:
        log.error('Unknown worker message type: \' ' + data[1] + ' \'')
        break
    }
  }

  worker.onerror = (e) => {
    let msg = 'Internal assembler error, line ' + e.lineno + ': \n' + e.message
    log.error('asm :' + msg)
  }
}

exports.assemble = (input, success, fail) => {
  start_worker()
  callbacks = {success:success, fail:fail}
  // worker.postMessage(['debug', true])
  worker.postMessage(['assemble',input])
}
