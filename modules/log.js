const colors = require('colors/safe')

exports.quiet = false

exports.error = (msg) => {
  console.error(`${colors.red('error')} ${toString(msg)}`)
}

exports.warn = (msg) => {
  if (exports.quiet) { return }
  console.warn(` ${colors.yellow('warn')} ${toString(msg)}`)
}

exports.info = (msg) => {
  if (exports.quiet) { return }
  console.info(` ${colors.blue('info')} ${toString(msg)}`)
}

exports.debug = (msg) => {
  if (exports.quiet) { return }
  console.info(colors.dim(`${colors.grey('debug')} ${toString(msg)}`))
}

exports.handle_worker_log = (prefix, data) => {
  let [type, level, value] = data
  let msg = `${prefix}: ${value}`
  switch (level) {
    case 'debug': exports.debug(msg)
    break
    case 'info': exports.info(msg)
    break
    case 'warn': exports.warn(msg)
    break
    case 'error': exports.error(msg)
    break
  }
}

function toString(obj) {
  if (typeof obj === 'object') {
    return JSON.stringify(obj, null, 2)
  } else {
    return padNewlines(obj)
  }
}

function padNewlines(text) {
  return text.replace(/\n/g, "\n            ");
}
