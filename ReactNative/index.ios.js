(function() {
  var TestFixtures = require('react-native').NativeModules.TestFixtures;
  var startDate = new Date();

  for (var i = 0; i < 1e6; i++) {
    TestFixtures.methodWithX(i, i, i);
  }

  var elapsed = (new Date() - startDate);
  alert('Elapsed: ' + elapsed + 'ms');
}());

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
