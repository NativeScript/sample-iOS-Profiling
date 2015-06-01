var ROWS = 20;
var currentRow = 0;

function pageLoaded(args) {
    var page = args.object;

    var listview = page.getViewById("listview");
    setInterval(function() {
    	currentRow = (ROWS - 1) - currentRow;
		var indexPath = NSIndexPath.indexPathForRowInSection(currentRow, 0);
		listview.ios.scrollToRowAtIndexPathAtScrollPositionAnimated(indexPath, UITableViewScrollPosition.UITableViewScrollPositionTop, true);
    }, 300);

    var data = NSString.stringWithContentsOfFileEncodingError(NSBundle.mainBundle().bundlePath + "/app/data.json", NSASCIIStringEncoding, null);
	var json = JSON.parse(data);

	// Copy some items until we fill the "ROWS" number.
	var c = json.length;
	for (var i = c; i < ROWS; i++)
		json.push(json[i % c]);

	var context = { appointments: json };
	console.log("CONTEXT");
	console.dir(context);
    page.bindingContext = context;
}
exports.pageLoaded = pageLoaded;
