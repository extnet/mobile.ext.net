using System.Web;

namespace Ext.Net.Mobile.Examples
{
    /// <summary>
    /// Duration Messages example's end point
    /// </summary>
    public class DurationMessages : IHttpHandler
    {
        public void ProcessRequest(HttpContext context)
        {
            System.Threading.Thread.Sleep(8000);
            DirectResponse r = new DirectResponse();
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