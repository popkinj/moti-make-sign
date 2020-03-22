makeSign = require "#{__dirname}/../lib/ls/index"

options = do
  segmentId: 1
  postedSpeed: 60
  historySize: 10
  direction: 'West'
  header:
    fromEnvironment: "TEST"

console.log 'Testing incremental sign', makeSign.inc options

console.log 'Testing bare sign', makeSign.bare options

console.log 'Testing full sign', makeSign.full options
