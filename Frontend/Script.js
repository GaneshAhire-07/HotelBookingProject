document.getElementById("signupForm").addEventListener("submit", function(event) {
    event.preventDefault();

    const formData = {
        Email: document.getElementById("Email").value,
        CustomerName: document.getElementById("CustomerName").value,
        Phoneno: document.getElementById("Phoneno").value,
        Pass: document.getElementById("Pass").value,
        ConfirmPass: document.getElementById("ConfirmPass").value
    };

    fetch('http://127.0.0.1:3000/api/Sign_Up', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(formData)
    })
    .then(response => response.json())
    .then(data => {
        if (data.Error) {
            document.getElementById("message").textContent = data.Error;
        } else {
            document.getElementById("message").textContent = "Registration successful!";
            document.getElementById("signupForm").reset();
            
            // Redirect to SearchHotels3.html after successful registration
            window.location.href = "SearchHotels3.html";
        }
    })
    .catch(error => {
        document.getElementById("message").textContent = "An error occurred. Please try again.";
        console.error("Error:", error);
    });
});
