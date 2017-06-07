using Kalyan.Property.Infrastructure;
using Kalyan.Property.Infrastructure.Models;
using Kaylan.Porperty.Web.ViewModel;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using System;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;

namespace Kaylan.Porperty.Web.Controllers
{
    public class UserController : Controller
    {
        private ApplicationUserManager _userManager;
        private IUnitOfWork unitOfWork;

        public UserController()
        {
            unitOfWork = new UnitOfWork();
        }

        public UserController(ApplicationUserManager userManager)
        {
            UserManager = userManager;
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

        // GET: User
        [HttpGet]
        public ActionResult CreateUser()
        {
            return View();
        }

        [HttpPost]
        public async Task<ActionResult> CreateUser(UserViewModel userViewModel)
        {
            if (ModelState.IsValid)
            {
                var user = new Users
                {
                    UserName = userViewModel.Email,
                    Email = userViewModel.Email,
                    DateOfBirth = DateTime.Now,
                    LastName = userViewModel.LastName,
                    FirstName = userViewModel.FirstName,
                    Phone = userViewModel.Phone,
                    Gender = userViewModel.Gender
                };
                var result = await UserManager.CreateAsync(user, userViewModel.Password);
                if (result.Succeeded)
                {
                    ViewBag.Message = "User Created Successfully.";

                    return View(new UserViewModel());
                }
                AddErrors(result);
            }
            return View(new UserViewModel());
        }

        private void AddErrors(IdentityResult result)
        {
            foreach (var error in result.Errors)
            {
                ModelState.AddModelError("", error);
            }
        }

        

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

        public ActionResult PropertyDetailsList(int Id)
        {
            PropertyDetail details = unitOfWork.Repository<PropertyDetail>().GetById(Id);
            if (details == null)
                Response.Write("<script>alert(' Property details not found')</script>");

           return View(details);


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