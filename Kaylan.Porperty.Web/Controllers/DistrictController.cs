using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Kaylan.Porperty.Web.Controllers
{
    public class DistrictController : Controller
    {
        // GET: District
        public ActionResult CreateDistrict()
        {
            return View();
        }
        public ActionResult CreateDistrictDetails()
        {
            return View();
        }
    }
}