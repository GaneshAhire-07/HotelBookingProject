const express = require('express');
const mysql = require('mysql2');
const path = require('path');
const bcrypt = require('bcrypt');  // For password hashing
const app = express();
const port = 3000;

// Middleware to parse JSON data
app.use(express.json());

app.get('/favicon.ico', (req, res) => res.status(204));
// Serve static files (HTML, CSS, JS)
app.use(express.static(path.join(__dirname, 'public')));

// MySQL Database connection
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
        return;
    }
    console.log('Connected to the database');
});

// Route to serve signup.html
app.get('/signup', (req, res) => {
    res.sendFile(path.join(__dirname, 'public/signup.html'));
});

// Route to serve login.html
app.get('/login', (req, res) => {
    res.sendFile(path.join(__dirname, 'public/login.html'));
});

// Handle POST request from the signup form
app.post('/signup', async (req, res) => {
    const { fname, lname, email, phone_number, password } = req.body;

    if (fname && lname && email && phone_number && password) {
        try {
            // Check if the email is already registered
            const [existingUser] = await connection.promise().query('SELECT * FROM Customer WHERE email = ?', [email]);
            if (existingUser.length > 0) {
                return res.status(400).json({ error: 'Email is already registered.' });
            }

            // Hash the password
            const hashedPassword = await bcrypt.hash(password, 10);

            // Insert the new user into the database
            const result = await connection.promise().query(
                'INSERT INTO Customer (fname, lname, email, password, phone_number) VALUES (?, ?, ?, ?, ?)',
                [fname, lname, email, hashedPassword, phone_number]
            );

            res.status(201).json({
                message: 'Signup successful',
                name: `${fname} ${lname}`,
                email: email
            });
        } catch (error) {
            console.error('Error during signup:', error);
            res.status(500).json({ error: 'Internal Server Error' });
        }
    } else {
        res.status(400).json({ error: 'All fields are required.' });
    }
});

// Handle POST request from the login form
app.post('/login', async (req, res) => {
    const { email, password } = req.body;

    if (email && password) {
        try {
            // Find the user by email
            const [user] = await connection.promise().query('SELECT * FROM Customer WHERE email = ?', [email]);
            if (user.length === 0) {
                return res.status(401).json({ error: 'Invalid email or password.' });
            }

            // Compare the password with the hashed password in the database
            const match = await bcrypt.compare(password, user[0].password);
            if (!match) {
                return res.status(401).json({ error: 'Invalid email or password.' });
            }

            res.status(200).json({ message: 'Login successful', email: email });
        } catch (error) {
            console.error('Error during login:', error);
            res.status(500).json({ error: 'Internal Server Error' });
        }
    } else {
        res.status(400).json({ error: 'Email and password are required.' });
    }
});

// Start the server
app.listen(port, () => {
    console.log(`Server is running on http://localhost:${port}`);
});
