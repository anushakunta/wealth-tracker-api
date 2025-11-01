# Backend (Rails 7.1 API + JWT + Serializer)
### 🟥 **Backend README.md Template**

```markdown
# Wealth Tracker – Backend API

A secure **Rails 7 API** with **JWT authentication** and **PostgreSQL**, powering income and expense tracking with RESTful endpoints and seeded demo data.

## 🧩 Features
- JWT-based authentication (login & register).
- CRUD endpoints for managing transactions.
- Seeded demo user for quick testing.
- CORS enabled for React frontend integration.

## 🛠️ Tech Stack
Ruby on Rails 7 • PostgreSQL • JWT • ActiveModel Serializers

## Setup
bundle install
rails db:create db:migrate db:seed
rails s

Base URL: http://localhost:3000

Endpoints:
- POST /register
- POST /login
- GET  /transactions
- POST /transactions
- DELETE /transactions/:id

Demo: demo@example.com / password
