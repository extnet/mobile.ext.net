using System;
using System.Collections.Generic;
using System.Web;
using System.Web.SessionState;

namespace Ext.Net.Mobile.Examples
{
    /// <summary>
    /// Stock price data
    /// </summary>
    public class StockPrice : IHttpHandler, IReadOnlySessionState
    {
        public void ProcessRequest(HttpContext context)
        {
            StoreResponseData r = new StoreResponseData();

            if (context.Request.Params["n"] != null)
            {
                r.Data = JSON.Serialize(StockPrice.GetData(context, JSON.Deserialize<int>(context.Request.Params["n"])));
            }
            else
            {
                r.Data = JSON.Serialize(StockPrice.GetData(context));
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

        public class Stock
        {
            public DateTime Time { get; set; }
            public double Open { get; set; }
            public double High { get; set; }
            public double Low { get; set; }
            public double Close { get; set; }
        }

        public static double Random(HttpContext context)
        {
            if (context.Session["seed"] == null)
            {
                context.Session["seed"] = 1.4;
            }

            double seed = (double)context.Session["seed"];

            seed *= 42.7;
            seed -= Math.Floor(seed);
            context.Session["seed"] = seed;

            return seed * 2 - 1;
        }

        public static List<Stock> GetData(HttpContext context, int count = 1000)
        {
            List<Stock> data = new List<Stock>();
            Stock record = new Stock
            {
                Time = DateTime.Parse("Jan 1 2016"),
                Close = 600
            };

            for (int i = 0; i < count; i++)
            {
                var ohlc = new double[] { Random(context) * 25, Random(context) * 25, Random(context) * 25 };

                record = new Stock
                {
                    Time = record.Time.AddHours(1),
                    Open = record.Close,
                    High = record.Close + Math.Max(Math.Max(ohlc[0], ohlc[1]), ohlc[2]),
                    Low = record.Close + Math.Min(Math.Min(ohlc[0], ohlc[1]), ohlc[2]),
                    Close = record.Close + ohlc[1]
                };

                if (record.Open < record.Low)
                {
                    record.Low = record.Open;
                }
                else if (record.Open > record.High)
                {
                    record.High = record.Open;
                }

                data.Add(record);
            }

            return data;
        }
    }
}