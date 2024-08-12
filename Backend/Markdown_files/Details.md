# HotelBooking API Documentation

## Overview

This documentation provides details on the API endpoints available for interacting with the HotelBooking system. The system includes functionality for retrieving hotel details.

## Endpoints

### 1. Get Hotel Details

**Endpoint:** `/hotel`

**Method:** `GET`

**Description:** Retrieve details of a specific hotel by its ID.

**Query Parameters:**

- `id`: (string) The ID of the hotel to retrieve. This parameter is required.

**Response:**

- `200 OK`: Returns the details of the hotel.

  ```json
  {
    "id": Number,
    "name": "String",
    "location": "String",
    "rating": Number
  }
  ```
