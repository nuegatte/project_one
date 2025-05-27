# 📚 Console Library Management System

A simple **console-based library application** built in Dart. This project serves as a practical study of **software architecture principles**, especially:

- 🧱 MVC (Model-View-Controller) pattern
- 🔌 Abstraction and decoupling via interfaces
- ♻️ Clean, scalable project structure

---

## 🧠 Project Purpose

This is not just another CRUD app — the core focus is on **code architecture** rather than features. It’s designed to demonstrate **how to structure your software** so it’s:

- Decoupled
- Testable
- Maintainable
- Scalable for future features

---

## 🚧 Current Features

- Load and manage books from a JSON file
- Borrow and return books
- Track due dates and overdue status
- Display genre summaries and borrowing stats
- Modular services for books (`BookService`)
- Interface-driven architecture (`IBookService`)
- Controller class (`Library`) decoupled from implementations
- Console-based output for quick interaction

---

## 📂 Project Structure
lib/
├── model/
│ ├── book.dart # Data model
│ └── user.dart # (Planned) User model
│
├── services/
│ ├── i_book_service.dart # Abstract contract
│ ├── i_user_service.dart # Abstract contract
│ ├── book_service.dart # Concrete implementation
│ └── user_service.dart # Concrete implementation
│
├── controllers/
│ └── library.dart # Controller using services
│
└── main.dart # Entry point


---

## ⚙️ Architectural Highlights

### ✅ MVC Pattern

- **Model**: Pure Dart classes (`Book`, `User`)
- **View**: Console I/O (temporary stand-in for a UI)
- **Controller**: Business logic lives in `Library` and interacts via interfaces

### ✅ Interface-Driven Design

- Services use abstraction (e.g. `IBookService`) so that logic and dependencies are **swappable**.
- Ideal for testing, scaling, and extending functionality (e.g. Firebase or REST-based backend).

---

## 📈 Future Plans

- Add `UserService` and borrowing history
- Membership logic
- Replace console I/O with Flutter or Web UI
- Unit tests using mock services

---

## 🚀 How to Run

Make sure Dart SDK is installed.

```bash
dart run lib/main.dart
