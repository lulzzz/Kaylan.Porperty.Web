using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Kaylan.Porperty.Web.Controllers
{
    public class AreaController : Controller
    {
        // GET: Area
        public ActionResult CreateArea()
        {
            return View();
        }

        public ActionResult CreateAreaDetails()
        {
            return View();
        }
    }
}