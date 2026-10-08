# 🕌 Tilawa

### A modern Quran recitation and audio experience built with Flutter

<p align="center">
  <strong>Listen. Recite. Reflect.</strong>
</p>

<p align="center">
  Tilawa is a modern, beautifully designed Quran audio application focused on providing a clean, accessible, and distraction-free experience for listening to Quran recitations.
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-3.41.1-02569B?logo=flutter&logoColor=white" alt="Flutter">
  <img src="https://img.shields.io/badge/Dart-3.11.0-0175C2?logo=dart&logoColor=white" alt="Dart">
  <img src="https://img.shields.io/badge/Riverpod-3.x-00A67E" alt="Riverpod">
  <img src="https://img.shields.io/badge/GoRouter-Navigation-4285F4" alt="GoRouter">
  <img src="https://img.shields.io/badge/Status-Phase%201%20Complete-success" alt="Status">
  <img src="https://img.shields.io/badge/License-MIT-yellow.svg" alt="License">
</p>

---

## 📖 About Tilawa

**Tilawa** is a Flutter-based Quran recitation and audio player designed to provide a simple, elegant, and reliable way to listen to Quran recitations.

The application is being developed with a scalable architecture so that it can eventually support:

* Multiple Quran reciters
* Complete Quran data
* Verse-by-verse playback
* Repeat individual verses
* Audio playback controls
* Playback speed control
* Bookmarks
* Search
* Downloadable audio
* Offline listening
* Background playback
* Listening history
* Resume playback
* Personalized Quran experience
* Backend synchronization

The project is being developed incrementally, starting with the Flutter application foundation and progressing toward a complete production-ready Quran audio platform.

---

## ✨ Features

### 📖 Quran

* Browse Quran chapters
* View Surah information
* Display Arabic Quran text
* Display translations
* Verse-by-verse presentation
* Surah metadata
* Meccan and Medinan classification

### 🎙️ Reciters

Tilawa is designed to support multiple reciters, including:

* Mishary Rashid Alafasy
* Abdul Rahman Al-Sudais
* Maher Al-Muaiqly
* Saad Al-Ghamdi

More reciters can be added as the application develops.

### 🎧 Audio Player

The player architecture is being designed around a dedicated audio engine supporting:

* Play
* Pause
* Next
* Previous
* Seek
* Playback progress
* Playback speed
* Current verse tracking
* Verse repetition
* Background playback

### 🔖 Bookmarks

Users will be able to save important verses for quick access.

Planned bookmark functionality includes:

* Add bookmark
* Remove bookmark
* Bookmark listing
* Bookmark notes
* Persistent bookmarks
* Jump directly to bookmarked verses

### 📥 Offline Listening

Planned offline functionality will allow users to:

* Download recitations
* Manage downloaded audio
* Listen without an internet connection
* Resume interrupted downloads
* Remove downloaded files
* Monitor storage usage

### 🔎 Search

The planned search system will allow users to search:

* Surahs
* Ayahs
* Reciters
* Bookmarked verses
* Quran translations

### 🌙 Background Playback

Tilawa will support continuous audio playback while the application is running in the background.

Planned functionality includes:

* Lock-screen controls
* Notification controls
* Headset controls
* Play/pause
* Next/previous
* Background audio sessions

---

# 🛠️ Technology Stack

Tilawa is being built using modern Flutter technologies.

| Technology            | Purpose                              |
| --------------------- | ------------------------------------ |
| **Flutter**           | Cross-platform application framework |
| **Dart**              | Application programming language     |
| **Riverpod**          | State management                     |
| **GoRouter**          | Navigation and routing               |
| **just_audio**        | Audio playback                       |
| **audio_service**     | Background audio                     |
| **Dio**               | HTTP networking                      |
| **SharedPreferences** | Local preferences                    |
| **Connectivity Plus** | Network connectivity                 |
| **Google Fonts**      | Typography                           |
| **FastAPI**           | Planned backend API                  |
| **PostgreSQL**        | Planned database                     |
| **Docker**            | Planned deployment infrastructure    |

