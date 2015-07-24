#import "TestFixtures.h"
#import <UIKit/UIKit.h>

#define UNUSED(x) (void)(x)

@implementation TestFixtures

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(methodWithX:(NSInteger)x Y:(NSInteger)y Z:(NSInteger)z callback:(RCTResponseSenderBlock)callback) {
    NSInteger result = x + y + z;
    callback(@[[NSNull null], @(result)]);
}

RCT_EXPORT_METHOD(methodWithString:(NSString*)string callback:(RCTResponseSenderBlock)callback) {
    callback(@[[NSNull null], string]);
}

RCT_EXPORT_METHOD(methodWithBigData:(NSArray *)array callback:(RCTResponseSenderBlock)callback) {
    uint8_t *bytes = malloc(sizeof(*bytes) * array.count);

    size_t i = 0;
    for (id value in array) {
        bytes[i++] = [value intValue];
    }

    NSData *imageData = [NSData dataWithBytesNoCopy:bytes length:array.count freeWhenDone:YES];
    UIImage *image = [UIImage imageWithData:imageData];
    UNUSED(image);
    callback(@[[NSNull null]] /*, image */);
}

@end
