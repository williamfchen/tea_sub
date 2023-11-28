# Tea Subscription Service API

The Tea Subscription Service API (Version 1) provides an interface for managing tea subscriptions for customers. This API allows clients to subscribe a customer to a tea subscription, cancel a subscription, and view all subscriptions for a customer.

## Endpoints

All endpoints are prefixed with `/api/v1`.

### Subscribe a Customer to a Tea Subscription

- **POST** `/api/v1/customers/:customer_id/subscriptions`

  Creates a new subscription for a customer.

  **Parameters:**
  - `title` (String): Title of the subscription.
  - `price` (String): Price of the subscription.
  - `status` (String): Status of the subscription (e.g., 'active').
  - `frequency` (String): Frequency of the subscription (e.g., 'monthly').
  - `tea_id` (Integer): ID of the tea associated with the subscription.

  **Example Request:**
  ```json
  {
    "subscription": {
      "title": "Monthly Tea Subscription",
      "price": "15.00",
      "status": "active",
      "frequency": "monthly",
      "tea_id": 1
    }
  }

### Cancel a Customer’s Tea Subscription

- **PATCH** `/api/v1/subscriptions/:id/cancel`

  Cancels an existing subscription.

  **Parameters:**
  - `id` (Integer): ID of the subscription to be cancelled.

### See All Subscriptions for a Customer (Active and Cancelled)

- **GET** `/api/v1/customers/:customer_id/subscriptions`

  Retrieves all subscriptions (active and cancelled) for a specific customer.

  **Parameters:**
  - `customer_id` (Integer): ID of the customer whose subscriptions are being requested.

### Setup
To run locally, enter `rails s` in your terminal.  The port is set to 3000 for http://localhost:3000/