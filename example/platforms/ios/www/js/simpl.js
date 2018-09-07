document.addEventListener('DOMContentLoaded', function () {
  document.querySelector('button').addEventListener('click', clickHandler);
});

function clickHandler(element) {
    getFingerprint();
}

function getFingerprint() {
  var simpl = cordova.plugins.SimplFingerprintWrapper;
  simpl.generateFingerprint("1234", "9912345678", "example@domain.com", function (fingerprint) {
    document.getElementById("fingerprint").innerHTML = fingerprint;
  }, function(error) {
    document.getElementById("fingerprint").innerHTML = error.message;
  });
}
