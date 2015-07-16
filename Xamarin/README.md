# Installation

Create New iOS App - Empty Project - XamarinApp.

Create New iOS Binding Project - TestFixtures.

Add reference in XamarinApp to TestFixtures.

```bash
xcodebuild -project ../TestFixtures/TestFixtures.xcodeproj -configuration Release -sdk iphonesimulator
xcodebuild -project ../TestFixtures/TestFixtures.xcodeproj -configuration Release -sdk iphoneos
lipo -create -output TestFixtures/libTestFixtures.a \
    ../TestFixtures/build/Release-iphoneos/libTestFixtures.a \
    ../TestFixtures/build/Release-iphonesimulator/libTestFixtures.a
```

Add `libTestFixtures.a` to the binding project.

Execute:
```bash
sharpie bind -o TestFixtures -sdk iphoneos8.3 -scope ../TestFixtures/TestFixtures ../TestFixtures/TestFixtures/TestFixtures.h
```

Copy `AppDelegate.cs` in XamarinApp.
