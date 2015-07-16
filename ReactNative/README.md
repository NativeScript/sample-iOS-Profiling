# Installation

Make sure you have iojs installed.
```bash
react-native init ReactNativeApp
```

Add ReactTestFixtures project to the generated Xcode project and link with it.

Copy `index.ios.js` in ReactNativeApp folder.

Use *OPTION 2* in `AppDelegate.mm` with:

```bash
react-native bundle --minify
```
