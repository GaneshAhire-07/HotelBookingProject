# HotelBooking API Documentation

## Overview

This documentation provides details on the API endpoints available for interacting with the HotelBooking system. The system includes functionality for creating new hotel bookings.

## Endpoints

### 1. Create a New Booking

**Endpoint:** `/bookings`

**Method:** `POST`

**Description:** Create a new booking for a hotel.

**Request Body:**

```json
{
  "customer_id": Number,
  "hotel_id": Number,
  "check_in": "YYYY-MM-DD",
  "check_out": "YYYY-MM-DD"
}
```
