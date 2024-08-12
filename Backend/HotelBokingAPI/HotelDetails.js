const express = require('express');
const mysql = require('mysql2');
const app = express(); // Define the app variable here
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

// Define the route to get hotel details
app.get('/hotel', async (req, res) => {
    const { id } = req.query;

    if (!id) {
        return res.status(400).json({ error: 'Hotel ID is required' });
    }

    try {
        const [rows] = await connection.promise().query('SELECT * FROM Hotel WHERE id = ?', [id]);

        if (rows.length === 0) {
            return res.status(404).json({ error: 'Hotel not found' });
        }

        res.status(200).json(rows[0]);
    } catch (error) {
        console.error('Error retrieving hotel details:', error);
        res.status(500).json({ error: 'Internal Server Error' });
    }
});

// Start the server
app.listen(port, () => {
    console.log(`Server running at http://localhost:${port}`);
});
