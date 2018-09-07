cordova.define("cordova-plugin-fingerprint-sdk.SimplFingerprintWrapper", function(require, exports, module) {
var exec = require('cordova/exec');

var simpl = {};

simpl.generateFingerprint = function(merchantId, phoneNumber, email, successCallback, errorCallback) {
    cordova.exec(successCallback, errorCallback, "SimplFingerprintWrapper", "generateFingerprint", [merchantId, phoneNumber, email]);
};

module.exports = simpl;

});
