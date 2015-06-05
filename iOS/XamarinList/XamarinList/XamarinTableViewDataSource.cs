using System;
using Foundation;
using UIKit;

namespace XamarinList
{
	public class XamarinTableViewDataSource : UITableViewDataSource
	{
		public static NSString NativeFrom = (NSString)NSObject.FromObject("from");
		public static NSString NativeText = (NSString)NSObject.FromObject("text");
		public static NSString NativeRoom = (NSString)NSObject.FromObject("room");

		public NSArray dataSource { get; private set; }

		public XamarinTableViewDataSource ()
		{
			var data = NSData.FromFile(NSBundle.MainBundle.BundlePath + "/data.json");
			NSError error;
			var json = NSJsonSerialization.Deserialize (data, 0, out error);
			this.dataSource = (NSArray)json;
		}

		public override nint RowsInSection (UITableView tableView, nint section)
		{
			return 20;
		}

		public override UITableViewCell GetCell (UITableView tableView, NSIndexPath indexPath)
		{
			XamarinPresentationCell cell = (XamarinPresentationCell)tableView.DequeueReusableCell ("Cell");
			if (cell == null) {
				cell = new XamarinPresentationCell ("Cell");
			}

			var row = indexPath.Row;
			//var item = this.dataSource.
			var item = this.dataSource.GetItem<NSDictionary>((System.nuint)row % this.dataSource.Count);

			cell.fromLabel.Text = item.ObjectForKey (XamarinTableViewDataSource.NativeFrom).ToString();
			cell.textLabel.Text = item.ObjectForKey (XamarinTableViewDataSource.NativeText).ToString();
			cell.roomLabel.Text = string.Format ("Room: {0}", item.ObjectForKey (XamarinTableViewDataSource.NativeRoom));

			return cell;
		}
	}
}

