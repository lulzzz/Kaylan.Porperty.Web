
using Kaylan.Porperty.Web.ViewModel;
using Microsoft.AspNet.Identity.Owin;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using System;

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
        public ActionResult CreateLogin()
        {
            return View();
        }

        [HttpPost]
        public async Task<ActionResult> CreateLogin(LoginViewModel loginViewModel, string returnUrl)
        {
            if (!ModelState.IsValid)
            {
                return View(loginViewModel);
            }

            // This doesn't count login failures towards account lockout
            // To enable password failures to trigger account lockout, change to shouldLockout: true
            var result = await SignInManager.PasswordSignInAsync(loginViewModel.Email, loginViewModel.Password, loginViewModel.RememberMe, shouldLockout: false);
            switch (result)
            {
                case SignInStatus.Success:
                    return RedirectToAction("Index", "Home");
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