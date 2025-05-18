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
    if (err) 
        console.log("Not Connected to the Database", err);
    else 
        console.log("Connected to the Hotels Table");
});

// Search Hotels API
router.get('/api/SearchHotels', (req, res) => {
    const { Name, Area, City, State, Rating, Price } = req.query;

let query = 'select * from Hotels where 1=1';
const queryParams = [];

if (Name) {
    query += ' and name like ?';
    queryParams.push(`%${Name}%`);
}
if (Area) {
    query += ' and area like ?';
    queryParams.push(`%${Area}%`);
}
if (City) {
    query += ' and city like ?';
    queryParams.push(`%${City}%`);
}
if (State) {
    query += ' and state like ?';
    queryParams.push(`%${State}%`);
}
if (Rating) {
    query += ' and rating <= ?';
    queryParams.push(Rating);
}
if (Price) {
    query += ' and price_per_night <= ?';
    queryParams.push(Price);
}

con.query(query, queryParams, (err, results) => {
    if (err) {
        return res.status(500).json({ Error: 'An error occurred while searching for hotels.' });
    }
    res.json({ Hotels: results });
});

});

module.exports = router;
