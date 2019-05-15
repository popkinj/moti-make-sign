makeSign = require "#{__dirname}/../lib/ls/index"

options = do
  segmentId: 1

testing = makeSign.bare options
console.log testing