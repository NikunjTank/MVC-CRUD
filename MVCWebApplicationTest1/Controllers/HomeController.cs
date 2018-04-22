using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MVCWebApplicationTest1.Controllers
{
    [RoutePrefix("")]
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }
              
    }
}