# Installation

```bash
cordova create CordovaApp org.nativescript.CordovaApp CordovaApp
cd CordovaApp
cordova platform add ios
```

```bash
cordova plugin add ../TestFixtures
```

Remove everything from `www` folder and copy `index.html`.

```bash
cordova run ios --device --release
```
