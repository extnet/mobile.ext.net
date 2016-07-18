using System;
using System.Collections.Generic;
using System.Web;

namespace Ext.Net.Mobile.Examples
{
    /// <summary>
    /// Get server time
    /// </summary>
    public class GetServerTime : IHttpHandler
    {
        public void ProcessRequest(HttpContext context)
        {
            DirectResponse r = new DirectResponse();
            X.Js.Call("Ext.toast", "The Server Time is: " + DateTime.Now.ToLongTimeString(), 2000);

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