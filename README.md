# MSIT 114 - Activity 18 - Flask API

This project is a simple **Flask API** for managing train data, developed as part of MSIT 114 coursework.

---

## Requirements

Before running the project, install:

- Python 3.10 or newer
- MySQL server
- `pip`

## Installation & Setup

### Step 1: Clone the Repository
```bash
git clone https://github.com/jesselzapanta09/train-flask-api.git
cd train-flask-api
```

### Step 2: Install Dependencies
```bash
python -m venv .venv
.venv\Scripts\activate
pip install -r requirements.txt
```

### Step 3: Import the Database

1. Open your MySQL client (e.g., MySQL Workbench, phpMyAdmin, or CLI).
2. Create a new database:
```sql
   CREATE DATABASE traindb;
```
3. Import the provided SQL file(**traindb.sql**)

### Step 4: Run the Server
```bash
python run.py
```

The API should now be running at `http://localhost:5000`.

---

# API Endpoints

| Method | Endpoint       | Description          |
|--------|----------------|----------------------|
| POST   | `api/login`       | Login User        |
| POST   | `api/register`    | Register User     |
| POST   | `api/logout`      | Log out User      |
| GET    | `api/trains`      | Get all trains    |
| GET    | `api/trains/:id`  | Get a train by ID |
| POST   | `api/trains`      | Add a new train   |
| PUT    | `api/trains/:id`  | Update a train    |
| DELETE | `api/trains/:id`  | Delete a train    |


## Author

**Jessel Zapanta** — MSIT 114