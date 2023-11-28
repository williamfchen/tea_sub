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
Fork and clone this repo.  Run `bundle install` to install gems.  To run locally, enter `rails s` in your terminal under the tea_sub directory.  The port is set to 3000 for http://localhost:3000/

### Testing
This application uses RSpec.  Run `bundle exec rspec` to use the test suite.  After completion, `open coverage/index.html` to see the SimpleCov coverage report.

### Schema
```ruby
create_table "customers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subscriptions", force: :cascade do |t|
    t.string "title"
    t.string "price"
    t.string "status"
    t.string "frequency"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "customer_id", null: false
    t.bigint "tea_id", null: false
    t.index ["customer_id"], name: "index_subscriptions_on_customer_id"
    t.index ["tea_id"], name: "index_subscriptions_on_tea_id"
  end

  create_table "teas", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "temperature"
    t.string "brew_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "subscriptions", "customers"
  add_foreign_key "subscriptions", "teas"
```