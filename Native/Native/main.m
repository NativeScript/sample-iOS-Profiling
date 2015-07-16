#import <TestFixtures/TestFixtures.h>

int main() {
    @autoreleasepool {
        NSDate* startDate = [NSDate date];

        id instance = [[TestFixtures alloc] init];
        for (int32_t i = 0; i < 1e6; i++) {
            [instance methodWithX:i Y:i Z:i];
        }

        NSTimeInterval elapsedSeconds = -[startDate timeIntervalSinceNow];
        NSLog(@"Elapsed: %fms", elapsedSeconds * 1000);

        return 0;
    }
}
