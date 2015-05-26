var ROWS = 20;

var TNSPresentationCell = UITableViewCell.extend({
	initWithReuseIdentifier: function(cellIdentifier) {
		self = this.super.initWithStyleReuseIdentifier(UITableViewCellStyle.UITableViewCellStyleDefault, cellIdentifier);
		if (self) {
			this.fromLbl = UILabel.alloc().init();
			this.addSubview(this.fromLbl);
			this.textLbl = UILabel.alloc().init();
            this.textLbl.numberOfLines = 0;
			this.addSubview(this.textLbl);
			this.roomLbl = UILabel.alloc().init();
			this.addSubview(this.roomLbl);
		}
		return this;
	},
	layoutSubviews: function() {
		var y = 8;
		var size;
		var bounds = UIScreen.mainScreen().bounds.size;

		size = this.fromLbl.sizeThatFits(bounds);
		this.fromLbl.frame = CGRectMake(0, y, size.width, size.height);
		y += size.height + 4;

		size = this.textLbl.sizeThatFits(bounds);
		this.textLbl.frame = CGRectMake(0, y, size.width, size.height);
		y += size.height + 4;

		size = this.roomLbl.sizeThatFits(bounds);
		this.roomLbl.frame = CGRectMake(0, y, size.width, size.height);
		y += size.height + 8;

		this.desiredHeight = y;

		this.super.layoutSubviews();
	}
}, {
	name: "TNSPresentationCell"
});

var cellIdentifier = NSString.stringWithString("Cell");

var measureCell = TNSPresentationCell.alloc().initWithReuseIdentifier("Measure");

var TNSTableViewDataSouce = NSObject.extend({
	init: function() {
		self = this.super.init();
		if (self) {
			var data = NSString.stringWithContentsOfFileEncodingError(NSBundle.mainBundle().bundlePath + "/app/data.json", NSASCIIStringEncoding, null);
			var json = JSON.parse(data);
			self.dataSource = json;
            self.measureCell = measureCell;
		}
		return self;
	},
	tableViewCellForRowAtIndexPath: function(tableView, indexPath) {
		var cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier);
		if (cell == null) {
			cell = TNSPresentationCell.alloc().initWithReuseIdentifier(cellIdentifier);
		}

		var row = indexPath.row;
		var item = this.dataSource[row % this.dataSource.length];

		cell.fromLbl.text = item.from;
		cell.textLbl.text = item.text;
		cell.roomLbl.text = "Room " + item.room;

		return cell;
	},
	tableViewNumberOfRowsInSection: function(tableView, section) {
		return ROWS;
	},
	tableViewHeightForRowAtIndexPath: function(tableView, indexPath) {
		var row = indexPath.row;
		var item = this.dataSource[row % this.dataSource.length];

		this.measureCell.fromLbl.text = item.from;
		this.measureCell.textLbl.text = item.text;
		this.measureCell.roomLbl.text = "Room " + item.room;

		this.measureCell.layoutSubviews();

		return this.measureCell.desiredHeight;
	}
}, {
	name: "TNSTableViewDataSouce",
	protocols: [UITableViewDataSource, UITableViewDelegate]
});

var RootViewController = UIViewController.extend({
	viewDidLoad: function() {
		this.super.viewDidLoad();

		this.currentRow = 0;

		this.tableView = UITableView.new();
		this.tableView.autoresizeSubviews = false;
		this.tableView.autoresizeMask = UIViewAutoresizing.UIViewAutoresizingNone;
		this.tableView.frame = UIScreen.mainScreen().bounds;

		this.dataSource = TNSTableViewDataSouce.new();

		this.tableView.dataSource = this.dataSource;
		this.tableView.delegate = this.dataSource;

		this.view.addSubview(this.tableView);
	},
	viewDidAppear: function(animated) {
        this.timer = NSTimer.timerWithTimeIntervalTargetSelectorUserInfoRepeats(0.3, this, "scrollToNext", null, true);
		NSRunLoop.currentRunLoop().addTimerForMode(this.timer, NSDefaultRunLoopMode);

	},
	scrollToNext: function() {
		this.currentRow = (ROWS - 1) - this.currentRow;
		var indexPath = NSIndexPath.indexPathForRowInSection(this.currentRow, 0);
		this.tableView.scrollToRowAtIndexPathAtScrollPositionAnimated(indexPath, UITableViewScrollPosition.UITableViewScrollPositionTop, true);
	}
}, {
	name: "RootViewController",
    exposedMethods: {
        scrollToNext: { returns: interop.types.void, params:[] }
    }
});

var AppDelegate = UIResponder.extend({
	applicationDidFinishLaunchingWithOptions: function(app, options) {
		this.window = UIWindow.alloc().initWithFrame(UIScreen.mainScreen().bounds);
		this.window.backgroundColor = UIColor.whiteColor();
		this.window.rootViewController = RootViewController.alloc().init();
		this.window.makeKeyAndVisible();
		return true;
	}
}, {
	name: "AppDelegate",
	protocols: [UIApplicationDelegate]
})

UIApplicationMain(null, null, null, NSStringFromClass(AppDelegate.class()));

