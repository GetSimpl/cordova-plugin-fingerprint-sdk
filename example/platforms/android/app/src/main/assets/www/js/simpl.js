document.addEventListener('DOMContentLoaded', function () {
  document.querySelector('button').addEventListener('click', clickHandler);
  main();
});

function clickHandler(element) {
    getFingerprint();
}

function getFingerprint() {
  var simpl = cordova.plugins.SimplFingerprintWrapper;
  simpl.generateFingerprint("1234", "9941316028", "dvrajan12@gmail.com", function (fingerprint) {
  console.log('fingerprint', fingerprint);
  }, function(error) {
  console.log('fingerprint', error);
  });
}
