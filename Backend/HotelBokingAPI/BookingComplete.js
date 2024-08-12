const express = require('express');
const mysql = require('mysql2');
const app = express();
const port = 5000;

// Middleware to parse JSON bodies
app.use(express.json());

// Create a connection to the database
const connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'issc123',
    database: 'HotelBooking'
});

// Connect to the database
connection.connect((err) => {
    if (err) {
        console.error('Error connecting to the database:', err.stack);
        process.exit(1); // Exit if connection fails
    }
    console.log('Connected to the database');
});

// Complete Booking: Create a new booking
app.post('/bookings', async (req, res) => {
    const { customer_id, hotel_id, check_in, check_out } = req.body;

    if (!customer_id || !hotel_id || !check_in || !check_out) {
        return res.status(400).json({ error: 'All booking details are required' });
    }

    try {
        const [result] = await connection.promise().query(
            'INSERT INTO HotelBooking (customer_id, hotel_id, check_in, check_out) VALUES (?, ?, ?, ?)',
            [customer_id, hotel_id, check_in, check_out]
        );

        const bookingId = result.insertId;

        res.status(201).json({
            message: 'Booking created successfully',
            bookingId
        });
    } catch (error) {
        console.error('Error creating booking:', error);
        res.status(500).json({ error: 'Internal Server Error' });
    }
});

// Start the server
app.listen(port, () => {
    console.log(`Server running at http://localhost:${port}`);
});