---

# 🏗️ Architecture

Tilawa follows a feature-oriented Flutter architecture designed to keep the application maintainable as it grows.

```text
tilawa/
│
├── lib/
│   ├── app/
│   │   ├── app.dart
│   │   ├── router.dart
│   │   ├── theme.dart
│   │   └── constants.dart
│   │
│   ├── core/
│   │   ├── audio/
│   │   ├── network/
│   │   ├── storage/
│   │   └── utils/
│   │
│   ├── data/
│   │   └── mock_data.dart
│   │
│   ├── models/
│   │   ├── ayah.dart
│   │   ├── surah.dart
│   │   ├── reciter.dart
│   │   └── bookmark.dart
│   │
│   ├── providers/
│   │   ├── audio_provider.dart
│   │   ├── quran_provider.dart
│   │   ├── reciter_provider.dart
│   │   └── bookmark_provider.dart
│   │
│   ├── features/
│   │   ├── home/
│   │   ├── quran/
│   │   ├── reciters/
│   │   ├── player/
│   │   ├── bookmarks/
│   │   └── settings/
│   │
│   └── widgets/
│       ├── app_logo.dart
│       ├── surah_card.dart
│       ├── reciter_card.dart
│       ├── mini_player.dart
│       └── bottom_navigation.dart
│
├── assets/
│   ├── images/
│   ├── icons/
│   └── audio/
│
├── test/
│
├── pubspec.yaml
├── analysis_options.yaml
└── README.md
```

The architecture separates:

* UI
* State management
* Models
* Data
* Audio services
* Storage
* Networking
* Reusable widgets

This makes it easier to introduce real Quran APIs, audio services, offline storage, and backend synchronization without rewriting the entire application.

---

# 🚀 Development Roadmap

Tilawa is being developed in several phases.

## Phase 1 — Flutter Foundation

**Status: ✅ Complete**

Current foundation includes:

* Flutter project setup
* Application architecture
* Tilawa branding
* Light/dark theme foundation
* Riverpod state management
* GoRouter navigation
* Home screen
* Quran screen
* Surah screen
* Reciters screen
* Player screen
* Bookmarks screen
* Settings screen
* Quran mock data
* Reciter mock data
* Bookmark state
* Playback state
* Playback speed state
* Current Ayah state
* Reusable UI components

Code quality verification:

```bash
flutter analyze
```

Current result:

```text
No issues found!
```

---

## Phase 2 — Real Quran Data & Audio Engine

**Status: 🚧 Next**

Planned work:

* Complete 114 Surahs
* Complete Ayah dataset
* Quran metadata
* Real translations
* Real reciter data
* Audio URLs
* `just_audio` integration
* Audio queue
* Play/pause
* Previous/next
* Seek
* Progress tracking
* Playback speed
* Current Ayah synchronization
* Verse-by-verse playback
* Verse repetition
* Audio state management

---

## Phase 3 — Offline Audio

**Status: 📋 Planned**

Features:

* Audio downloads
* Download manager
* Download progress
* Pause/resume downloads
* Local audio storage
* Offline playback
* Downloaded Surahs
* Storage management
* Download queue

---

## Phase 4 — Personalization

**Status: 📋 Planned**

Features:

* Persistent bookmarks
* Bookmark notes
* Listening history
* Continue listening
* Recently played Surahs
* Sleep timer
* Favorite reciters
* Playback preferences
* User settings

---

## Phase 5 — Backend

**Status: 📋 Planned**

The backend will introduce a scalable API architecture.

Planned stack:

```text
FastAPI
    │
    ├── Authentication
    ├── Users
    ├── Quran Data
    ├── Reciters
    ├── Bookmarks
    ├── Listening History
    ├── Downloads
    └── Synchronization
         │
         ▼
     PostgreSQL
```

Planned backend features:

