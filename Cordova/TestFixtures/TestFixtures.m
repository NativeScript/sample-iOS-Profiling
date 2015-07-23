#import "TestFixtures.h"

#define UNUSED(x) (void)(x)

@implementation TestFixtures
- (void)methodWithXYZ:(CDVInvokedUrlCommand*)command {
    int x = [command.arguments[0] intValue];
    int y = [command.arguments[1] intValue];
    int z = [command.arguments[2] intValue];

    int result = x + y + z;
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:result];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)methodWithBigData:(CDVInvokedUrlCommand*)command {
    NSArray* array = command.arguments[0];
    uint8_t *bytes = malloc(sizeof(*bytes) * array.count);

    size_t i = 0;
    for (id value in array) {
        bytes[i++] = [value intValue];
    }

    NSData *imageData = [NSData dataWithBytesNoCopy:bytes length:array.count freeWhenDone:YES];
    UIImage *image = [UIImage imageWithData:imageData];

    UNUSED(image);
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}
@end
