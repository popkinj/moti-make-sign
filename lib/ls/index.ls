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
  postedSpeed:speed
  postedDate: moment!format 'YYYY-MM-DDThh:mm:sss'
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

  # Create the history array
  history = []
  for n from 1 to historySize
    time = moment!subtract(n * 10, 'minutes')
      .format 'YYYY-MM-DDThh:mm:sss'

    history.push do
      postedDate: time
      postedSpeed: randomSpeed!

  segmentId: id
  postedSpeed:speed
  postedDate: moment!format 'YYYY-MM-DDThh:mm:sss'
  status: 'Operational'
  direction: direction
  maxSpeed: 100
  segmentName: "Sign #id"
  vslsId: "VSLS-#id"
  lat: randomLat!
  lon: randomLon!
  history: history

module.exports = {
  bare
  full
}
