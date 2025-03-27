# 🎬 Cinemapedia App

![Dart](https://img.shields.io/badge/dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white)
![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)
![iOS](https://img.shields.io/badge/iOS-000000?style=for-the-badge&logo=ios&logoColor=white)
![Android](https://img.shields.io/badge/Android-3DDC84?style=for-the-badge&logo=android&logoColor=white)
![Visual Studio Code](https://img.shields.io/badge/Visual%20Studio%20Code-0078d7.svg?style=for-the-badge&logo=visual-studio-code&logoColor=white)
![Android Studio](https://img.shields.io/badge/android%20studio-346ac1?style=for-the-badge&logo=android%20studio&logoColor=white)

---

## 🧾 Description

**Cinemapedia** is a Flutter application built with a Clean Architecture approach. It fetches real-time movie data from [The MovieDB API](https://www.themoviedb.org/), displays movies that are now playing in theaters, and allows users to **search**, **browse**, and **save favorite movies locally** using the **Isar NoSQL database**.

This project is designed to showcase scalable architecture, modern Flutter development practices, and persistence using Isar. The app is optimized for both Android and iOS.

---

## 🚀 Features

- 🎞️ Fetch "Now Playing", "Popular", and "Top Rated" movies from MovieDB.
- 🔍 Powerful search functionality for movies.
- ❤️ Save and persist favorite movies locally with **Isar DB**.
- 🌙 Light/Dark theme switching.
- 🧠 State management powered by **Riverpod**.
- 📐 Clean Architecture for maximum scalability and testability.
- 🔁 Pagination for loading large data sets.
- 🎨 Material 3 (M3) components usage.

---

## 🧱 Directory Structure (Clean Architecture)

```txt
lib/
├── config/            # App-level configurations and helpers
│   ├── constants/
│   ├── helpers/
│   ├── router/
│   └── theme/
├── domain/            # Business logic and contracts
│   ├── datasources/   # Abstract contracts for data access
│   ├── entities/      # Core models/entities
│   └── repositories/  # Abstract repository interfaces
├── infrastructure/    # Data implementation layer
│   ├── datasources/   # Concrete implementations (API, DB)
│   ├── mappers/       # Entity <=> DTO mapping
│   ├── models/        # Data models
│   └── repositories/  # Repository implementations
├── presentation/      # UI layer and logic
│   ├── delegates/
│   ├── providers/     # Riverpod providers
│   ├── screens/       # Feature screens (e.g., Home, Details)
│   └── views/
├── widgets/           # Shared and reusable UI widgets
└── main.dart          # Entry point
```

## Dev Setup

1. Copy the .env.template and renamed it to .env
2. Change env variables needed ([The MovieDB](https://www.themoviedb.org/))
3. Any changes on the entity of Movie should have a CLI run `flutter pub run build_runner build` to generate the new model from Isar
4. 🧩 Isar Database (Android Setup Note):
   If you're building on Android, ensure the following snippet is added to your android/build.gradle to avoid issues with namespace resolution when working with Isar:

```gradle
// android/build.gradle

subprojects {
    afterEvaluate { project ->
        if (project.hasProperty('android')) {
            project.android {
                if (namespace == null) {
                    namespace project.group
                }
            }
        }
    }
}
```

## ✨ Screenshots

- Pending

## 📬 Contact

Built with 💙 by Luisangel M. Marcia Palma
