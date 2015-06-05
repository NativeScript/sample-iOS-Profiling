using System;
using UIKit;
using CoreGraphics;

namespace XamarinList
{
	public class XamarinPresentationCell : UITableViewCell
	{
		public float DesiredHeight { get; private set; }

		public UILabel fromLabel { get; private set; }
		public UILabel textLabel { get; private set; }
		public UILabel roomLabel { get; private set; }

		public XamarinPresentationCell ()
		{
		}

		public XamarinPresentationCell(string cellIdentifier) : base(UITableViewCellStyle.Default, cellIdentifier)
		{
			this.fromLabel = new UILabel ();
			this.AddSubview (this.fromLabel);

			this.textLabel = new UILabel ();
			this.textLabel.Lines = 0;
			this.AddSubview (this.textLabel);

			this.roomLabel = new UILabel ();
			this.AddSubview (this.roomLabel);
		}

		public override void LayoutSubviews ()
		{
			float y = 8;
			CGSize size;
			CGSize bounds = UIScreen.MainScreen.Bounds.Size;

			size = this.fromLabel.SizeThatFits (bounds);
			this.fromLabel.Frame = new CGRect(0, y, size.Width, size.Height);
			y += (float)size.Height + 4;

			size = this.textLabel.SizeThatFits (bounds);
			this.textLabel.Frame = new CGRect (0, y, size.Width, size.Height);
			y += (float)size.Height + 4;

			size = this.roomLabel.SizeThatFits (bounds);
			this.roomLabel.Frame = new CGRect (0, y, size.Width, size.Height);
			y += (float)size.Height + 8;

			this.DesiredHeight = y;
			
			base.LayoutSubviews ();
		}
	}
}

