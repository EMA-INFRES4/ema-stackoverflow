using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;


namespace StackEMA
{
    public class MobileEngine : RazorViewEngine
    {
        public override ViewEngineResult FindView(ControllerContext controllerContext, string viewName, string masterName, bool useCache)
        {
            ViewEngineResult result = null;
            var request = controllerContext.HttpContext.Request;

            if (request.Browser.IsMobileDevice)
            {
                result = base.FindView(controllerContext, "Mobile/" + viewName, "Mobile/" + masterName, useCache);
            }

            // Desktop
            if (result == null || result.View == null)
            {
                result = base.FindView(controllerContext, viewName, masterName, useCache);
            }

            return result;
        }

        public override ViewEngineResult FindPartialView(ControllerContext controllerContext, string partialViewName, bool useCache)
        {
            ViewEngineResult result = null;
            var request = controllerContext.HttpContext.Request;

            if (request.Browser.IsMobileDevice)
            {
                result = base.FindPartialView(controllerContext, "Mobile/" + partialViewName, useCache);
            }

            // Desktop
            if (result == null || result.View == null)
            {
                result = base.FindPartialView(controllerContext, partialViewName, useCache);
            }

            return result;
        }

    }
}