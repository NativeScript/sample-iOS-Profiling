#import "TestFixtures.h"

#define UNUSED(x) (void)(x)

@implementation TestFixtures

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(methodWithX:(NSInteger)x Y:(NSInteger)y Z:(NSInteger)z) {
    NSInteger result = x + y + z;
    UNUSED(result);
}

@end
