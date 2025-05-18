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

con.connect(function(error){
    if(error) {
        console.log("Error connecting to the database", error);
    } else {
        console.log('Connected to the Users Table');
    }
});

// Login API without validation
router.post('/api/Login1', (req, res) => {
    const { Email, Pass } = req.body;

    con.query('select * from Users where email=? and Password=?', [Email, Pass], (err, results) => {
        if (err) {
            console.log('MySQL query error:', err);
            return res.status(500).json({
                Error: "Internal Server Error"
            });
        }
        
        if (results.length > 0) {
            console.log("Login Successfully", results);
            return res.status(200).json({
                Message: "Login Successful"
            });
        } else {
            console.log("Invalid Password or Email ID");
            return res.status(401).json({
                Error: "Invalid Password or Email ID"
            });
        }
    });
});

module.exports = router;
