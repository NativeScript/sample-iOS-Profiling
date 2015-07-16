#import "TestFixtures.h"

@implementation TestFixtures
- (void)methodWithXYZ:(CDVInvokedUrlCommand*)command {
    int x = [command.arguments[0] intValue];
    int y = [command.arguments[1] intValue];
    int z = [command.arguments[2] intValue];

    int result = x + y + z;
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:result];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}
@end
