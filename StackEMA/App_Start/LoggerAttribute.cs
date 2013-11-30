using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace StackEMA.App_Start
{
    public class LoggerAttribute : ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            string ip;
            if (!String.IsNullOrEmpty(HttpContext.Current.Request.ServerVariables["HTTP_CLIENT_IP"]))
            {
                ip = HttpContext.Current.Request.ServerVariables["HTTP_CLIENT_IP"];
            }
            else
            {
                ip = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
            }
            System.Diagnostics.Debug.WriteLine(string.Format(
                "IP: {0}, email: {1}, REQ: {2}",
                ip,
                HttpContext.Current.User.Identity.Name,
                HttpContext.Current.Request.Url
            ));
        }
    }
}
