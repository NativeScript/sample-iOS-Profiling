using System;
using System.Diagnostics;
using MonoTouch.Foundation;
using MonoTouch.UIKit;

namespace XamarinApp
{
    [Register("AppDelegate")]
    public partial class AppDelegate : UIApplicationDelegate
    {
        public override bool FinishedLaunching(UIApplication app, NSDictionary options)
        {
            var start = Stopwatch.StartNew();

            var instance = new TestFixtures.TestFixtures();
            for (int i = 0; i < 1e6; i++)
            {
                instance.MethodWithX(i, i, i);
            }

            new UIAlertView ("Elapsed", start.ElapsedMilliseconds + "ms", null, "Ok", null).Show();

            return true;
        }
    }
}
