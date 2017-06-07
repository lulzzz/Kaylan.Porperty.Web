using Microsoft.AspNet.Identity;
using System.Web;
using System.Web.Mvc;

namespace Kaylan.Porperty.Web.Controllers
{
    [Authorize]
    public class UserController : Controller
    {
        public ActionResult CreateUserDetails()
        {
            return View();
        }

        public ActionResult ForgotPassword()
        {
            return View();
        }

        public ActionResult UserProfile()
        {
            return View();
        }

        public ActionResult CreatNewPassword()
        {
            return View();
        }

        public ActionResult AllUser()
        {
            ViewBag.Message = "Your request page.";

            return View();
        }

        public ActionResult LogOut()
        {
            HttpContext.GetOwinContext().Authentication.SignOut(DefaultAuthenticationTypes.ApplicationCookie);
            return RedirectToAction("Index", "Home");
        }

        public ActionResult PropertyDetail()
        {
            return View();
        }

        public ActionResult AdminDashboard()
        {
            return View();
        }

        public ActionResult CustomerDashboard()
        {
            return View();
        }
    }
}