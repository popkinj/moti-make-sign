require! {
  moment
}

# Create random method for all arrays
Array.prototype.rand = -> @[Math.floor(Math.random() * @length)]

# Random value generators
randomId = -> [1 to 100].rand!
randomSpeed = -> [50 60 70 80 90 100].rand!
randomDirection = -> [ "North" "South" "East" "West" ].rand!
randomLat = -> 50 + Math.random!
randomLon = -> -123 - Math.random!

/* ## bare
  Create the most simple object for a sign. This mimicks
  the incremental update of a sign.
  @param o {object} Options for create the sign
  @return {object} the minimal sign object
 */
bare = (o) ->
  id = if o?segmentId then that else randomId!
  speed = if o?postedSpeed then that else randomSpeed!

  segmentId: id
  postedSpeed: speed
  postedDate: moment.utc!format('YYYY-MM-DDTHH:mm:ss') + 'Z'
  status: 'Operational'

/* ## full
  Create the full sign object.
  This included the sign history array
  @param o {object} Options for create the sign
  @return {object} the full sign object
 */
full = (o) ->
  id = if o?segmentId then that else randomId!
  speed = if o?postedSpeed then that else randomSpeed!

  direction = if o?direction then that else randomDirection!
  historySize = if o?historySize then that else 30

  dir = direction.charAt 0
  vslsId = "VSLS-1-#id#dir"
  # vslsId = 'VSLS-1-304W'

  # Create the history array
  history = []
  for n from 1 to historySize
    time = moment!subtract(n * 10, 'minutes')
      .utc!format('YYYY-MM-DDTHH:mm:ss') + 'Z'

    history.push do
      postedDate: time
      postedSpeed: randomSpeed!

  segmentId: id
  isSegmentEnabled : true
  postedSpeed:speed
  postedDate: moment.utc!format('YYYY-MM-DDTHH:mm:ss') + 'Z'
  status: 'Operational'
  direction: direction
  maxSpeed: 100
  segmentName: "Sign #id"
  vslsId: vslsId
  lat: randomLat!
  lon: randomLon!
  historicalSpeeds: history

module.exports = {
  bare
  full
}
