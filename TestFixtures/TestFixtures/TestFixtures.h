#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TestFixtures : NSObject
- (int32_t)methodWithX:(int32_t)x Y:(int32_t)y Z:(int32_t)z;

- (UIImage*)methodWithBigData:(NSArray*)array;
@end
