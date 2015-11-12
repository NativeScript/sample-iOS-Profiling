# Installation

```bash
tns create NativeScriptApp --appid org.nativescript.NativeScriptApp
cd NativeScriptApp
tns platform add ios
tns prepare ios
```

Open the workspace in Xcode and link with TestFixtures project in "Link Binary With Libraries" build step.

Remove everything from `app` folder and copy `bootstrap.js`.

```bash
tns run ios --release
```
