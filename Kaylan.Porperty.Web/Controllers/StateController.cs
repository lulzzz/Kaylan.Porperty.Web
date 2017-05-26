using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Kaylan.Porperty.Web.Controllers
{
    public class StateController : Controller
    {
        // GET: State
        public ActionResult CreateState()
        {
            return View();
        }
        public ActionResult CreateStateDetails()
        {
            return View();
        }
    }
}