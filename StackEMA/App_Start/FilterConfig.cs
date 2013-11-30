using System.Web;
using System.Web.Mvc;
using StackEMA.App_Start;

namespace StackEMA
{
    public class FilterConfig
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
            filters.Add(new System.Web.Mvc.AuthorizeAttribute());
            filters.Add(new TimerFilterAttribute());
            filters.Add(new LoggerAttribute());
        }
    }
}