// Handle Signup Form Submission
document.getElementById('signupForm').addEventListener('submit', async (e) => {
    e.preventDefault();

    const fname = document.getElementById('fname').value;
    const lname = document.getElementById('lname').value;
    const email = document.getElementById('email').value;
    const phone_number = document.getElementById('phone_number').value;
    const password = document.getElementById('password').value;

    const response = await fetch('/signup', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ fname, lname, email, phone_number, password })
    });

    const result = await response.json();
    document.getElementById('responseMessage').textContent = result.message || result.error;
});

// Handle Login Form Submission
// Handle Login Form Submission
document.getElementById('loginForm').addEventListener('submit', async function (event) {
    event.preventDefault();

    const email = document.getElementById('email').value;
    const password = document.getElementById('password').value;

    try {
        const response = await fetch('/login', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ email, password })
        });

        const result = await response.json();

        const responseMessage = document.getElementById('responseMessage');
        if (response.ok) {
            // Display success message
            responseMessage.textContent = 'Login successful!';
            responseMessage.style.color = 'green';
        } else {
            // Display error message returned from the server
            responseMessage.textContent = result.error || 'Invalid email or password';
            responseMessage.style.color = 'red';
        }
    } catch (error) {
        console.error('Error during login:', error);
        document.getElementById('responseMessage').textContent = 'An error occurred. Please try again.';
        document.getElementById('responseMessage').style.color = 'red';
    }
});

// Toggle password visibility
document.getElementById('togglePassword').addEventListener('click', function () {
    const passwordField = document.getElementById('password');
    const type = passwordField.type === 'password' ? 'text' : 'password';
    passwordField.type = type;
    this.textContent = type === 'password' ? '\u{1F441}' : '\u{1F440}';
});
