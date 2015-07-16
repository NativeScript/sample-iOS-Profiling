var startDate = new Date();

var instance = TestFixtures.alloc().init();
for (var i = 0; i < 1e6; ++i) {
    instance.methodWithXYZ(i, i, i);
}

var elapsedMilliseconds = new Date() - startDate;
console.log(`Elapsed: ${elapsedMilliseconds}ms`);
