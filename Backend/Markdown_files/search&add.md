# API Documentation

## Overview

This documentation provides details on the API endpoints available for interacting with the HotelBooking system. The system allows for hotel management and purchase transactions.

## Endpoints

### 1. Search Hotels

**Endpoint:** `/search`

**Method:** `GET`

**Description:** Search for hotels by name.

**Query Parameters:**

- `name`: (string) The name of the hotel to search for. This parameter is required.

**Response:**

- `200 OK`: Returns a list of hotels matching the search criteria.
- `400 Bad Request`: If the `name` parameter is missing.
- `404 Not Found`: If no hotels are found.
- `500 Internal Server Error`: If an error occurs on the server.

### 2. Add New Hotel

**Endpoint:** `/addHotel`

**Method:** `POST`

**Description:** Add a new hotel to the database.

**Request Body:**

```json
{
  "name": "String",
  "location": "String",
  "rating": Number
}
```
