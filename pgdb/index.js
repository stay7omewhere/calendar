const Pool = require('pg').Pool

const pool = new Pool({
  user: 'jimmyma',
  host: 'localhost',
  database: 'postgressdc',
})

pool.on('error', (err) => {
    console.log('An idle client has experienced an error', err.stack)
})

const getBookingsByListingId = (request, response) => {
  const id = parseInt(request.params.id)

  pool.query('SELECT Listing.Listing_ID, Mon_min,Tue_min, Wed_min, Thu_min, Fri_min, Sat_min, Sun_min, Max_Stay, Check_in, Check_out FROM Listing INNER JOIN Booking on Booking.Listing_ID = Listing.Listing_ID WHERE Listing.Listing_ID = $1', [id], (error, results) => {
    if (error) {
      throw error
    }

    // console.log('results: ', results.rows)
    response.status(200).json(results.rows)
  })
}

const AddBooking = (request, response) => {
//   const { Check_in, Check_out } = request.body
  const Listing_ID = request.body.Listing_ID;
  const Check_in = request.body.Check_in;
  const Check_out = request.body.Check_out;


  pool.query('INSERT INTO Booking (Booked_ID, Check_in, Check_out, Listing_ID) VALUES (DEFAULT, $1, $2, $3)', [Check_in, Check_out, Listing_ID], (error, results) => {
    if (error) {
      throw error
    }
    response.status(201).send(`Booking added with ID: ${results}`)
  })
}

module.exports = {
    getBookingsByListingId,
    AddBooking
  }



//   SELECT Listing.Listing_ID, Mon_min,Tue_min, Wed_min, Thu_min, Fri_min, Sat_min, Sun_min, Max_Stay FROM Listing INNER JOIN Booking on Booking.Listing_ID = Listing.Listing_ID WHERE Listing.Listing_ID = $1'