const colors = require('colors/safe')

exports.quiet = false

exports.error = (msg) => {
  console.error(colors.red('error') + ' ' + toString(msg))
}

exports.warn = (msg) => {
  if (exports.quiet) {return}
  console.warn(' ' + colors.yellow('warn') + ' ' + toString(msg))
}

exports.info = (msg) => {
  if (exports.quiet) {return}
  console.info(' ' + colors.blue('info') + ' ' + toString(msg))
}

exports.debug = (msg) => {
  if (exports.quiet) {return}
  console.info(colors.grey('debug') + ' ' + toString(msg))
}

function toString(obj) {
  if (typeof message === 'object') {
    return padNewlines(JSON.stringify(obj))
  } else {
    return padNewlines(obj)
  }
}

function padNewlines(text) {
  return text.replace(/\n/g, "\n            ");
}
