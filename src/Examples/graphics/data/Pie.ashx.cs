using System;
using System.Collections.Generic;
using System.Web;

namespace Ext.Net.Mobile.Examples
{
    /// <summary>
    /// Pie data
    /// </summary>
    public class Pie : IHttpHandler
    {
        public void ProcessRequest(HttpContext context)
        {
            StoreResponseData r = new StoreResponseData();

            if (context.Request.Params["n"] != null)
            {
                r.Data = JSON.Serialize(Pie.GetData(JSON.Deserialize<int>(context.Request.Params["n"])));
            }
            else
            {
                r.Data = JSON.Serialize(Pie.GetData());
            }

            r.Return();
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }

        public static List<object> GetData(int n = 10, int floor = 20)
        {
            List<object> data = new List<object>(n);
            Random random = new Random();
            double p = (random.NextDouble() * 11) + 1;

            for (int i = 0; i < n; i++)
            {
                data.Add(new
                {
                    id = i,
                    name = (char)('A' + i),
                    g0 = Math.Floor(Math.Max(random.NextDouble() * 100, floor)),
                    g1 = Math.Floor(Math.Max(random.NextDouble() * 100, floor)),
                    g2 = Math.Floor(Math.Max(random.NextDouble() * 100, floor)),
                    g3 = Math.Floor(Math.Max(random.NextDouble() * 100, floor)),
                    g4 = Math.Floor(Math.Max(random.NextDouble() * 100, floor)),
                    g5 = Math.Floor(Math.Max(random.NextDouble() * 100, floor)),
                    g6 = Math.Floor(Math.Max(random.NextDouble() * 100, floor)),
                });
            }

            return data;
        }
    }
}