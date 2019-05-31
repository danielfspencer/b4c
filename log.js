const colors = require('colors/safe')

exports.error = (msg) => {
  console.error(colors.red('error') + ' ' + toString(msg))
}

exports.warn = (msg) => {
  console.warn(' ' + colors.yellow('warn') + ' ' + toString(msg))
}

exports.info = (msg) => {
  console.info(' ' + colors.blue('info') + ' ' + toString(msg))
}

exports.debug = (msg) => {
  console.debug(colors.grey('debug') + ' ' + toString(msg))
}

function toString (obj) {
  if (typeof message === 'object') {
    return JSON.stringify(obj)
  } else {
    return obj
  }
}
