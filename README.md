# 📰 NewsApp (SwiftUI + MVVM)

**NewsApp** is a modern iOS application built with **SwiftUI** that fetches and displays news articles using the **News API**.  
The project follows the **MVVM architecture**, uses the new **`@Observable` macro** for state management, and includes **unit tests, UI tests, and mocking** to ensure reliability and maintainability.

## Demo
<p align="center">
  <img src="./assets/NewAppDemo.gif" width="420" alt="MathGame Demo" />
</p>

---

## ✨ Features

- 📰 Fetch latest news from **News API**
- 🔎 Display articles in a clean, responsive list
- 📄 Article details view
- ⚡ Async await network requests
- 🧱 MVVM architecture
- 👀 State management using **`@Observable` macro**
- 🧪 Unit testing with mocking
- 📱 UI testing for user flows
- 🔄 Dependency injection for testability

---

## 🧰 Tech Stack

| Category | Technology |
|-----------|------------|
| **Language** | Swift |
| **UI Framework** | SwiftUI |
| **Architecture** | MVVM |
| **State Management** | `@Observable` |
| **Networking** | URLSession |
| **API** | News API |
| **Testing** | XCTest (Unit + UI Tests) |
| **Mocking** | Protocol-based mocking |
| **Platform** | iOS |
| **Minimum iOS** | iOS 17+ |
| **IDE** | Xcode |

---

## 📌 Project Overview

This project demonstrates:

- Building a production-style SwiftUI app
- Fetching remote data from a REST API
- Using MVVM for separation of concerns
- Binding ViewModel state using `@Observable`
- Writing unit tests with mocked network services
- Implementing UI tests for user interaction flows

The app fetches news articles and displays them in a user-friendly interface.

---

## 🧱 Architecture

The project follows **MVVM (Model–View–ViewModel)**:

    View → ViewModel → Service → Network/API


### 🔹 View
- SwiftUI views
- React to state changes from ViewModel

### 🔹 ViewModel
- Handles business logic
- Fetches data from service layer
- Exposes observable state using `@Observable`

### 🔹 Service Layer
- Handles API communication
- Abstracted using protocols
- Enables mocking for tests

---

## 🌐 Networking Layer

- Uses `URLSession` for API requests
- Parses JSON responses using `Codable`
- Error handling for:
  - Network failures
  - Invalid responses
  - Decoding errors

API example:

    https://newsapi.org/v2/top-headlines?country=us&apiKey=YOUR_API_KEY


---

## 🧪 Testing Strategy

This project includes:

### ✅ Unit Tests
- Tests for ViewModel logic
- Mocked network service
- Dependency injection
- Verifies:
  - Successful fetch
  - Error handling
  - State updates

### 📱 UI Tests
- Tests main user flows
- Validates UI rendering
- Ensures navigation works correctly

### 🧪 Mocking

- Protocol-based abstraction for network service
- Mock services injected into ViewModel
- Enables isolated testing without real API calls

Example concept:

    protocol NewsServiceProtocol
        ↓
    RealNewsService
    MockNewsService


---

## 🚀 Getting Started

### 1️⃣ Clone the Repository

```bash
git clone "https://github.com/HamedKharazmi1990/NewsAppSwiftUI"
cd NewsAppSwiftUI
```

### 2️⃣ Add Your News API Key

Create a configuration file or replace the placeholder API key in the network layer:

### 3️⃣ Open the Project

    1. Open Math NewsAppSwiftUI.xcodeproj in Xcode
    2. Select an iPhone simulator
    4. Press Run (⌘R) 


### 🧩 Project Structure
    NewsAppSwiftUI
    ├── Models
    │   └── Article.swift
    ├── Services
    │   ├── NewsService.swift
    │   ├── NewsServiceProtocol.swift
    │   └── MockNewsService.swift
    ├── ViewModels
    │   └── NewsViewModel.swift
    ├── Views
    │   ├── NewsListView.swift
    │   └── NewsDetailView.swift
    ├── Tests
    │   ├── UnitTests
    │   └── UITests
    └── NewsAppSwiftUIApp.swift


### 👨‍💻 Maintainer

    Hamed Kharazmi
    📧 hamed.kharazmi@gmail.com

