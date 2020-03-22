# MOTI-MAKE-SIGN

## Install
```
npm i moti-make-sign
```

## Creating data for incremental sign updates *v1.5*
1. segmentId: random # between <1-100>
1. postedSpeed: random # between <50 60 70 80 90 100>
1. postedDate: "Current time"
1. status: "Operational"
1. header: {object}

The header object can contain any of the following:
```javascript
  {
    fromBusinessSystemName: 'Big Business',
    fromBusinessSystemVersion: 'version 2',
    fromEnvironment: 'DEV',
    targetEnvironment: 'DEV',
    messageSchemaVersion: 'version 1.5.0',
    messageSendDateTime: '2020-03-22T23:05:46Z',
    messageUuid: 'd33a9e93-8fce-4dd0-84a0-54e9e1606bbc'
  }
```

You can pass in additional parameters.
```javascript
const options = {
  segmentId: 30,
  postedSpeed: 100,
  direction: "North",
  historySize: 100
  header: {
    fromEnvironment: 'PROD'
  }
}

const sign = makeSign.inc(options);
```

## Creating data for incremental sign updates *v1.0*

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
