var TestFixtures = require('org.nativescript.TestFixtures');

function measure(name, action) {
    var startDate = new Date();

    action();

    var elapsedMilliseconds = new Date() - startDate;
    alert(name + ': ' + elapsedMilliseconds + 'ms');
}

measure("Primitives", function () {
    for (var i = 0; i < 1e6; i++) {
        TestFixtures.methodWithXYZ(i, i, i);
    }
});

measure("Strings", function () {
    var strings = [];
    for (var i = 0; i < 100; i++) {
        strings.push("abcdefghijklmnopqrstuvwxyz" + i);
    }

    for (var i = 0; i < 100000; i++) {
        TestFixtures.methodWithString(strings[i % strings.length]);
    }
});

measure("Big data", function () {
    var array = [];

    for (var i = 0; i < (1 << 16); i++) {
        array.push(i);
    }

    for (var i = 0; i < 200; i++) {
        TestFixtures.methodWithBigData(array);
    }
});
