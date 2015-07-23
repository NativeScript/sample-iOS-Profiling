(function() {
    var React = require('react-native');
    var { AppRegistry, View } = React;

    var ReactNativeApp = React.createClass({
        render: function() {
            return (<View></View>);
        }
    });

    AppRegistry.registerComponent('ReactNativeApp', () => ReactNativeApp);
}());

(function() {
    function measure(name, action) {
        var startDate = new Date();

        return action().then(function() {
            var elapsedMilliseconds = new Date() - startDate;
            console.log(name + ': ' + elapsedMilliseconds + 'ms');
        }).catch(function(e) {
            console.log(e);
        });
    }

    var TestFixtures = require('react-native').NativeModules.TestFixtures;

    measure("Primitives", function () {
        var promises = [];

        for (var i = 0; i < 50000; i++) {
            promises.push(new Promise(function(resolve, reject) {
                TestFixtures.methodWithX(i, i, i, function(e, result) {
                    if (e) {
                        reject(e);
                        return;
                    }

                    resolve(result);
                });
            }));
        }

        return Promise.all(promises);
    });

    measure("Big data marshalling", function() {
        var promises = [];

        var array = [];
        for (var i = 0; i < (1 << 16); i++) {
            array.push(i);
        }

        for (var i = 0; i < 200; i++) {
            promises.push(new Promise(function(resolve, reject) {
                TestFixtures.methodWithBigData(array, function(e) {
                    if (e) {
                        reject(e);
                        return;
                    }

                    resolve();
                });
            }));
        }

        return Promise.all(promises);
    });
}());
