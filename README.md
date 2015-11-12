Requires: iOS 8+ device

* [Native](https://developer.apple.com/xcode/) - Xcode 6.3.2
* [NativeScript](https://www.nativescript.org/) - NativeScript for iOS 1.4.3
* [Xamarin](http://xamarin.com/studio) - Xamarin Studio 5.9.4
* [Appcelerator](http://docs.appcelerator.com/platform/latest/#!/guide/Appcelerator_Command-Line_Interface_Reference) - Appcelerator CLI 4.1.0
* [Cordova](https://cordova.apache.org/) - Apache Cordova 5.1.1
* [React Native](https://facebook.github.io/react-native/) - 0.7.1

# Results

## iPhone 5s
### Startup time

Blank app with single button

| Platform     | Run 1      | Run 2      | Run 3      |
| ------------ | ---------: | ---------: | ---------: |
| Native       | 78ms       | 75ms       | 75ms       |
| Appcelerator | 120ms      | 118ms      | 115ms      |
| React Native | 280ms      | 275ms      | 261ms      |
| Xamarin      | 319ms      | 315ms      | 318ms      |
| Cordova      | 412ms      | 405ms      | 406ms      |
| NativeScript | 559ms      | 570ms      | 568ms      |

* NativeScript - We have an overhead from the JS modules. Some improvements are coming - minification, concatenation of the JS modules.

### Primitives
The tests below show the marshaling of numbers between JavaScript and native. It is for 1 000 000 calls to native code.

| Platform     | Run 1      | Run 2      | Run 3      |
| ------------ | ---------: | ---------: | ---------: |
| Native       | 5ms        | 4ms        | 4ms        |
| Xamarin      | 57ms       | 54ms       | 51ms       |
| NativeScript | 1868ms     | 1852ms     | 1880ms     |
| Appcelerator | 34444ms    | 33969ms    | 35916ms    |
| Cordova      | 351420ms   | 357940ms   | 356740ms   |
| React Native | 625720ms   | 509040ms   | 487560ms   |

### Strings
The tests below show the marshaling of strings between JavaScript and native. It is for 100 000 calls to native code.

| Platform     | Run 1      | Run 2      | Run 3      |
| ------------ | ---------: | ---------: | ---------: |
| Native       | 42ms       | 42ms       | 42ms       |
| NativeScript | 697ms      | 712ms      | 694ms      |
| Xamarin      | 853ms      | 848ms      | 804ms      |
| Appcelerator | 3215ms     | 3198ms     | 3180ms     |
| Cordova      | 36864ms    | 36063ms    | 35861ms    |
| React Native | 63268ms    | 56110ms    | 55450ms    |

### Big data
The tests below show the marshaling of an array with 65 536 elements between JavaScript and native. It is for 200 calls to native code.

| Platform     | Run 1      | Run 2      | Run 3      |
| ------------ | ---------: | ---------: | ---------: |
| Native       | 768ms      | 774ms      | 759ms      |
| NativeScript | 1355ms     | 1390ms     | 1361ms     |
| Xamarin      | 6911ms     | 6873ms     | 6735ms     |
| Cordova      | 9655ms     | 9714ms     | 9730ms     |
| React Native | 12320ms    | 11444ms    | 11282ms    |
| Appcelerator | 50091ms    | 45149ms    | 47927ms    |
