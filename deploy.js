const firebase = require('firebase');
const config = require('./config');

firebase.initializeApp(config);

var ref = firebase.database().ref().child("servers");

ref.child(config.device).set(new Date().getTime());

ref.once('value', function (snapshot) {
    process.exit();
});
