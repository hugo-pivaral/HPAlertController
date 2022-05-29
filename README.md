<p>
<a href="https://developer.apple.com/ios" target="_blank"><img src="https://img.shields.io/badge/Platform-iOS_15+-blue.svg" alt="Platform: iOS 15.0+" /></a>
<a href="https://developer.apple.com/swift" target="_blank"><img src="https://img.shields.io/badge/Language-Swift_5-orange.svg" alt="Language: Swift 5" /></a>
<a href="https://github.com/hugo-pivaral/HPAlertController/blob/main/LICENSE" target="_blank"><img src="https://img.shields.io/badge/License-MIT-blueviolet.svg" alt="License: MIT" /></a>
</p>

# HPAlertController

An alternative to using the native `UIAlertController`, with a thoughtful design and simple implementation.

![example](https://user-images.githubusercontent.com/18062144/170870747-e64f68bc-0875-49e5-8e77-e8c053627934.png)

## Requirements
iOS 15.0 and higher

## Installation

<a href="https://swift.org/package-manager/" target="_blank">Swift Package Manager</a>:

```swift
dependencies: [
  .package(url: "https://github.com/hugo-pivaral/HPAlertController.git", .exact("1.0.0")),
],
```

After installing the SPM into your project import HPAlertController with

```swift
import HPAlertController
```

## Usage

Using HPAlertController is simple, very much like using `UIAlertController`. Simply make an instance of `HPAlertController` with the info you want to be presented, add the actions from which to choose, and present the alert using the `present(_:animated:completion:)` method.

```swift
let alert = HPAlertController(title: "Successful",
                              message: "Your information has been updated on our server.",
                              icon: .success,
                              alertTintColor: .default)
        
let continueAction = HPAlertAction(title: "Continue", style: .default) {
    // do something
}

let cancelAction = HPAlertAction(title: "Cancel", style: .cancel)

alert.addAction(continueAction)
alert.addAction(cancelAction)

present(alert, animated: true)
```


## Author

[Hugo Pivaral](https://hugop.dev)


