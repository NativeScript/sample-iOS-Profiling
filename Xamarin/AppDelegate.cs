using System;
using System.Diagnostics;
using MonoTouch.Foundation;
using MonoTouch.UIKit;

namespace XamarinApp
{
    [Register("AppDelegate")]
    public partial class AppDelegate : UIApplicationDelegate
    {
        private static void Measure(string name, Action action)
        {
            var start = Stopwatch.StartNew();
            action();
            new UIAlertView ("Elapsed", start.ElapsedMilliseconds + "ms", null, "Ok", null).Show();
        }

        public override bool FinishedLaunching(UIApplication app, NSDictionary options)
        {
           Measure("Primitives", () =>
           {
               var instance = new TestFixtures.TestFixtures();
               for (int i = 0; i < 1e6; i++)
               {
                   instance.MethodWithX(i, i, i);
               }
           });

            Measure("Big data", () =>
            {
                    var instance = new TestFixtures.TestFixtures();
                    var array = new NSObject[1 << 16];

                    for (var i = 0; i < array.Length; i++) {
                        array[i] = new NSNumber(i);
                    }

                    for (var i = 0; i < 200; i++) {
                        instance.MethodWithBigData(array);
                    }
            });

            return true;
        }
    }
}
