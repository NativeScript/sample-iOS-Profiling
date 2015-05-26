//
//  main.m
//  TNSNativeList
//
//  Created by Panayot Cankov on 5/25/15.
//  Copyright (c) 2015 Telerik A D. All rights reserved.
//

#import <UIKit/UIKit.h>

const int ROWS = 20;

@interface TNSPresentationCell : UITableViewCell
@property UILabel* from;
@property UILabel* text;
@property UILabel* room;
@property float desiredHeight;

- (instancetype) initWithReuseIdentifier: (NSString*) cellIdentifier;

@end

@implementation TNSPresentationCell

- (instancetype) initWithReuseIdentifier: (NSString*) cellIdentifier {
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    if (self) {
        self.from = [[UILabel alloc] init];
        [self addSubview:self.from];

        self.text = [[UILabel alloc] init];
        self.text.numberOfLines = 0;
        [self addSubview:self.text];

        self.room = [[UILabel alloc] init];
        [self addSubview:self.room];
    }
    return self;
}

- (void)layoutSubviews {
    double y = 8;
    CGSize size;
    CGSize bounds = [UIScreen mainScreen].bounds.size;

    size = [self.from sizeThatFits:bounds];
    self.from.frame = CGRectMake(0, y, size.width, size.height);
    y += size.height + 4;

    size = [self.text sizeThatFits:bounds];
    self.text.frame = CGRectMake(0, y, size.width, size.height);
    y += size.height + 4;

    size = [self.room sizeThatFits:bounds];
    self.room.frame = CGRectMake(0, y, size.width, size.height);
    y += size.height + 8;

    self.desiredHeight = y;

    [super layoutSubviews];
}

@end

@interface TNSTableViewDataSource : NSObject<UITableViewDataSource, UITableViewDelegate>
@property NSArray* dataSource;
@property TNSPresentationCell* measureCell;
@end

@implementation TNSTableViewDataSource

- (instancetype) init {
    self = [super init];
    if (self) {
        id data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle].bundlePath stringByAppendingPathComponent:@"data.json"]];
        id json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        self.dataSource = json;

        self.measureCell = [[TNSPresentationCell alloc] initWithReuseIdentifier:@"Measure"];
    }
    return self;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";

    TNSPresentationCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[TNSPresentationCell alloc] initWithReuseIdentifier:CellIdentifier];
    }

    NSInteger row = [indexPath row];
    NSDictionary* item = self.dataSource[row % self.dataSource.count];

    cell.from.text = [item objectForKey:@"from"];
    cell.text.text = [item objectForKey:@"text"];
    cell.room.text = [NSString stringWithFormat:@"Room %@", [item objectForKey:@"room"]];

    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return ROWS;
}

- (CGFloat)tableView:(UITableView*)tableView heightForRowAtIndexPath:(NSIndexPath*)indexPath {

    NSInteger row = [indexPath row];
    NSDictionary* item = self.dataSource[row % self.dataSource.count];

    self.measureCell.from.text = [item objectForKey:@"from"];
    self.measureCell.text.text = [item objectForKey:@"text"];
    self.measureCell.room.text = [NSString stringWithFormat:@"Room %@", [item objectForKey:@"room"]];

    [self.measureCell layoutSubviews];

    return self.measureCell.desiredHeight;
}

@end

@interface RootViewController : UIViewController
@property TNSTableViewDataSource* dataSource;
@property NSTimer* timer;
@property UITableView* tableView;
- (void)viewDidLoad;
@end

@implementation RootViewController {
    int currentRow;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    currentRow = 0;

    self.tableView = [UITableView new];
    self.tableView.autoresizesSubviews = false;
    self.tableView.autoresizingMask = UIViewAutoresizingNone;
    self.tableView.frame = [UIScreen mainScreen].bounds;

    self.dataSource = [TNSTableViewDataSource new];
    self.tableView.dataSource = self.dataSource;
    self.tableView.delegate = self.dataSource;

    [self.view addSubview:self.tableView];
}

-(void) viewDidAppear:(BOOL)animated{
    self.timer = [NSTimer timerWithTimeInterval:0.3 target:self selector:@selector(scrollToNext) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode: NSDefaultRunLoopMode];
}

- (void) scrollToNext {
    currentRow = (ROWS - 1) - currentRow;
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:currentRow inSection:0];
    [self.tableView scrollToRowAtIndexPath:indexPath
                          atScrollPosition:UITableViewScrollPositionTop
                                  animated:YES];
}

@end

@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (strong, nonatomic) UIWindow *window;
@end

@implementation AppDelegate
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = [[RootViewController alloc] init];
    [self.window makeKeyAndVisible];
    return true;
}
@end

// Main
int main(int argc, char * argv[]) {
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
