var exec = require('cordova/exec');

module.exports = {
    methodWithXYZ: function(successCallback, errorCallback, x, y, z) {
        exec(successCallback, errorCallback, "TestFixtures", "methodWithXYZ", [x, y, z]);
    },
    methodWithBigData: function(successCallback, errorCallback, array) {
        exec(successCallback, errorCallback, "TestFixtures", "methodWithBigData", [array]);
    }
};
