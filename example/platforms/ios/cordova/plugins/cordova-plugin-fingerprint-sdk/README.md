# cordova-plugin-fingerprint-sdk

This plugin wraps the native Simpl Fingerprint SDKs to generate fingerprints.

```js
var simpl = cordova.plugins.SimplFingerprintWrapper;
simpl.generateFingerprint("<merchant_id>", "<phone_number>", "<email>", function (fingerprint) {
  // Collect fingerprint and do awesome stuff
}, function(error) {
  // Handle error
});
```

## Installation

    cordova plugin add cordova-plugin-fingerprint-sdk

### Supported Platforms

- Android
- iOS