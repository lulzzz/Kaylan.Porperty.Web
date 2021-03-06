﻿using Kalyan.Property.Infrastructure;
using Kalyan.Property.Infrastructure.Models;
using Kaylan.Porperty.Web.ViewModel;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using PagedList;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using System.Web.UI;

namespace Kaylan.Porperty.Web.Controllers
{
    public class HomeController : Controller
    {
        private IUnitOfWork unitOfWork;

        public HomeController()
        {
            unitOfWork = new UnitOfWork();
        }

        private ApplicationUserManager _userManager;
        private int pageSize = 6;

        public HomeController(ApplicationUserManager userManager)
        {
            UserManager = userManager;
            unitOfWork = new UnitOfWork();
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

        public ActionResult Index(int? page)
        {
            var result = from pd in unitOfWork.Repository<PropertyDetail>().GetMany((k => k.Approved == true && k.Approved != false))

                          join a in unitOfWork.Repository<Area>().GetAll()
                         on pd.AreaId equals a.Id
                         
                         select new PropertyDetailListViewModel()
                         {
                             Bathroom = pd.Bathroom,
                             Bedroom = pd.Bedroom,
                             Approved = pd.Approved,
                             Id = pd.Id,
                             PropertyName = pd.PropertyName,
                             Parking = pd.Parking,
                             AreaName = a.Name,
                             ContractType = pd.ContractType,
                             PorpertyImageUrl = unitOfWork.Repository<PropertyImage>().Get(y => y.PropertyDetailId == pd.Id).ImagePath,
                             Price = pd.FromPrice
                         };

            var data = result.ToPagedList(page ?? 1, pageSize);

            

            return View(data);
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your app description page.";

            return View();
        }

        public ActionResult services()
        {
            ViewBag.Message = "Your app description page.";

            return View();
        }

        [HttpGet]
        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        [HttpPost]
        public ActionResult Contact(ContactViewModel contactVM)
        {
            if (ModelState.IsValid)
            {
                Contact contact = new Contact();
                contact.Name = contactVM.Name;
                contact.Message = contactVM.Commnet;
                contact.Email = contactVM.Email;
                contact.Phone = contactVM.Phone;
                contact.CreatedDate = DateTime.Now;

                unitOfWork.Repository<Contact>().Add(contact);
                unitOfWork.Commit();

                return new HttpStatusCodeResult(HttpStatusCode.OK);  // OK = 200
            }

            return new HttpStatusCodeResult(HttpStatusCode.BadRequest);  // OK = 400
        }

       

        public ActionResult Membership()
        {
            ViewBag.Message = "Your request page.";

            return View();
        }

        //public ActionResult Master()
        //{
        //    ViewBag.Message = "Your request page.";

        //    return View();
        //}
       [HttpGet]
        public ActionResult propertydetails(int? id )
        {
            var result = from pd in unitOfWork.Repository<PropertyDetail>().GetMany((k => k.Id == id))

                         join a in unitOfWork.Repository<PropertyImage>().GetMany((k => k.PropertyDetailId == id))
                        on pd.Id equals a.PropertyDetailId

                         select new ImageListViewModel()
                         {
                             Description = pd.PropertyDescription,
                             Id = pd.Id,
                             PorpertyImageUrl1 = unitOfWork.Repository<PropertyImage>().Get(y => y.PropertyDetailId == pd.Id).ImagePath,
                             PorpertyImageUrl2 = unitOfWork.Repository<PropertyImage>().Get(y => y.PropertyDetailId == pd.Id).ImagePath,
                             PorpertyImageUrl3 = unitOfWork.Repository<PropertyImage>().Get(y => y.PropertyDetailId == pd.Id).ImagePath,
                             AreaId =pd.AreaId,
                             Bedroom=pd.Bedroom,
                             Bathroom=pd.Bathroom,
                             CityId=pd.CityId,
                             Parking= pd.Parking,
                             PropertyName= pd.PropertyName,
                             PropertyAmenityMappingId=pd.PropertyAmenityMappingId,
                             ToPrice=pd.ToPrice
                             
                         };

            return View(result);

        }

        public ActionResult UserEnquiry(int? id)
        {
           // ViewBag.enquiry = unitOfWork.Repository<Userenquiery>().GetAll().Count();
                var result = from a in unitOfWork.Repository<PropertyDetail>().GetMany(k=>k.UserId==id)
                         join p in unitOfWork.Repository<Userenquiery>().GetAll()
                         on a.Id equals p.PropertyDetailId
                         select new UserenqueryViewModel()
                         {
                             Name = p.Name,
                             MobileNumber = p.MobileNumber,
                             Email = a.Email,
                             userid = a.UserId,
                             PropertyName = a.PropertyName,
                             AreaId =a.AreaId
                         };

           


            return PartialView(result);
        }

        [HttpGet]
        public ActionResult enqueryregister()
        {
            return View();
        }

        public ActionResult enqueryregister(UserenqueryViewModel userenquery,int? id)
        {


            var data = new Kalyan.Property.Infrastructure.Models.Userenquiery()
            {
                Name = userenquery.Name,
                Email = userenquery.Email,
                Date = DateTime.Now,
                MobileNumber = userenquery.MobileNumber,
                
            };
          var  PropertyDetailId = unitOfWork.Repository<PropertyDetail>().GetMany(m => m.Id == id);

            unitOfWork.Repository<Userenquiery>().Add(data);
            unitOfWork.Commit();
            
            ModelState.Clear();
            return View();
        }
        
        [HttpGet]
        public ActionResult Register()
        {
            return View();
        }

        [HttpPost]
        public async Task<ActionResult> Register(UserViewModel userViewModel)
        {
            if (ModelState.IsValid)
            {
                var imagesOne = SaveImgae(userViewModel.ImageUploadOne);
                var user = new Kalyan.Property.Infrastructure.Models.Users()
                {
                    UserName = userViewModel.Email,
                    Email = userViewModel.Email,
                    DateOfBirth = DateTime.Now,
                    LastName = userViewModel.LastName,
                    FirstName = userViewModel.FirstName,
                    Phone = userViewModel.Phone,
                    Gender = userViewModel.Gender,
                    //profileimage =userViewModel.ImageUploadOne,
                };

                var result = await UserManager.CreateAsync(user, userViewModel.Password);
                if (result.Succeeded)
                {
                    var currentUser = UserManager.FindByName(user.UserName);

                    var roleresult = UserManager.AddToRole(currentUser.Id, "Customer");

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

        //public ActionResult AllUser()
        //{
        //    ViewBag.Message = "Your request page.";

        //    return View();
        //}

        [OutputCache(Duration = 6000, Location = OutputCacheLocation.ServerAndClient)]
        public ActionResult GetAllPropertyType()
        {
            try
            {
                List<PropertyType> result = new List<PropertyType>();

                result = unitOfWork.Repository<PropertyType>().GetAll().ToList();

                return Json(result, JsonRequestBehavior.AllowGet);
            }
            catch (Exception exception)
            {
                System.Diagnostics.Debug.WriteLine(exception);
                return null;
            }
        }

        [OutputCache(Duration = 6000, Location = OutputCacheLocation.ServerAndClient)]
        public ActionResult GetAllCountry()
        {
            try
            {
                List<Country> result = new List<Country>();

                result = unitOfWork.Repository<Country>().GetAll().Select(x => new Country() { Id = x.Id, Name = x.Name }).ToList();

                return Json(result, JsonRequestBehavior.AllowGet);
            }
            catch (Exception exception)
            {
                System.Diagnostics.Debug.WriteLine(exception);
                return null;
            }
        }

        public ActionResult GetStateByCountry(int CountryId)
        {
            try
            {
                List<State> result = new List<State>();

                result = unitOfWork.Repository<State>().GetMany(x => x.CountryId == CountryId).Select(x => new State() { Id = x.Id, Name = x.Name }).ToList();

                return Json(result, JsonRequestBehavior.AllowGet);
            }
            catch (Exception exception)
            {
                System.Diagnostics.Debug.WriteLine(exception);
                return null;
            }
        }

        public ActionResult GetCityByState(int StateId)
        {
            try
            {
                List<City> result = new List<City>();

                result = unitOfWork.Repository<City>().GetMany(x => x.StateId == StateId).Select(x => new City() { Id = x.Id, Name = x.Name }).ToList();

                return Json(result, JsonRequestBehavior.AllowGet);
            }
            catch (Exception exception)
            {
                System.Diagnostics.Debug.WriteLine(exception);
                return null;
            }
        }

        public ActionResult AdminProfile()
        {
            return View();
        }

        public ActionResult USerProfile()
        {
            return View();
        }

        public ActionResult PropertyRequest()
        {
            return View(new PropertyRequestViewModel());
        }

        [HttpPost]
        public ActionResult CreatePropertyRequest(PropertyRequestViewModel propertyrequest)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    //propertyrequest.PropertyRequestContractTypeId = 1;
                    unitOfWork.Repository<PropertyRequest>().Add(propertyrequest.GetPropertyRequest());
                    bool result = unitOfWork.Commit();

                    return RedirectToAction("Index", "Home");
                }
            }
            catch (Exception e)
            {
                ModelState.AddModelError("", "Unable to save changes. " +
                  "Try again, and if the problem persists see your system administrator.");
            }
            return View(propertyrequest);
        }

        [HttpGet]
        [OutputCache(Duration = 6000, Location = OutputCacheLocation.ServerAndClient)]
        public ActionResult GetAllPropertyRequestContractType()
        {
            List<PropertyRequestContractType> result = new List<PropertyRequestContractType>();
            try
            {
                result = unitOfWork.Repository<PropertyRequestContractType>().GetAll().Select(x => new PropertyRequestContractType() { Id = x.Id, Name = x.Name }).ToList();

                return Json(result, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e)
            {
                return null;
            }
        }

        [HttpGet]
        [OutputCache(Duration = 6000, Location = OutputCacheLocation.ServerAndClient)]
        public ActionResult GetAllPropertyRequestPrice()
        {
            List<PropertyRequestPrice> result = new List<PropertyRequestPrice>();
            try
            {
                result = unitOfWork.Repository<PropertyRequestPrice>().GetAll().Select(x => new PropertyRequestPrice() { Id = x.Id, Price = x.Price }).ToList();

                return Json(result, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e)
            {
                return null;
            }
        }

        [HttpGet]
        [OutputCache(Duration = 6000, Location = OutputCacheLocation.ServerAndClient)]
        public ActionResult GetAllPropertyRequestType()
        {
            List<PropertyRequestType> result = new List<PropertyRequestType>();
            try
            {
                result = unitOfWork.Repository<PropertyRequestType>().GetAll().Select(x => new PropertyRequestType() { Id = x.Id, Name = x.Name }).ToList();

                return Json(result, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e)
            {
                return null;
            }
        }

        [HttpGet]
        [OutputCache(Duration = 6000, Location = OutputCacheLocation.ServerAndClient)]
        public ActionResult GetAllPropertyRequestArea()
        {
            List<PropertyRequestArea> result = new List<PropertyRequestArea>();
            try
            {
                result = unitOfWork.Repository<PropertyRequestArea>().GetAll().Select(x => new PropertyRequestArea() { Id = x.Id, Name = x.Name }).ToList();

                return Json(result, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e)
            {
                return null;
            }
        }

        public ActionResult PropertyRequestDetails(long Id)
        {
            PropertyRequest details = unitOfWork.Repository<PropertyRequest>().GetById(Id);
            if (details == null)
                Response.Write("<script>alert(' Property Request details not found')</script>");

            return View(details);
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