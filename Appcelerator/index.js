var TestFixtures = require('org.nativescript.TestFixtures');

var startDate = new Date();

for (var i = 0; i < 1e6; i++) {
    TestFixtures.methodWithXYZ(i, i, i);
}

var elapsedMilliseconds = (new Date() - startDate);
alert('Elapsed: ' + elapsedMilliseconds + 'ms');
