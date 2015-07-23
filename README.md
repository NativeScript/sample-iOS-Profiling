Requires: iOS 8+ device

* [Native](https://developer.apple.com/xcode/) - Xcode 6.3.2
* [NativeScript](https://www.nativescript.org/) - NativeScript for iOS 1.2
* [Xamarin](http://xamarin.com/studio) - Xamarin Studio 5.9.4
* [Appcelerator](http://docs.appcelerator.com/platform/latest/#!/guide/Appcelerator_Command-Line_Interface_Reference) - Appcelerator CLI 4.1.0
* [Cordova](https://cordova.apache.org/) - Apache Cordova 5.1.1
* [React Native](https://facebook.github.io/react-native/) - 0.7.1

# Results

## iPhone 5s
### Primitives
| Platform     | Run 1      | Run 2      | Run 3      |
| ------------ | ---------: | ---------: | ---------: |
| Native       | 5ms        | 4ms        | 4ms        |
| Xamarin      | 57ms       | 54ms       | 51ms       |
| NativeScript | 1543ms     | 1530ms     | 1528ms     |
| Appcelerator | 34444ms    | 33969ms    | 35916ms    |
| Cordova      | 351420ms   | 357940ms   | 356740ms   |
| React Native | 625720ms   | 509040ms   | 487560ms   |

### Big data
| Platform     | Run 1      | Run 2      | Run 3      |
| ------------ | ---------: | ---------: | ---------: |
| Native       | 768ms      | 774ms      | 759ms      |
| NativeScript | 1382ms     | 1389ms     | 1370ms     |
| Xamarin      | 6911ms     | 6873ms     | 6735ms     |
| Cordova      | 9655ms     | 9714ms     | 9730ms     |
| React Native | 12320ms    | 11444ms    | 11282ms    |
| Appcelerator | 50091ms    | 45149ms    | 47927ms    |
