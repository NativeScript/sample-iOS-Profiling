function measure(name, action) {
    var startDate = new Date();

    action();

    var elapsedMilliseconds = new Date() - startDate;
    console.log(name + ': ' + elapsedMilliseconds + 'ms');
}

measure("Primitives", function () {
    var instance = TestFixtures.alloc().init();
    for (var i = 0; i < 1e6; i++) {
        instance.methodWithXYZ(i, i, i);
    }
});

measure("Strings", function () {
    var instance = TestFixtures.alloc().init();

    var strings = [];

    for (var i = 0; i < 100; i++) {
        strings.push("abcdefghijklmnopqrstuvwxyz" + i);
    }

    for (var i = 0; i < 100000; i++) {
        instance.methodWithString(strings[i % strings.length]);
    }
});

measure("Big data marshalling", function () {
    var instance = TestFixtures.alloc().init();
    var array = [];

    for (var i = 0; i < (1 << 16); i++) {
        array.push(i);
    }

    for (var i = 0; i < 200; i++) {
        instance.methodWithBigData(array);
    }
});
