# iOS
### Scrolling UITableView
A constantly scrolling UITableView. Has different row heights. Has custom cells with recycling, three UILabels in each cell. Objective-C code implementation is compared with the same JavaScript code in NativeScript for iOS. The apps were designed to keep constant 60 FPS.

Projects:
 - _iOS/TNSScriptList_ - Objective-C implementation
 - _iOS/TNSNativeList_ - NativeScript for iOS implementation (without modules)
 - _iOS/TNSCrossList - NativeScript for iOS implementation (with modules)

For the _TNSScriptList_ app you will have to execute `tns platform add ios`, `tns prepare ios` and use the generated Xcode project in `platforms\ios`.

The CPU and GPU samples are taken with the Xcode instruments. Open the Xcode projects go to Product > Profile. The Memory usage is recorded in Xcode with the projects built in Release. The 

The device used is iPhone 5S with iOS8.1.3

#### TNSScriptList (NativeScript for iOS)
 - Memory: ~13MB and raises to flat at 48MB
 - CPU: 38.4% Foreground, ~28.8% Graphics
 - GPU Driver FPS: ~59

#### TNSNativeList (Objective-C)
 - Memory: ~6.4MB
 - CPU Activity: 31.3% Foreground, ~28.6% Graphics
 - GPU Driver FPS: ~59

#### TNSCrossList (NativeScript for iOS + Cross Platform Modules)
 - Memory: ~27.5MB
 - CPU Activity: 38.5% Foreground, ~18% Graphics
 - GPU Driver FPS: ~59
 
#### Summary

Overall the additional memory consumed is due to the JS heap and the way JavaScript objects retain the native Objective-C objects.

At such a simple scenario the modules does not add excessive overhead, they even add the benefit of clipping the content under the status bar for you, and use somewhat smaller CPU Activity: Graphics processing.

The CPU usage with NativeScript for iOS is about 21% higher than using pure Objective-C.

