using System;
using Foundation;
using UIKit;

namespace XamarinList
{
	public class RootViewController : UIViewController
	{
		private XamarinTableViewDataSource dataSource { get; set; }
		private XamarinTableViewDelegate tableViewDelegate { get; set; }
		private int currentRow { get; set; }
		private UITableView tableView { get; set; }

		private NSTimer timer { get; set; }

		public RootViewController ()
		{
			this.currentRow = 0;

			this.tableView = new UITableView ();
			this.tableView.AutosizesSubviews = false;
			this.tableView.AutoresizingMask = UIViewAutoresizing.None;
			this.tableView.Frame = UIScreen.MainScreen.Bounds;

			this.dataSource = new XamarinTableViewDataSource ();
			this.tableView.DataSource = this.dataSource;
			this.tableViewDelegate = new XamarinTableViewDelegate (this.dataSource);
			this.tableView.Delegate = this.tableViewDelegate;

			this.View.AddSubview (this.tableView);
		}

		public override void ViewDidAppear (bool animated)
		{
			base.ViewDidAppear (animated);
			this.timer = NSTimer.CreateRepeatingScheduledTimer (0.3, timer => {
				this.currentRow = (20 - 1) - this.currentRow;
				var indexPath = NSIndexPath.FromRowSection(this.currentRow, 0);
				this.tableView.ScrollToRow(indexPath, UITableViewScrollPosition.Top, true);
			});
		}
	}
}

