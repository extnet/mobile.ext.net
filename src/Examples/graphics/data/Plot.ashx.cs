using System;
using System.Collections.Generic;
using System.Web;
using System.Web.SessionState;

namespace Ext.Net.Mobile.Examples
{
    /// <summary>
    /// Plot data
    /// </summary>
    public class Plot : IHttpHandler, IReadOnlySessionState
    {
        public void ProcessRequest(HttpContext context)
        {
            StoreResponseData r = new StoreResponseData();
            r.Data = JSON.Serialize(Plot.GetData(Convert.ToInt32(context.Request["fnIndex"])));

            r.Return();
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }

        public static List<Func<double, double>> fn = new List<Func<double, double>>
        {
            delegate (double x) { return Math.Sin(5 * x); },
            delegate (double x) { return x * x * 2 - 1; },
            delegate (double x) { return x * x * x; },
            delegate (double x) { return Math.Cos(10 * x); },
            delegate (double x) { return 2 * x; },
            delegate (double x) { return Math.Pow(x, -2); },
            delegate (double x) { return Math.Pow(x, -3); },
            delegate (double x) { return Math.Tan(5 * x); }
        };

        public static object GetData(int fnIndex = 0)
        {
            var data = new List<object>();

            var delta = 0.02;
            var cap = 1000;
            var f = fn[fnIndex % fn.Count];

            for (double x = -2; x <= 2; x += delta)
            {
                double y = f(x);
                if (y > cap)
                {
                    y = cap;
                }

                data.Add(new
                {
                    x = x,
                    y = y
                });
            }

            return data;
        }
    }
}