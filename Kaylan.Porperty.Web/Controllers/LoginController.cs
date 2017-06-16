using Kaylan.Porperty.Web.ViewModel;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using System;
using System.Web;
using System.Web.Mvc;

namespace Kaylan.Porperty.Web.Controllers
{
    public class LoginController : Controller
    {
        private ApplicationSignInManager _signInManager;
        private ApplicationUserManager _userManager;

        public LoginController()
        {
        }

        public LoginController(ApplicationUserManager userManager, ApplicationSignInManager signInManager)
        {
            UserManager = userManager;
            SignInManager = signInManager;
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

        public ApplicationUserManager UserManager
        {
            get
            {
                return _userManager ?? HttpContext.GetOwinContext().GetUserManager<ApplicationUserManager>();
            }
            private set
            {
                _userManager = value;
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

                    var user = UserManager.FindByName(loginViewModel.Email);

                    if (UserManager.IsInRole(user.Id, "Admin"))
                    {
                        return RedirectToAction("AdminDashboard", "User");
                    }
                    else
                    {
                        return RedirectToAction("CustomerDashboard", "User", new { id = user.Id });
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