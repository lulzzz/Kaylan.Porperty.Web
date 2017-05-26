using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Kaylan.Porperty.Web.Controllers
{
    public class LoginController : Controller
    {
        // GET: Login
        public ActionResult CreateLogin()
        {
            return View();
        }
        public ActionResult CreateLoginDetails()
        {
            return View();
        }
    }
}