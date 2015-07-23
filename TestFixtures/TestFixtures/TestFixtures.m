#import "TestFixtures.h"

@implementation TestFixtures
- (int32_t)methodWithX:(int32_t)x Y:(int32_t)y Z:(int32_t)z {
    return x + y + z;
}

- (UIImage *)methodWithBigData:(NSArray *)array {
    uint8_t *bytes = malloc(sizeof(*bytes) * array.count);

    size_t i = 0;
    for (id value in array) {
        bytes[i++] = [value intValue];
    }

    NSData *imageData = [NSData dataWithBytesNoCopy:bytes length:array.count freeWhenDone:YES];
    UIImage *image = [UIImage imageWithData:imageData];
    return image;
}
@end
