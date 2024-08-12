# ⭐ Hotel Booking Project
## 📋 Introduction


**The HotelBooking database system efficiently manages hotel operations and bookings. This system comprises interconnected tables to handle data related to customers,** hotels, bookings, managers, user accounts, and visits.
 
 
 **Click This link & See the Demo :** https://drive.google.com/file/d/178Htentdkb9eJRh-qcrzCSXS87Sboppo/view?usp=drive_link


## 🗂️ Database Structure

   
  - Customer
  - Stores customer details.
    - Key Columns: CustomerID (Primary Key), FirstName, LastName, Email, PhoneNumber, Address, DateOfBirth.

  - Hotel
  -Contains information about hotels.
    - Key Columns: HotelID (Primary Key), HotelName, Location, Rating, TotalRooms, Amenities.

  - HotelBooking
  - Records hotel bookings.
    - Key Columns: BookingID (Primary Key), CustomerID (Foreign Key), HotelID (Foreign Key), BookingDate, CheckInDate, CheckOutDate, RoomNumber, TotalAmount.

  - HotelManager
  - Stores details about hotel managers.
       - Key Columns: ManagerID (Primary Key), HotelID (Foreign Key), FirstName, LastName, Email, PhoneNumber.

  - Visit
  - Logs user interactions within the system.
     - Key Columns: VisitID (Primary Key), UserID (Foreign Key), VisitDate, Activity.

## 🌐 API Endpoints

  - Login & Signup API
        Manages user authentication and account creation.
        Endpoints:
            POST /api/signup: Register a new user.
            POST /api/login: Authenticate a user.

- Search Hotel API
        Allows users to search for hotels.
        Endpoint: GET /api/hotels/search: Retrieve hotels based on search criteria.

- Hotel Details API
        - Provides detailed information about a specific hotel.
        - Endpoint: GET /api/hotels/:hotelId: Retrieve hotel details.

- Visit Logging API
        - Logs user visits and activities.
        - Endpoint: POST /api/visit/log: Record a user's visit.

- Booking Completion API
        - Finalizes hotel bookings.
        - Endpoint: POST /api/bookings/complete: Complete a booking.

## 🖥️ Pages Overview

   - Login Page
        - User authentication gateway.
        - Features: Login fields, "Remember Me" option, links to registration and password recovery.

   - Registration Page
        - New user account creation.
        - Features: User information fields, validation, link to login.

  - Forgot Password Page
        - Password recovery for users.
        - Features: Email input, reset link, optional security question.

## 🛠️ Technologies Used

  - Front-End: HTML, CSS, JavaScript
  - Back-End: Node.js, Express.js, JavaScript
  - Database: MySQL