* User authentication
* JWT authorization
* User profiles
* Bookmark synchronization
* Listening history
* User preferences
* Quran metadata API
* Reciter API
* Search API
* RESTful API architecture

---

## Phase 6 — Production

**Status: 📋 Planned**

Production engineering will include:

* Docker
* Docker Compose
* PostgreSQL
* FastAPI deployment
* Nginx
* CI/CD
* GitHub Actions
* Automated testing
* Code quality checks
* Production monitoring
* Error logging
* API documentation
* Android release
* iOS release
* Linux support
* Web support where appropriate

---

# 📱 Planned Application Experience

The long-term application flow will look approximately like this:

```text
                    ┌───────────────┐
                    │     Tilawa    │
                    └───────┬───────┘
                            │
             ┌──────────────┼──────────────┐
             │              │              │
             ▼              ▼              ▼
          Quran          Reciters      Bookmarks
             │              │              │
             ▼              ▼              ▼
          Surahs        Reciter Info     Saved Ayahs
             │              │              │
             └──────────────┼──────────────┘
                            ▼
                       Audio Player
                            │
             ┌──────────────┼──────────────┐
             │              │              │
             ▼              ▼              ▼
           Play          Repeat         Download
             │              │              │
             ▼              ▼              ▼
        Background       Verse Loop       Offline
          Audio           Playback       Listening
```

---

# 🎨 Design Philosophy

Tilawa follows a simple design philosophy:

### 🕌 Spiritual

The interface should feel calm, respectful, and focused on Quran listening.

### ✨ Minimal

Avoid unnecessary UI elements and distractions.

### 📱 Accessible

The application should remain easy to use across different screen sizes.

### ⚡ Fast

Navigation and playback controls should feel responsive.

### 🌙 Comfortable

Support for light and dark themes provides a comfortable experience in different environments.

### 🧩 Modular

Features should remain independent and maintainable.

---

# 💻 Requirements

Before running Tilawa, make sure you have:

* Flutter SDK
* Dart SDK
* Android Studio or another Android development environment
* Android SDK
* Chrome for web development
* Git

Check your Flutter installation:

```bash
flutter doctor
```

Check the Flutter version:

```bash
flutter --version
```

---

# 🚀 Getting Started

## 1. Clone the repository

```bash
git clone https://github.com/bundlab/tilawa.git
```

Enter the project:

```bash
cd tilawa
```

## 2. Install dependencies

```bash
flutter pub get
```

## 3. Check the project

```bash
flutter analyze
```

## 4. Run the application

For Chrome:

```bash
flutter run -d chrome
```

For Linux:

```bash
flutter run -d linux
```

For Android:

```bash
flutter run
```

You can see available devices with:

```bash
flutter devices
```

---

# 🧪 Testing

Run Flutter tests with:

```bash
flutter test
```

Run static analysis with:

```bash
flutter analyze
```

The project should maintain a clean analyzer result before changes are committed.

Expected result:

```text
No issues found!
```

---

# 📂 Project Status

| Component                 | Status     |
| ------------------------- | ---------- |
| Flutter foundation        | ✅ Complete |
| Application theme         | ✅ Complete |
| Navigation                | ✅ Complete |
| Riverpod state management | ✅ Complete |
| Quran UI                  | ✅ Complete |
| Surah UI                  | ✅ Complete |
| Reciters UI               | ✅ Complete |
| Player UI                 | ✅ Complete |
| Bookmarks UI              | ✅ Complete |
| Settings UI               | ✅ Complete |
| Mock Quran data           | ✅ Complete |
| Real Quran data           | 🚧 Next    |
| Real audio playback       | 🚧 Next    |
| Background playback       | 📋 Planned |
| Offline downloads         | 📋 Planned |
| Search                    | 📋 Planned |
| Listening history         | 📋 Planned |
| FastAPI backend           | 📋 Planned |
| PostgreSQL                | 📋 Planned |
| Authentication            | 📋 Planned |
| Docker deployment         | 📋 Planned |
| CI/CD                     | 📋 Planned |

