using Kalyan.Property.Infrastructure;
using Kalyan.Property.Infrastructure.Models;
using Kaylan.Porperty.Web.ViewModel;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using System;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;

namespace Kaylan.Porperty.Web.Controllers
{
    [Authorize]
    public class UserController : Controller
    {
        private ApplicationUserManager _userManager;
        private IUnitOfWork iUnitOfWork;

        public UserController()
        {
            iUnitOfWork = new UnitOfWork();
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

        [HttpGet]
        public ActionResult PropertyDetail()
        {
            var country = iUnitOfWork.Repository<Country>().GetAll().Select(x => new SelectListItem { Text = x.Name, Value = Convert.ToString(x.Id) });
            var state = iUnitOfWork.Repository<State>().GetAll().Select(x => new SelectListItem { Text = x.Name, Value = Convert.ToString(x.Id) });
            var city = iUnitOfWork.Repository<City>().GetAll().Select(x => new SelectListItem { Text = x.Name, Value = Convert.ToString(x.Id) });
            var area = iUnitOfWork.Repository<Area>().GetAll().Select(x => new SelectListItem { Text = x.Name, Value = Convert.ToString(x.Id) });
            var propertyType = iUnitOfWork.Repository<PropertyType>().GetAll().Select(x => new SelectListItem { Text = x.Name, Value = Convert.ToString(x.Id) });
            var contractType = iUnitOfWork.Repository<ContractType>().GetAll().Select(x => new SelectListItem { Text = x.Name, Value = Convert.ToString(x.Id) });
            var amenity = iUnitOfWork.Repository<Amenity>().GetAll().Select(x => new SelectListItem { Text = x.Name, Value = Convert.ToString(x.Id) });

            return View(new PropertyDetailViewModel(country, state, city, area, contractType, propertyType, amenity));
        }

        [HttpPost]
        public ActionResult PropertyDetail(PropertyDetailViewModel propertyDetail)
        {
            var country = iUnitOfWork.Repository<Country>().GetAll().Select(x => new SelectListItem { Text = x.Name, Value = Convert.ToString(x.Id) });
            var state = iUnitOfWork.Repository<State>().GetAll().Select(x => new SelectListItem { Text = x.Name, Value = Convert.ToString(x.Id) });
            var city = iUnitOfWork.Repository<City>().GetAll().Select(x => new SelectListItem { Text = x.Name, Value = Convert.ToString(x.Id) });
            var area = iUnitOfWork.Repository<Area>().GetAll().Select(x => new SelectListItem { Text = x.Name, Value = Convert.ToString(x.Id) });
            var propertyType = iUnitOfWork.Repository<PropertyType>().GetAll().Select(x => new SelectListItem { Text = x.Name, Value = Convert.ToString(x.Id) });
            var contractType = iUnitOfWork.Repository<ContractType>().GetAll().Select(x => new SelectListItem { Text = x.Name, Value = Convert.ToString(x.Id) });
            var amenity = iUnitOfWork.Repository<Amenity>().GetAll().Select(x => new SelectListItem { Text = x.Name, Value = Convert.ToString(x.Id) });

            return View(new PropertyDetailViewModel(country, state, city, area, contractType, propertyType, amenity));
        }

        public ActionResult PropertyDetailsList(int Id)
        {
            //PropertyDetail details = unitOfWork.Repository<PropertyDetail>().GetById(Id);
            //if (details == null)
            //    Response.Write("<script>alert(' Property details not found')</script>");

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