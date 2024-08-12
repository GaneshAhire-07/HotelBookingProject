const express = require('express');
const mysql = require('mysql2');
const app = express();  // Initialize Express app
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

// Registration endpoint
app.post('/signup', async (req, res) => {
    const { fname, lname, email, phone_number, password } = req.body;

    if (!fname || !lname || !email || !phone_number || !password) {
        return res.status(400).json({ error: 'All fields are required' });
    }

    try {
        const [rows] = await connection.promise().query('SELECT * FROM UserAccount WHERE email = ?', [email]);
        if (rows.length > 0) {
            return res.status(400).json({ error: 'Email is already registered' });
        }

        // Insert the new user into the database
        const result = await connection.promise().query(
            'INSERT INTO UserAccount (fname, lname, email, phone_number, password) VALUES (?, ?, ?, ?, ?)',
            [fname, lname, email, phone_number, password]
        );

        const newUserId = result[0].insertId;

        res.status(201).json({
            id: newUserId,
            fname: fname,
            lname: lname,
            email: email,
            phone_number: phone_number
        });
    } catch (error) {
        console.error('Error registering user:', error);
        res.status(500).json({ error: 'Internal Server Error' });
    }
});

// Login endpoint
app.post('/login', async (req, res) => {
    const { email, password } = req.body;

    if (!email || !password) {
        return res.status(400).json({ error: 'Email and password are required' });
    }

    try {
        const [rows] = await connection.promise().query('SELECT * FROM UserAccount WHERE email = ?', [email]);

        if (rows.length === 0) {
            return res.status(401).json({ error: 'Invalid email or password' });
        }

        const user = rows[0];

        // Compare the password directly without hashing
        if (password !== user.password) {
            return res.status(401).json({ error: 'Invalid email or password' });
        }

        res.status(200).json({
            id: user.id,
            name: `${user.fname} ${user.lname}`,
            email: user.email,
            phone_number: user.phone_number
        });
    } catch (error) {
        console.error('Error logging in user:', error);
        res.status(500).json({ error: 'Internal Server Error' });
    }
});

// Start the server
app.listen(port, () => {
    console.log(`Server running at http://localhost:${port}`);
});
