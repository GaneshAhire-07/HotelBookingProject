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

// Search hotels endpoint
app.get('/search', async (req, res) => {
    const { name } = req.query;

    if (!name) {
        return res.status(400).json({ error: 'Hotel name is required' });
    }

    try {
        const [rows] = await connection.promise().query(
            'SELECT * FROM Hotel WHERE name LIKE ?',
            [`%${name}%`]
        );

        if (rows.length === 0) {
            return res.status(404).json({ error: 'No hotels found' });
        }

        res.status(200).json(rows);
    } catch (error) {
        console.error('Error searching for hotels:', error);
        res.status(500).json({ error: 'Internal Server Error' });
    }
});

// Start the server
app.listen(port, () => {
    console.log(`Server running at http://localhost:${port}`);
});
// Add new hotel endpoint
app.post('/addHotel', async (req, res) => {
    const { name, location, rating } = req.body;

    if (!name || !location || rating === undefined) {
        return res.status(400).json({ error: 'Name, location, and rating are required' });
    }

    try {
        const result = await connection.promise().query(
            'INSERT INTO Hotel (name, location, rating) VALUES (?, ?, ?)',
            [name, location, rating]
        );

        res.status(201).json({ message: 'Hotel added successfully', hotelId: result[0].insertId });
    } catch (error) {
        console.error('Error adding hotel:', error);
        res.status(500).json({ error: 'Internal Server Error' });
    }
});
