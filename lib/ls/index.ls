require! {
  moment
}

# Create random method for all arrays
Array.prototype.rand = -> @[Math.floor(Math.random() * @length)]

randomId = -> [1 to 100].rand!

randomSpeed = -> [50 60 70 80 90 100].rand!

bare = (o) ->
  id = if o.segmentId then that else randomId!
  speed = if o.postedSpeed then that else randomSpeed!

  sign = do
    segmentId: id
    postedSpeed:speed
    postedDate: moment!format!
    status: 'Operational'
  sign

module.exports = {
  bare
}