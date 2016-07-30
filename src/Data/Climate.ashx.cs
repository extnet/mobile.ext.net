using System;
using System.Web;

namespace Ext.Net.Mobile.Examples
{
    /// <summary>
    /// Climate data
    /// </summary>
    public class Climate : IHttpHandler
    {
        public void ProcessRequest(HttpContext context)
        {
            StoreResponseData r = new StoreResponseData();
            r.Data = JSON.Serialize(Climate.GetData());

            r.Return();
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }

        public static object[] GetData()
        {
            var temp = 15;
            var r = new Random();
            var min = r.Next() % 2 == 1 ? 0 : temp;

            return new object[]
            {
                new
                {
                    month = "Jan",
                    high = min + temp + r.NextDouble() * temp,
                    low = min + r.NextDouble() * temp
                },
                new
                {
                    month = "Feb",
                    high = min + temp + r.NextDouble() * temp,
                    low = min + r.NextDouble() * temp
                },
                new
                {
                    month = "Mar",
                    high = min + temp + r.NextDouble() * temp,
                    low = min + r.NextDouble() * temp
                },
                new
                {
                    month = "Apr",
                    high = min + temp + r.NextDouble() * temp,
                    low = min + r.NextDouble() * temp
                },
                new
                {
                    month = "May",
                    high = min + temp + r.NextDouble() * temp,
                    low = min + r.NextDouble() * temp
                },
                new
                {
                    month = "Jun",
                    high = min + temp + r.NextDouble() * temp,
                    low = min + r.NextDouble() * temp
                },
                new
                {
                    month = "Jul",
                    high = min + temp + r.NextDouble() * temp,
                    low = min + r.NextDouble() * temp
                },
                new
                {
                    month = "Aug",
                    high = min + temp + r.NextDouble() * temp,
                    low = min + r.NextDouble() * temp
                },
                new
                {
                    month = "Sep",
                    high = min + temp + r.NextDouble() * temp,
                    low = min + r.NextDouble() * temp
                },
                new
                {
                    month = "Oct",
                    high = min + temp + r.NextDouble() * temp,
                    low = min + r.NextDouble() * temp
                },
                new
                {
                    month = "Nov",
                    high = min + temp + r.NextDouble() * temp,
                    low = min + r.NextDouble() * temp
                },
                new
                {
                    month = "Dec",
                    high = min + temp + r.NextDouble() * temp,
                    low = min + r.NextDouble() * temp
                }
            };
        }
    }
}