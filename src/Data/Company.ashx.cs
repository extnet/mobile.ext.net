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
        class StockQuotation
        {
            public string Company { get; set; }
            public int Price { get; set; }
            public DateTime LastUpdate { get; set; }
        }

        public void ProcessRequest(HttpContext context)
        {
            StoreRequestParameters parameters = new StoreRequestParameters(context);

            List<StockQuotation> data = new List<StockQuotation>();

            int start = parameters.Start,
                limit = parameters.Limit;

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

            StoreResponseData r = new StoreResponseData();

            r.Data = JSON.Serialize(data);
            r.Total = 70;

            r.Return();
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