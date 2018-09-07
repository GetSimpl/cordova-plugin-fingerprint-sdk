cordova.define('cordova/plugin_list', function(require, exports, module) {
module.exports = [
  {
    "id": "cordova-plugin-fingerprint-sdk.SimplFingerprintWrapper",
    "file": "plugins/cordova-plugin-fingerprint-sdk/www/SimplFingerprintWrapper.js",
    "pluginId": "cordova-plugin-fingerprint-sdk",
    "clobbers": [
      "cordova.plugins.SimplFingerprintWrapper"
    ]
  }
];
module.exports.metadata = 
// TOP OF METADATA
{
  "cordova-plugin-whitelist": "1.3.3",
  "cordova-plugin-fingerprint-sdk": "0.1.0"
};
// BOTTOM OF METADATA
});