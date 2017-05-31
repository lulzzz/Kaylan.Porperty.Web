using Kalyan.Property.Infrastructure.Models;
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

            Area a = new Area();
            return View(a);
        }

        public ActionResult CreateAreaDetails()
        {
            Area a = new Area();
            return View(a);
        }
    }
}