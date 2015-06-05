using System;
using Foundation;
using UIKit;

namespace XamarinList
{
	public class XamarinTableViewDelegate : UITableViewDelegate
	{
		private XamarinTableViewDataSource dataSource { get; set; }
		private XamarinPresentationCell measureCell { get; set; }

		public XamarinTableViewDelegate (XamarinTableViewDataSource dataSource)
		{
			this.dataSource = dataSource;
			this.measureCell = new XamarinPresentationCell ("Cell");
		}
			
		public override nfloat GetHeightForRow (UITableView tableView, Foundation.NSIndexPath indexPath)
		{
			var row = indexPath.Row;
			// var dataItem = this.dataSource.dataSource

			var item = this.dataSource.dataSource.GetItem<NSDictionary>((System.nuint)row % this.dataSource.dataSource.Count);

			this.measureCell.fromLabel.Text = item.ObjectForKey (XamarinTableViewDataSource.NativeFrom).ToString();
			this.measureCell.textLabel.Text = item.ObjectForKey (XamarinTableViewDataSource.NativeText).ToString();
			this.measureCell.roomLabel.Text = string.Format ("Room: {0}", item.ObjectForKey (XamarinTableViewDataSource.NativeRoom));

			this.measureCell.LayoutSubviews ();

			return this.measureCell.DesiredHeight;
		}
	}
}

