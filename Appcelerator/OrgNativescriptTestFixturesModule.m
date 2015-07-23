#import "OrgNativescriptTestFixturesModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"

@implementation OrgNativescriptTestFixturesModule
-(id)moduleGUID {
	return @"7bf314d7-9036-4edd-8534-6948d71b622a";
}

-(NSString*)moduleId {
	return @"org.nativescript.TestFixtures";
}

-(id)methodWithXYZ:(id)args {
	int x = [args[0] intValue];
	int y = [args[1] intValue];
	int z = [args[2] intValue];

	int result = x + y + z;
	return @(result);
}

- (id)methodWithBigData:(id)args {
    NSArray* array = args[0];
    uint8_t *bytes = malloc(sizeof(*bytes) * array.count);

    size_t i = 0;
    for (id value in array) {
        bytes[i++] = [value intValue];
    }

    NSData *imageData = [NSData dataWithBytesNoCopy:bytes length:array.count freeWhenDone:YES];
    UIImage *image = [UIImage imageWithData:imageData];
    return [[TiBlob alloc] initWithImage:image];
}
@end
