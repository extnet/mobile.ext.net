using System;
using System.Collections.Generic;
using System.Web;

namespace Ext.Net.Mobile.Examples
{
    /// <summary>
    /// Bubble data
    /// </summary>
    public class Bubble : IHttpHandler
    {
        public void ProcessRequest(HttpContext context)
        {
            StoreResponseData r = new StoreResponseData();
            r.Data = JSON.Serialize(Bubble.GetData());

            r.Return();
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }

        public static double seed = 1.3;

        public static double Random()
        {
            seed *= 7.3;
            seed -= Math.Floor(seed);
            return seed;
        }

        public static object GetData(int count = 50, bool allNull = false)
        {
            var data = new List<object>();
            double g0 = allNull ? 0 : 300;
            double g1 = allNull ? 0 : (700 * Random() + 100);
            double g2 = allNull ? 0 : (700 * Random() + 100);
            double g3 = allNull ? 0 : (700 * Random() + 100);

            data.Add(new
            {
                id = 0,
                g0,
                g1,
                g2,
                g3
            });

            for (int i = 1; i < count; i++)
            {
                g0 = allNull ? 0 : (g0 + 30 * Random());
                g1 = allNull ? 0 : (Math.Abs(g1 + 300 * Random() - 140));
                g2 = allNull ? 0 : (Math.Abs(g1 + 300 * Random() - 140));
                g3 = allNull ? 0 : (Math.Abs(g1 + 300 * Random() - 140));

                data.Add(new
                {
                    id = i,
                    g0,
                    g1,
                    g2,
                    g3
                });
            }

            return data;
        }
    }
}