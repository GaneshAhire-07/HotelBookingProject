const express = require('express');
const mysql = require('mysql2');
const bcrypt = require('bcrypt');
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

// Create Customer
app.post('/customers', async (req, res) => {
    const { fname, lname, email, password, phone_number } = req.body;

    if (!fname || !lname || !email || !password) {
        return res.status(400).json({ error: 'All required fields must be provided' });
    }

    try {
        const hashedPassword = await bcrypt.hash(password, 10);

        const [result] = await connection.promise().query(
            'INSERT INTO Customer (fname, lname, email, password, phone_number) VALUES (?, ?, ?, ?, ?)',
            [fname, lname, email, hashedPassword, phone_number]
        );

        res.status(201).json({ message: 'Customer created successfully', customerId: result.insertId });
    } catch (error) {
        console.error('Error creating customer:', error);
        res.status(500).json({ error: 'Internal Server Error' });
    }
});

// Create Hotel Manager
app.post('/managers', async (req, res) => {
    const { fname, lname, email, password, phone_number, hotel_id } = req.body;

    if (!fname || !lname || !email || !password || !hotel_id) {
        return res.status(400).json({ error: 'All required fields must be provided' });
    }

    try {
        const hashedPassword = await bcrypt.hash(password, 10);

        const [result] = await connection.promise().query(
            'INSERT INTO HotelManager (fname, lname, email, password, phone_number, hotel_id) VALUES (?, ?, ?, ?, ?, ?)',
            [fname, lname, email, hashedPassword, phone_number, hotel_id]
        );

        res.status(201).json({ message: 'Hotel Manager created successfully', managerId: result.insertId });
    } catch (error) {
        console.error('Error creating hotel manager:', error);
        res.status(500).json({ error: 'Internal Server Error' });
    }
});

// Get all visits
app.get('/visits', async (req, res) => {
    try {
        const [rows] = await connection.promise().query('SELECT * FROM Visit');
        res.status(200).json(rows);
    } catch (error) {
        console.error('Error retrieving visits:', error);
        res.status(500).json({ error: 'Internal Server Error' });
    }
});

// Get a specific visit by ID
app.get('/visits/:id', async (req, res) => {
    const { id } = req.params;

    try {
        const [rows] = await connection.promise().query('SELECT * FROM Visit WHERE id = ?', [id]);

        if (rows.length === 0) {
            return res.status(404).json({ error: 'Visit not found' });
        }

        res.status(200).json(rows[0]);
    } catch (error) {
        console.error('Error retrieving visit:', error);
        res.status(500).json({ error: 'Internal Server Error' });
    }
});

// Create a new visit
app.post('/visits', async (req, res) => {
    const { custid, hotelid, timestamp } = req.body;

    if (!custid || !hotelid || !timestamp) {
        return res.status(400).json({ error: 'Customer ID, Hotel ID, and Timestamp are required' });
    }

    try {
        const [result] = await connection.promise().query(
            'INSERT INTO Visit (custid, hotelid, timestamp) VALUES (?, ?, ?)',
            [custid, hotelid, timestamp]
        );

        const visitId = result.insertId;
        res.status(201).json({ message: 'Visit created successfully', visitId });
    } catch (error) {
        console.error('Error creating visit:', error);
        res.status(500).json({ error: 'Internal Server Error' });
    }
});

// Start the server
app.listen(port, () => {
    console.log(`Server running at http://localhost:${port}`);
});
