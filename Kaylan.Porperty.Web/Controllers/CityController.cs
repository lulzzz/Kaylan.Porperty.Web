using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Kaylan.Porperty.Web.Controllers
{
    public class CityController : Controller
    {
        // GET: City
        public ActionResult CreateCity()
        {
            return View();
        }
        public ActionResult CreateCityDetails()
        {
            return View();
        }
    }
}