# Iframe Test

This repository contains an Xcode project written in Swift, which uses SwiftUI and WebKit to create a WKWebView-based app. The purpose of the app is to load an external webpage, receive messages from this webpage, and update the SwiftUI view based on these messages.

The code uses SwiftUI for UI development, and it includes a custom WKWebView view which is able to receive messages from the JavaScript of the loaded webpage. Additionally, it uses the `NavigationStack` concept for managing navigation based on the received messages.

## Getting Started

### Prerequisites

* macOS with Xcode installed
* Swift 5.3 or later
* iOS 13.0 or later

### Installation

1. Clone the repository: 

```bash
git clone https://github.com/Legit-Health/iframe-demo-ios/tree/master
```

2. Navigate to the project directory:

```bash
cd IframeTest
```

3. Duplicate the `AppConfig.sample` file and rename the new file to `AppConfig.swift`:

```bash
cp AppConfig.sample AppConfig.swift
```

4. Open the `AppConfig.swift` file and fill in your `companyIdentifier`:

```swift
import Foundation
struct AppConfig {
    static let companyIdentifier = "YourCompanyIdentifier"
}
```

5. Open the project in Xcode by double clicking on `IframeTest.xcodeproj`.

6. Build and run the project.

## Usage

The app will load a webpage from a defined URL with the `companyIdentifier` as part of the query parameters. The webpage can send messages to the app through JavaScript, which will then be received and processed by the app, leading to navigation within the app.

## Understanding the Code

* `WebView` struct: This is a SwiftUI view which represents the WKWebView. It's set up to receive messages from the webpage through the `WKScriptMessageHandler` protocol. It also manages the navigation of the WebView.

* `Coordinator` class: This is a delegate for WKWebView which handles the WebView's lifecycle and received messages.

* `ContentView` struct: This is the main view of the app, which includes the WebView and manages the navigation stack.

* `ImageSent` struct: This is a SwiftUI view which is shown when a particular type of message is received by the WebView.

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License

Please see the [LICENSE](./LICENSE) file for details.

## Contact

Gerardo Fernández Moreno - gerardo@legit.health

Project Link: [https://github.com/Legit-Health/iframe-demo-ios](https://github.com/Legit-Health/iframe-demo-ios)

## Acknowledgements

* [WKWebView](https://developer.apple.com/documentation/webkit/wkwebview)
* [SwiftUI](https://developer.apple.com/documentation/swiftui/)
* [NavigationStack](https://www.swiftbysundell.com/articles/navigation-in-swift/)
