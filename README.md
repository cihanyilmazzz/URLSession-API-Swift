# SwiftJokeGenerator

A minimal SwiftUI app that fetches random jokes from JokeAPI and displays them using MVVM architecture with `URLSession`.

##  About

This project demonstrates how to perform simple network calls using `URLSession`, decode JSON into a Swift model (`JokeModel`), and present it in a SwiftUI view via an `ObservableObject` view model.

##  Usage

Clone the repo and run the app in Xcode. The app automatically fetches a joke on launch. Tap **Generate** to fetch a new one.

```swift
struct JokeModel: Codable {
  let category: String
  let setup: String
  let delivery: String
}

class JokesViewModel: ObservableObject {
  @Published var setup = ""
  @Published var delivery = ""

  func fetchJoke() {
    // Fetch logic using URLSession
  }
}
