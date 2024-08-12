# HotelBooking API Documentation

## Overview

This documentation provides details on the API endpoints available for interacting with the HotelBooking system. The system includes functionality for managing customers, hotel managers, and visits.

## Endpoints

### 1. Create Customer

**Endpoint:** `/customers`

**Method:** `POST`

**Description:** Create a new customer in the system.

**Request Body:**

```json
{
  "fname": "String",
  "lname": "String",
  "email": "String",
  "password": "String",
  "phone_number": "String"
}
```