---

# 🤝 Contributing

Contributions are welcome.

If you would like to contribute:

1. Fork the repository.
2. Create a feature branch.
3. Make your changes.
4. Run tests.
5. Run `flutter analyze`.
6. Commit your changes.
7. Push your branch.
8. Open a Pull Request.

Example:

```bash
git checkout -b feature/audio-player
```

Make your changes and then:

```bash
flutter analyze
flutter test
```

Commit:

```bash
git add .
git commit -m "feat: improve audio player"
```

Push:

```bash
git push origin feature/audio-player
```

Then open a Pull Request on GitHub.

---

# 📝 Commit Convention

Tilawa follows conventional commit-style messages.

Examples:

```text
feat: add Quran search
```

```text
fix: resolve audio playback state
```

```text
docs: update installation instructions
```

```text
refactor: improve player architecture
```

```text
test: add bookmark provider tests
```

```text
chore: update dependencies
```

---

# 🔐 Privacy & Data

Tilawa is being designed with privacy in mind.

The planned application will minimize unnecessary collection of user data.

When cloud synchronization is introduced, users will be informed about:

* What data is stored
* Why it is stored
* How synchronization works
* How accounts can be deleted
* How personal data is managed

---

# ⚖️ Content & Attribution

Quran text, translations, audio recitations, and other third-party resources may be provided through external datasets or services.

Before distributing production builds, all external content will be reviewed to ensure that:

* Appropriate attribution is provided.
* Licensing requirements are respected.
* Audio distribution rights are respected.
* Quran datasets are sourced responsibly.
* Translation licensing requirements are followed.

---

# 🗺️ Long-Term Vision

Tilawa aims to become more than a simple audio player.

The long-term vision is to build a complete Quran listening and study companion that allows users to:

> **Read the Quran. Listen to the Quran. Memorize. Reflect. Continue anywhere.**

The platform is being designed to eventually support:

* Multiple reciters
* Multiple languages
* Quran translations
* Tafsir resources
* Verse repetition
* Memorization assistance
* Offline listening
* Personalized listening history
* Cross-device synchronization
* Intelligent search
* Accessibility features
* Community-focused improvements

---

# 🌍 Platform Support

The application is being designed with Flutter's cross-platform capabilities in mind.

| Platform | Status         |
| -------- | -------------- |
| Android  | 🚧 Development |
| iOS      | 📋 Planned     |
| Linux    | 🚧 Development |
| Windows  | 📋 Planned     |
| macOS    | 📋 Planned     |
| Web      | 📋 Planned     |

Platform-specific audio capabilities will be implemented and tested during later development phases.

---

# 📸 Screenshots

Screenshots will be added as the UI continues to mature.

Planned screenshots:

* Home
* Quran
* Surah
* Reciters
* Player
* Bookmarks
* Settings
* Dark mode

---

# 🧑‍💻 Development

Tilawa is developed and maintained by **bundlab**.

The project is being developed incrementally with an emphasis on:

* Clean architecture
* Maintainable code
* Modern Flutter practices
* Good UX
* Testing
* Performance
* Scalability
* Open-source collaboration

---

# ⭐ Support the Project

If you find Tilawa useful or interesting:

⭐ Star the repository

🍴 Fork the project

🐛 Report issues

💡 Suggest improvements

🤝 Contribute

Sharing the project with other developers is also appreciated.

---

# 📄 License

This project is licensed under the **MIT License**.

See the `LICENSE` file for details.

---

# 🙏 Acknowledgements

Tilawa is inspired by the need for a clean, accessible, and modern Quran listening experience.

Special appreciation goes to the open-source communities behind:

* Flutter
* Dart
* Riverpod
* GoRouter
* just_audio
* audio_service
* FastAPI
* PostgreSQL

---

<p align="center">
  <strong>🕌 Tilawa</strong>
  <br>
  <em>Listen. Recite. Reflect.</em>
</p>

<p align="center">
  Developed by bundlab.
</p>
