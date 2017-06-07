using Kaylan.Porperty.Web.ViewModel;
using Microsoft.AspNet.Identity.Owin;
using System;
using System.Web;
using System.Web.Mvc;

namespace Kaylan.Porperty.Web.Controllers
{
    public class LoginController : Controller
    {
        private ApplicationSignInManager _signInManager;

        public LoginController(ApplicationSignInManager signInManager)
        {
            SignInManager = signInManager;
        }

        public LoginController()
        {
        }

        public ApplicationSignInManager SignInManager
        {
            get
            {
                return _signInManager ?? HttpContext.GetOwinContext().Get<ApplicationSignInManager>();
            }
            private set
            {
                _signInManager = value;
            }
        }

        // GET: Login
        [HttpGet]
        public ActionResult SignIn()
        {
            return View();
        }

        [HttpPost]
        public ActionResult SignIn(LoginViewModel loginViewModel, string returnUrl)
        {
            if (!ModelState.IsValid)
            {
                return View(loginViewModel);
            }

            // This doesn't count login failures towards account lockout

            // To enable password failures to trigger account lockout, change to shouldLockout: true
            var result = SignInManager.PasswordSignIn(loginViewModel.Email, loginViewModel.Password, loginViewModel.RememberMe, shouldLockout: false);
            switch (result)
            {
                case SignInStatus.Success:
                    if (User.IsInRole("Admin"))
                    {
                        return RedirectToAction("AdminDashboard", "User");
                    }
                    else
                    {
                        return RedirectToAction("CustomerDashboard", "User");
                    }

                case SignInStatus.Failure:

                default:
                    ModelState.AddModelError("", "Invalid login attempt.");
                    return View(loginViewModel);
            }
        }

        private ActionResult RedirectToLocal(string returnUrl)
        {
            throw new NotImplementedException();
        }

        public ActionResult CreateLoginDetails()
        {
            return View();
        }
    }
}