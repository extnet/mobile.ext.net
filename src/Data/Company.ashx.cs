using System;
using System.Collections.Generic;
using System.Web;
using System.Web.SessionState;

namespace Ext.Net.Mobile.Examples
{
    /// <summary>
    /// Companies data
    /// </summary>
    public class Company : IHttpHandler, IReadOnlySessionState
    {
        public class StockQuotation
        {
            public string Company { get; set; }
            public int Price { get; set; }
            public DateTime LastUpdate { get; set; }
        }

        public void ProcessRequest(HttpContext context)
        {
            StoreResponseData r = new StoreResponseData();

            if (context.Request["count"] != null)
            {
                var count = int.Parse(context.Request["count"]);

                r.Data = JSON.Serialize(this.GetData(0, count));
            }
            else
            {
                StoreRequestParameters parameters = new StoreRequestParameters(context);
                r.Data = JSON.Serialize(this.GetData(parameters.Start, parameters.Limit));
                r.Total = 70;
            }

            r.Return();
        }

        public List<StockQuotation> GetData(int start, int limit)
        {
            List<StockQuotation> data = new List<StockQuotation>();

            Random randow = new Random();
            DateTime now = DateTime.Now;

            for (int i = start + 1; i <= start + limit; i++)
            {
                StockQuotation qoute = new StockQuotation()
                {
                    Company = "Company " + i,
                    Price = randow.Next(0, 200),
                    LastUpdate = now
                };

                data.Add(qoute);
            }

            return data;
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}