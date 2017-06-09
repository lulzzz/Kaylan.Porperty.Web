using Kalyan.Property.Infrastructure;
using Kalyan.Property.Infrastructure.Models;
using Kaylan.Porperty.Web.ViewModel;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;

namespace Kaylan.Porperty.Web.Controllers
{
    [Authorize]
    public class UserController : Controller
    {
        CustomeDbContext db = new CustomeDbContext();

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
            PropertyDetailViewModel viewModel = GetPropertyDetailViewModel();

            return View(viewModel);
        }

        private PropertyDetailViewModel GetPropertyDetailViewModel()
        {
            var country = iUnitOfWork.Repository<Country>().GetAll().Select(x => new SelectListItem { Text = x.Name, Value = Convert.ToString(x.Id) });
            var state = iUnitOfWork.Repository<State>().GetAll().Select(x => new SelectListItem { Text = x.Name, Value = Convert.ToString(x.Id) });
            var city = iUnitOfWork.Repository<City>().GetAll().Select(x => new SelectListItem { Text = x.Name, Value = Convert.ToString(x.Id) });
            var area = iUnitOfWork.Repository<Area>().GetAll().Select(x => new SelectListItem { Text = x.Name, Value = Convert.ToString(x.Id) });
            var propertyType = iUnitOfWork.Repository<PropertyType>().GetAll().Select(x => new SelectListItem { Text = x.Name, Value = Convert.ToString(x.Id) });
            var contractType = iUnitOfWork.Repository<ContractType>().GetAll().Select(x => new SelectListItem { Text = x.Name, Value = Convert.ToString(x.Id) });
            var amenity = iUnitOfWork.Repository<Amenity>().GetAll().Select(x => new SelectListItem { Text = x.Name, Value = Convert.ToString(x.Id), Selected = false });

            var viewModel = new PropertyDetailViewModel()
            {
                CountryList = new SelectList(country, "Value", "Text"),
                StateList = new SelectList(state, "Value", "Text"),
                CityList = new SelectList(city, "Value", "Text"),
                AreaList = new SelectList(area, "Value", "Text"),
                PropertyTypeList = new SelectList(propertyType, "Value", "Text"),
                ContractList = new SelectList(contractType, "Value", "Text"),
                Amenity = new System.Collections.Generic.List<SelectListItem>(amenity)
            };
            return viewModel;
        }

        [HttpPost]
        public ActionResult PropertyDetail(PropertyDetailViewModel propertyDetail)
        {
            var imagesOne = SaveImgae(propertyDetail.ImageUploadOne);
            var imagesTwo = SaveImgae(propertyDetail.ImageUploadTwo);
            var imagesThree = SaveImgae(propertyDetail.ImageUploadThree);

            var data = new Kalyan.Property.Infrastructure.Models.PropertyDetail()
            {
                IsActive = false,
                Approved = false,
                CountryId = propertyDetail.SelectedCountryId,
                StateId = propertyDetail.SelectedStateId,
                CityId = propertyDetail.SelectedCityId,
                AreaId = propertyDetail.SelectedAreaId,
                PropertyName = propertyDetail.PropertyName,
                PropertyDescription = propertyDetail.PropertyDescription,
                FullName = propertyDetail.FullName,
                Phone = propertyDetail.Phone,
                Email = propertyDetail.Email,
                Comments = propertyDetail.Comments,
                Date = DateTime.Now,
                Bathroom = propertyDetail.SelectedBathtId,
                Bedroom = propertyDetail.SelectedBedtId,
                UserId = User.Identity.GetUserId<int>(),
                PropertyImages = new List<PropertyImage>()
                {
                    new PropertyImage { ImagePath=imagesOne,IsActive=true},
                    new PropertyImage { ImagePath=imagesTwo,IsActive=true},
                    new PropertyImage { ImagePath=imagesThree,IsActive=true},
                }
                ,
                PropertyAmenityMappings = propertyDetail.Amenity.Where(x => x.Selected == true).Select(x => new PropertyAmenityMapping() { AmenityId = Convert.ToInt32(x.Value) }).ToList()
            };

            iUnitOfWork.Repository<PropertyDetail>().Add(data);
            iUnitOfWork.Commit();

            PropertyDetailViewModel viewModel = GetPropertyDetailViewModel();

            return View(viewModel);
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

            CustomeDbContext db = new CustomeDbContext();

              IList<Users> UserList = new List<Users>();

              ViewBag.UserList = iUnitOfWork.Repository<Users>().GetAll().ToList().Count();

              IList<PropertyDetail> pendingapproved = new List<PropertyDetail>();
               ViewBag.approved = pendingapproved.Where(x => x.Approved == null).Count() == 0 ? 0 : pendingapproved.Where(x => x.Approved == null).Count();

              ViewBag.salescount = db.ContractTypes.Select(k => k.Id == 1).Count();
             ViewBag.rentcount = db.ContractTypes.Select(k=>k.Id==2).Count();

            ViewBag.propertyRequest = db.PropertyRequests.Count();

            return View();
        }


        public ActionResult TotalUser()
        {
           var list= iUnitOfWork.Repository<Users>().GetAll().ToList();
            if (list == null)
                Response.Write("<script>alert(' Property Request details not found')</script>");

            return PartialView(list);

           
        }


        public ActionResult SalesList()
        {
            var list = iUnitOfWork.Repository<PropertyDetail>().GetMany((k => k.ContractType == "For Sale" && k.ContractType != ""));
               
            if (list == null)
                Response.Write("<script>alert(' Property For Sale not found')</script>");
            return PartialView(list);
        }

        public ActionResult RentList()
        {
            var list = iUnitOfWork.Repository<PropertyDetail>().GetMany((k => k.ContractType == "For Rent" && k.ContractType != ""));
            if (list == null)
                Response.Write("<script>alert(' Property for Rent not found')</script>");

            return PartialView(list);


        }


        //public ActionResult NewListing()
        //{
        //    var list = iUnitOfWork.Repository<PropertyDetail>().Get(k => k.ContractType == "For Rent");
        //    if (list == null)
        //        Response.Write("<script>alert(' Property Request details not found')</script>");

        //    return PartialView(list);


        //}



        public ActionResult PropertyRequestListing()
        {
            var list = iUnitOfWork.Repository<PropertyRequest>().GetAll().ToList();
            if (list == null)
                Response.Write("<script>alert(' Property Request detailsList  not found')</script>");

            return PartialView(list);


        }









        public ActionResult CustomerDashboard()
        {
            return View();
        }

        private string SaveImgae(HttpPostedFileBase file)
        {
            string picture = Path.GetFileName(file.FileName);
            long ticks = DateTime.UtcNow.Ticks;
            string path = Path.Combine(Server.MapPath("~/Images/Server"), string.Format("{0}_{1}", ticks, picture));

            file.SaveAs(path);
            return string.Format("~/Images/Server/{0}_{1}", ticks, picture);
        }
    }
}