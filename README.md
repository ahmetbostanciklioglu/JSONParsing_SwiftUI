<div align="center">

# 🔗 JSON Parsing in SwiftUI

**A concise example of fetching and decoding remote JSON into a live SwiftUI list**

![Platform](https://img.shields.io/badge/Platform-iOS-000000?style=flat-square&logo=apple)
![Swift](https://img.shields.io/badge/Swift-5.0-FA7343?style=flat-square&logo=swift&logoColor=white)
![SwiftUI](https://img.shields.io/badge/SwiftUI-0071E3?style=flat-square&logo=swift&logoColor=white)
![Xcode](https://img.shields.io/badge/Xcode-26-1575F9?style=flat-square&logo=xcode&logoColor=white)
![Stars](https://img.shields.io/github/stars/ahmetbostanciklioglu/JSONParsing_SwiftUI?style=flat-square&color=6E48AA)
![Last Commit](https://img.shields.io/github/last-commit/ahmetbostanciklioglu/JSONParsing_SwiftUI?style=flat-square&color=4776E6)

</div>

## 📖 Overview

JSONParsing_SwiftUI is a small, focused example that demonstrates how to fetch JSON from a REST endpoint and render it in SwiftUI. It calls the public GitHub API (`https://api.github.com/users/hadley/orgs`), decodes the response into a `Codable` model with `JSONDecoder`, and displays each item in a `List`. The networking runs in an `ObservableObject` that publishes the decoded results back to the view. It is a clean starting point for anyone learning the `URLSession` + `Decodable` + SwiftUI data-flow pattern.

## ✨ Features

- Fetches remote JSON over `URLSession.dataTask` and decodes it with `JSONDecoder`
- Maps the response into an `Identifiable`, `Decodable` model struct
- Publishes results with an `ObservableObject` / `@Published` array consumed by the view
- Renders the decoded data in a `NavigationView` + `List`
- Loads each avatar asynchronously with SwiftUI's built-in `AsyncImage`, including loading, success, and failure states

## 📸 Preview

<div align="center">
  <img width="1900" height="757" alt="JSON Parsing in SwiftUI screenshot" src="https://github.com/user-attachments/assets/ef19ec2c-558f-4b77-b2fa-61fe01e0f7cf" />
</div>

## 🚀 Getting Started

```bash
git clone https://github.com/ahmetbostanciklioglu/JSONParsing_SwiftUI.git
cd JSONParsing_SwiftUI
open "json Parse.xcodeproj"
```

Then select a simulator (or device) and press **⌘R** to build and run.

## 📋 Requirements

- iOS 17.6 or later
- Xcode 26 or later
- Swift 5.0

## 🧑‍💻 Author

**Ahmet Bostancıklıoğlu** — [@ahmetbostanciklioglu](https://github.com/ahmetbostanciklioglu) · ahmetbostancikli@gmail.com

> ⭐ If this helped you, consider giving the repo a star!
