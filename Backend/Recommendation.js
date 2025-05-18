const express = require("express");
const mysql = require("mysql2");
const router = express.Router();

const con = mysql.createConnection({
  host: "127.0.0.1",
  port:3306,
  user: "root",
  password: "dhanraj0304",
  database: "Hotel_Booking",
});

con.connect((err) => {
  if (err) {
    console.log("Error connecting to the database", err);
  } else {
    console.log("Connected to the tables Visits,Hotels,Booking");
  }
});

// API to get recommended hotels for a user
router.get("/api/recommendations/:User_id", (req, res) => {
  const userId = parseInt(req.params.User_id, 10);

  if (isNaN(userId)) {
    return res.status(400).json({ Error: "Invalid User ID" });
  }

  // Get hotels visited or booked by the user
  const visitedOrBookedQuery = `
    select distinct h.hotel_id, h.rating, h.price_per_night, h.Area, h.City, h.State from Hotels h where h.hotel_id in 
    (select distinct Hotel_id from Visits where User_id = ? union select distinct Hotel_id from Booking where User_id = ?)`;

  con.query(visitedOrBookedQuery, [userId, userId], (err, results) => {
    if (err) {
      console.log("MySQL query error:", err);
      return res.status(500).json({ Error: "Internal Server Error" });
    }

    if (results.length === 0) {
      return res.status(200).json({ Message: "No past visits or bookings found", Recommendations: [] });
    }

    const visitedOrBookedHotels = results.map(row => row.hotel_id);
    const { rating, price_per_night, Area, City, State } = results[0];

    // Find similar hotels based on criteria
    const recommendedQuery = `
      select h.hotel_id, h.name as hotel_name, h.address, h.rating, h.price_per_night, h.discount, h.available, h.Area, h.City, h.State
      from Hotels h where h.hotel_id not in (?) and ABS(h.rating - ?) <= 0.5 and ABS(h.price_per_night - ?) <= 500
      and h.Area = ? and h.City = ? and h.State = ? `;

    con.query(recommendedQuery, [visitedOrBookedHotels, rating, price_per_night, Area, City, State], (err, results) => {
      if (err) {
        console.log("MySQL query error:", err);
        return res.status(500).json({ Error: "Internal Server Error" });
      }

      res.status(200).json({
        Message: "Recommended hotels fetched successfully",
        Recommendations: results,
      });
    });
  });
});

module.exports = router;
