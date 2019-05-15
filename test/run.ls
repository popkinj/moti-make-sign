makeSign = require "#{__dirname}/../lib/ls/index"

options = do
  segmentId: 1
  postedSpeed: 60

console.log 'Testing bare sign', makeSign.bare options

console.log 'Testing full sign', makeSign.full options