#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <TestFixtures/TestFixtures.h>

void measure(NSString* name, void (*action)()) {
    NSDate* startDate = [NSDate date];

    action();

    NSTimeInterval elapsedSeconds = -[startDate timeIntervalSinceNow];
    NSLog(@"%@: %fms", name, elapsedSeconds * 1000);
}

int main() {
    @autoreleasepool {
        measure(@"Primitives", [] {
            id instance = [[TestFixtures alloc] init];
            for (int32_t i = 0; i < 1e6; i++) {
                [instance methodWithX:i Y:i Z:i];
            }
        });

        measure(@"Big data marshalling", [] {
            @autoreleasepool {
                id instance = [[TestFixtures alloc] init];
                NSMutableArray* array = [NSMutableArray array];

                for (NSInteger i = 0; i < (1 << 16); i++) {
                    [array addObject:@(i)];
                }

                for (int32_t i = 0; i < 200; i++) {
                    [instance methodWithBigData:array];
                }
            }
        });

        return 0;
    }
}
