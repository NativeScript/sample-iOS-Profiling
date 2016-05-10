Requires: iOS 8+ device

* [Native](https://developer.apple.com/xcode/) - Xcode 6.3.2
* [NativeScript](https://www.nativescript.org/) - NativeScript for iOS 1.6.0
* [Xamarin](http://xamarin.com/studio) - Xamarin Studio 5.10.2
* [Appcelerator](http://docs.appcelerator.com/platform/latest/#!/guide/Appcelerator_Command-Line_Interface_Reference) - Appcelerator CLI 4.1.0
* [Cordova](https://cordova.apache.org/) - Apache Cordova 5.1.1
* [React Native](https://facebook.github.io/react-native/) - 0.19

# Results

## iPhone 5s

### Startup Time
Blank app with a single button.

| Platform     | Run 1      | Run 2      | Run 3      |
| ------------ | ---------: | ---------: | ---------: |
| Native       | 111ms      | 105ms      | 108ms      |
| React Native | 358ms      | 361ms      | 353ms      |
| Xamarin Forms| 484ms      | 471ms      | 469ms      |
| Cordova      | 613ms      | 612ms      | 609ms      |
| **NativeScript** | **674ms**      | **672ms**      | **670ms**      |

* NativeScript - We have an overhead from the JS modules. Some improvements are coming - minification, concatenation of the JS modules.

### Primitives
The tests below show the marshaling of numbers between JavaScript and native. It is for 1 000 000 calls to native code.

| Platform     | Run 1      | Run 2      | Run 3      |
| ------------ | ---------: | ---------: | ---------: |
| Native       | 5ms        | 4ms        | 4ms        |
| Xamarin      | 27ms       | 27ms       | 28ms       |
| **NativeScript** | **989ms**      | **998ms**      | **980ms**      |
| Appcelerator | 34444ms    | 33969ms    | 35916ms    |
| React Native | 130600ms   | 125140ms   | 127220ms   |
| Cordova      | 351420ms   | 357940ms   | 356740ms   |

### Strings
The tests below show the marshaling of strings between JavaScript and native. It is for 100 000 calls to native code.

| Platform     | Run 1      | Run 2      | Run 3      |
| ------------ | ---------: | ---------: | ---------: |
| Native       | 42ms       | 42ms       | 42ms       |
| Xamarin      | 248ms      | 234ms      | 244ms      |
| **NativeScript | **415ms**      | **444ms**      | **418ms**      |
| Appcelerator | 3215ms     | 3198ms     | 3180ms     |
| React Native | 12358ms    | 12464ms    | 12547ms    |
| Cordova      | 36864ms    | 36063ms    | 35861ms    |

### Big Data
The tests below show the marshaling of an array with 65 536 elements between JavaScript and native. It is for 200 calls to native code.

| Platform     | Run 1      | Run 2      | Run 3      |
| ------------ | ---------: | ---------: | ---------: |
| Native       | 768ms      | 774ms      | 759ms      |
| **NativeScript** | **1135ms**     | **1129ms**     | **1138ms**     |
| Xamarin      | 3763ms     | 3906ms     | 3789ms     |
| Cordova      | 9655ms     | 9714ms     | 9730ms     |
| React Native | 47873ms    | 47695ms    | 47859ms    |
| Appcelerator | 50091ms    | 45149ms    | 47927ms    |
