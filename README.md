# 🐾 Pet Tracker API

This is a lightweight Ruby on Rails API that receives and tracks pet location data from various types of trackers. It calculates which pets are currently outside the power saving zone and exposes that data via a RESTful interface.

---

## ✅ Features

- **POST `/api/v1/pets`**  
  Accepts pet tracking data and stores it in memory.

- **GET `/api/v1/pets/out_of_zone_summary`**  
  Returns a summary of pets _outside_ the power saving zone, grouped by pet type and tracker type.

- **Model Attributes**:
  - `pet_type`: `"Dog"` or `"Cat"`
  - `tracker_type`: `"small"`, `"medium"`, `"big"`
  - `owner_id`: Integer
  - `in_zone`: Boolean
  - `lost_tracker`: Boolean (Cats only)

- **In-Memory Storage**  
  Backed by SQLite for demo purposes. Logic is service-isolated for easy replacement with persistent storage.

- **Clean Architecture**  
  Core logic lives in service objects. Adheres to REST principles.

- **Test Coverage**
  - Request specs for all endpoints
  - Unit specs for business logic and model validations

---

## ⚙️ Getting Started

```bash
bundle install
rails server
```
---
## 🧪 Running Tests

This application uses **RSpec** for testing.

To execute the full test suite:

```bash
rspec
```

## 📡 Example Requests

### ➕ Create a Pet

```bash
curl -X POST http://localhost:3000/api/v1/pets \
  -H "Content-Type: application/json" \
  -d '{
    "pet": {
      "pet_type": "Dog",
      "tracker_type": "medium",
      "owner_id": 42,
      "in_zone": false,
      "lost_tracker": false
    }
  }'