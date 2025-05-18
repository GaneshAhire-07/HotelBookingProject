const express = require('express');
const mysql = require('mysql2');
const router = express.Router();

const con = mysql.createConnection({
  host: "127.0.0.1",
  port:3306,
  user: "root",
  password: "dhanraj0304",
  database: "Hotel_Booking",
});

con.connect((err) => {
    if (err) 
        console.log("Error connecting to the database", err);
    else 
        console.log("Connected to the database VisitsRecords");
});

// Combined API to get hotel details and log a visit````````````````````````
router.get('/api/HotelDetailsAndVisit/:id', (req, res) => {
    const hotelId = req.params.id;
    const userId = req.query.UserID; // Assuming UserID is passed as a query parameter

    if (!userId) {
        return res.status(400).json({ Error: 'User ID is required' });
    }

    // Get hotel details
    con.query('SELECT * FROM Hotels WHERE hotel_id = ?', [hotelId], (err, results) => {
        if (err) {
            console.log('MySQL query error:', err);
            return res.status(500).json({ Error: 'Internal Server Error' });
        }
        if (results.length === 0) {
            return res.status(404).json({ Error: 'Hotel not found' });
        }

        const hotelDetails = results[0];

        // Log the visit
        con.query('INSERT INTO Visits (User_id, Hotel_id) VALUES (?, ?)', [userId, hotelId], (err, result) => {
            if (err) {
                console.log('MySQL query error:', err);
                return res.status(500).json({ Error: 'Internal Server Error' });
            }

            console.log("Customer Visit on hotel page", result);
            res.status(200).json({
                Message: 'Customer Visit on hotel page',
                HotelDetails: hotelDetails
            });
        });
    });
});

module.exports = router;
