const express = require('express');
// const model = require('./model.js');
const pg = require('../pgdb/index.js')

const router = express.Router();

router.get('/api/:id?', (req, res) => {
  pg.getBookingsByListingId(req, res);
});

router.post('/api/:id?', (req, res) => {
  // console.log(req.body, `this is req`)
  pg.AddBooking(req, res);

});

module.exports.router = router;
