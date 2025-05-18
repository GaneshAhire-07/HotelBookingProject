const express = require("express");
const mysql = require("mysql2");
const Joi = require("joi");
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
    console.log("Connected to the Booking Table");
  }
});

// Middleware for input validation using Joi
const validateBooking = (req, res, next) => {
  const schema = Joi.object({
    User_id: Joi.number().integer().required(),
    Hotel_id: Joi.number().integer().required(),
    NoOFNights: Joi.number().integer().required(),
    NoOFPeople: Joi.number().integer().required(),
    check_in_time: Joi.date().required(),
    check_out_time: Joi.date().required(),
    Payment_Status: Joi.string()
      .valid("completed", "draft")
      .required(),
  });

  const { error } = schema.validate(req.body);

  if (error) {
    return res.status(400).json({
      Error: error.details[0].message,
    });
  }

  next();
};

// API to create or update a booking
router.post("/api/booking", validateBooking, (req, res) => {
  const {User_id,Hotel_id,NoOFNights,NoOFPeople,check_in_time,check_out_time,Payment_Status,} = req.body;

  // Determine Booking_Status based on Payment_Status
  const Booking_Status =Payment_Status === "completed" ? "completed" : "draft";

  con.query("insert into Booking (User_id, Hotel_id, NoOFNights, NoOFPeople, check_in_time, check_out_time, Payment_Status, Booking_Status) values (?, ?, ?, ?, ?, ?, ?, ?)",
    [User_id,Hotel_id,NoOFNights,NoOFPeople,check_in_time,check_out_time,Payment_Status,Booking_Status,],
    (err, result) => {
      if (err) {
        console.log("MySQL query error:", err);
        return res.status(500).json({
          Error: "Internal Server Error",
        });
      }

      res.status(201).json({
        Message: `Booking ${Booking_Status} successfully`,
        Booking_ID: result.insertId,
        Booking_Status: Booking_Status,
      });
    }
  );
});

module.exports = router;
