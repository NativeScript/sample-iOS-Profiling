# Installation

Create new module:
```bash
appc new --name TestFixtures --id org.nativescript.TestFixtures --no-services
```

Copy OrgNativescriptTestFixturesModule files to TestFixtures/iphone/Classes

Build the native module:
```bash
cd TestFixtures/iphone
./build.py

cp org.nativescript.testfixtures-iphone-1.0.0.zip ~/Library/Application\ Support/Titanium
```

Create new native app:
```bash
cd ../../
appc new --name AppceleratorApp --id org.nativescript.AppceleratorApp --no-services
```

Copy `index.js` in `app/controllers`

Run the app:
```bash
appc run --ios-version 8.3 --sim-version 8.3 --platform ios --deploy-type development --target device
```
