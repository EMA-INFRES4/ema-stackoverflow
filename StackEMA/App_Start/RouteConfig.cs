using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace StackEMA
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            ClassRoute cr = new ClassRoute("{lang}/{controller}/{action}", new MvcRouteHandler());
            routes.Add(cr);
            ClassRoute cr2 = new ClassRoute("{lang}/{controller}/{action}/{id}", new MvcRouteHandler());
            routes.Add(cr2);

            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Post", action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}