{_} = require 'lodash'

module.exports =
class Formatter
  # TODO: verify 'dartfmt' in path via 'which' or something
  @formatWhitespace: (fullPath) =>
    @format fullPath

  @formatCode: (fullPath) =>
    @format fullPath, ['-t']

  @format: (fullPath, options) =>
    spawn = require('child_process').spawn

    args = _.flatten([
      '-w',
      options || [],
      fullPath
    ])

    spawn "dartfmt", args
