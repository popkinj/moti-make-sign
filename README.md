# MOTI-MAKE-SIGN

## Install
```
npm i moti-make-sign
```

## Creating data for incremental sign updates

You can create an incremental sign update with minimal attribution. This will contain only four variables.
1. segmentId: random # between <1-100>
1. postedSpeed: random # between <50 60 70 80 90 100>
1. postedDate: "Current time"
1. status: "Operational"

```javascript
const makeSign = require('moti-make-sign');
const sign = makeSign.bare();
```

Something like the following will be produced
```javascript
{
  segmentId: 7,
  postedSpeed: 60,
  postedDate: "2016-07-22T19:46:05.2127158Z",
  status: "Operational"
}
```

You can also pass in values for `segmentId` and `postedSpeed`.
```javascript
const options = {
  segmentId: 30,
  postedSpeed: 100
}
const sign = makeSign.bare(options);
```

## Creating data for full regular update (heartbeat)

There are many more attributes associated with the full sign object.
1. segmentId: random # between `1-100`
1. postedSpeed: random # between `50 60 70 80 90 100`
1. postedDate: "Current time"
1. status: "Operational"
1. direction: random `North South East West`
1. maxSpeed: 100
1. segmentName: "Sign ID"
1. vslsId:: "VSLS-ID"
1. lat: Random latitude coordinate
1. lon: Random longitude coordinate
1. history: 30 records of past speeds and timestamps

```javascript
const makeSign = require('moti-make-sign');
const sign = makeSign.full();
```

You can pass in additional parameters.
```javascript
const options = {
  segmentId: 30,
  postedSpeed: 100,
  direction: "North",
  historySize: 100
}

const sign = makeSign.full(options);
```

## Testing
```
npm test
```
