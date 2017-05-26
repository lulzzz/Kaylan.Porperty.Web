using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Kaylan.Porperty.Web.Controllers
{
    public class CountryController : Controller
    {
        // GET: Country
        public ActionResult CreateCountry()
        {
            return View();
        }
        public ActionResult CreateCountryDetails()
        {
            return View();
        }
    }
}