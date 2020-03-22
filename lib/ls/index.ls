require! {
  moment
  'uuid-random': \uuid
}

# Create random method for all arrays
Array.prototype.rand = -> @[Math.floor(Math.random() * @length)]

# Random value generators
randomId = -> [1 to 100].rand!
randomSpeed = -> [50 60 70 80 90 100].rand!
randomDirection = -> [ "North" "South" "East" "West" ].rand!
randomLat = -> 50 + Math.random!
randomLon = -> -123 - Math.random!


/* ## header
  Create the header object
  @param o {object} Options for creating header
  @return {object} Header object
 */
header = (o) ->
  # Set up defaults
  fromBusinessSystemName    = if o?fromBusinessSystemName then that else "Big Business"
  fromBusinessSystemVersion = if o?fromBusinessSystemVersion then that else "version 2"
  fromEnvironment           = if o?fromEnvironment then that else "DEV"
  targetEnvironment         = if o?targetEnvironment then that else "DEV"
  messageSchemaVersion      = if o?messageSchemaVersion then that else "version 1.5.0"
  messageSendDateTime       = if o?messageSendDateTime then that else moment.utc!format('YYYY-MM-DDTHH:mm:ss') + 'Z'
  messageUuid               = if o?messageUuid then that else "d33a9e93-8fce-4dd0-84a0-54e9e1606bbc"

  {
    fromBusinessSystemName
    fromBusinessSystemVersion
    fromEnvironment
    targetEnvironment
    messageSchemaVersion
    messageSendDateTime
    messageUuid
  }



/* ## inc
  Create an increment sign update. This includes the new header
  for schema version 1.5. It will eventually replace the `bare`
  functionality.
  @param o {object} Options for creating the sign
  @return {object} incremental sign object
 */
inc = (o) ->
  id = if o?segmentId then that else randomId!
  speed = if o?postedSpeed then that else randomSpeed!

  segmentId: id
  postedSpeed: speed
  postedDate: moment.utc!format('YYYY-MM-DDTHH:mm:ss') + 'Z'
  status: 'Operational'
  header: header o.header


/* ## bare
  Create the most simple object for a sign. This mimicks
  the incremental update of a sign for schema version 1.0.
  This will be **DEPRECATED** in future releases.
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
  inc
  bare
  full
}
