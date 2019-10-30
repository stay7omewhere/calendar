# Calendar Reservation
Reservation and lodging information microservice for a hotel reservation web application

## Table of Contents
1. [Requirements](#requirements)
1. [API](#API)
1. [Dependencies](#Installing Dependencies)

## Requirements
- Node v8.15.x
- MySQL v5.7.x
- npm v6.10.x
- docker

## API
### URL
`localhost:3004/rooms/:id`
Dynamically render playlist based on id of the entrypoint url.

### GET
`/api/:id`
Retrieve a playlist based on id.

### POST
`/api/:id``
Update the liked status of a song based on id.

### Installing Dependencies
From within the root directory

1. Install project dependencies
```javascript
npm install
```

2. Create MySQL Database
```javascript
npm run db
```

3. Seed MySQL Database
```javascript
npm run seed-data
```

4. Build the microservice bundle
```javascript
npm run build
```

5. To start the server
```javascript
npm run server
```

6. Go to see the component at `localhost:3004/rooms/1`
