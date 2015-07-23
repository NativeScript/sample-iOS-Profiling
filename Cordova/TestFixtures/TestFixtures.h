#import <Cordova/CDVPlugin.h>

@interface TestFixtures : CDVPlugin
- (void)methodWithXYZ:(CDVInvokedUrlCommand*)command;

- (void)methodWithBigData:(CDVInvokedUrlCommand*)command;
@end
