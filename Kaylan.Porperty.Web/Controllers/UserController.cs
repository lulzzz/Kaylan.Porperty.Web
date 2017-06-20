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
using System.Configuration;
using PagedList;


namespace Kaylan.Porperty.Web.Controllers
{
    [Authorize]
    public class UserController : Controller
    {
        private CustomeDbContext db = new CustomeDbContext();

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

        [HttpGet]
        public ActionResult UserProfile(int id)
        {
            CustomeDbContext db = new CustomeDbContext();
            Users users = db.Users.Find(id);
            return View(users);
        }

        [HttpPost]
        public ActionResult UserProfile(int id,Users users, FormCollection frm, HttpPostedFileBase files)
        {
           
            {
                //var model = db.Users.Find(users.Id);
                //string oldimage = model.profileimage;
                if (files != null)
                {
                    var adcd = new Kalyan.Property.Infrastructure.Models.Users();
                    {
                        string filename = Path.GetFileName(files.FileName);
                        var path = ConfigurationManager.AppSettings["Photos"].ToString() + "/" + filename;
                        files.SaveAs(path);
                        if (users.profileimage == null || users.profileimage == "")
                            users.profileimage = filename;
                        else
                            users.profileimage += "," + filename;
                    }
                   // model.profileimage = users.profileimage;

                    iUnitOfWork.Repository<Users>().Add(adcd);
                    iUnitOfWork.Commit();
                }
                
            }
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
                FromPrice = Convert.ToString(propertyDetail.Price),
                Parking = "2",
                ContractType = iUnitOfWork.Repository<ContractType>().Get(x => x.Id == propertyDetail.SelectedContractId).Name,
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
            ModelState.Clear();
            return View(viewModel);
            
        }

        public ActionResult PropertyDetailsList(int id)
        {
            var list = from r in iUnitOfWork.Repository<PropertyDetail>().GetMany(r => r.Id == id).Where(b => b.Approved == true)
                       //join a in iUnitOfWork.Repository<Users>().GetMany(r => r.Id == id)on r.UserId equals a.Id
                       join z in iUnitOfWork.Repository<PropertyImage>().GetMany(r => r.PropertyDetailId == id) on r.Id equals z.PropertyDetailId
                     //  join k in iUnitOfWork.Repository<PropertyAmenityMapping>().GetMany(r => r.PropertyDetailId == id) on r.Id equals k.PropertyDetailId
                       select new Approvepropertydetails()
                       {
                           PropertyDescription = r.PropertyDescription,
                           PorpertyImageUrl1 = iUnitOfWork.Repository<PropertyImage>().Get(y => y.PropertyDetailId == id).ImagePath,
                           PorpertyImageUrl2 = iUnitOfWork.Repository<PropertyImage>().Get(y => y.PropertyDetailId ==id).ImagePath,
                           PorpertyImageUrl3 = iUnitOfWork.Repository<PropertyImage>().Get(y => y.PropertyDetailId == id).ImagePath,
                           PropertyName = r.PropertyName,
                           AreaId = r.AreaId,
                           CityId = r.CityId,
                           Bedroom = r.Bedroom,
                           Bathroom = r.Bedroom,
                           Parking = r.Parking,
                          // AmenityId=k.AmenityId,

                       };

            list = list.Distinct().ToList();
            return View(list);
        }

        public ActionResult AdminDashboard()
        {
            CustomeDbContext db = new CustomeDbContext();

            IList<Users> UserList = new List<Users>();

            ViewBag.UserList = iUnitOfWork.Repository<Users>().GetAll().ToList().Count();

            //IList<PropertyDetail> pendingapproved = new List<PropertyDetail>();
            // ViewBag.approved = pendingapproved.Where(x => x.Approved == null).Count() == 0 ? 0 : pendingapproved.Where(x => x.Approved == null).Count();

            ViewBag.approved = iUnitOfWork.Repository<PropertyDetail>().GetMany((k => k.Approved == false && k.Approved != true)).Count();
            ViewBag.Unapproved = iUnitOfWork.Repository<PropertyDetail>().GetMany((k => k.Approved == true && k.Approved != false)).Count();
            ViewBag.salescount = db.ContractTypes.Select(k => k.Id == 1).Count();
            ViewBag.rentcount = db.ContractTypes.Select(k => k.Id == 2).Count();

            ViewBag.propertyRequest = db.PropertyRequests.Count();
            var dateCriteria = DateTime.Now.Date.AddDays(-7);
            ViewBag.newlisting = iUnitOfWork.Repository<PropertyRequest>().GetMany(r => r.CreatedDate >= dateCriteria).Count();

            return View();
        }

        public ActionResult TotalUser()
        {
            var list = iUnitOfWork.Repository<Users>().GetAll().ToList();
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

        public ActionResult RentList(string sortorder, int? page)
        {
      
            ViewBag.Currentsort = sortorder;
            // var list = iUnitOfWork.Repository<PropertyDetail>().GetMany((k => k.ContractType == "For Rent" && k.ContractType != ""));
            var list = iUnitOfWork.Repository<PropertyDetail>().GetMany((k => k.Approved == true && k.Approved != false));

            switch (sortorder)
            {
                case "Address":
                    list = list.OrderByDescending(s => s.Email);
                    break;

                default:
                    list = list.OrderByDescending(s => s.Email);
                    break;
            }
            int pageSize = 2;
            int pageNumber = (page ?? 1);


            if (list == null)
                Response.Write("<script>alert(' Property for Rent not found')</script>");

            return PartialView(list.ToPagedList(pageNumber, pageSize));

        }

        public ActionResult PendingUser()
        {


            var list = iUnitOfWork.Repository<PropertyDetail>().GetMany((k => k.Approved == false && k.Approved != true));
            if (list == null)
                Response.Write("<script>alert(' Approved property For user not Found')</script>");

            return PartialView(list);
        }

        [HttpPost]
        public ActionResult PendingUser(System.Web.Mvc.FormCollection formcollection)
        {
            CustomeDbContext db = new CustomeDbContext();
            string[] ids = formcollection["UserID"].Split(new char[] { ',' });
            foreach (string id in ids)
            {
                var list1 = iUnitOfWork.Repository<PropertyDetail>().GetById(int.Parse(id));
                list1.Approved = true;
                iUnitOfWork.Commit();
            }
            var list = iUnitOfWork.Repository<PropertyDetail>().GetMany((k => k.Approved == false && k.Approved != true));
            return RedirectToAction("AdminDashboard");
        }

        public ActionResult ApprovedProperty()
        {
         var list = iUnitOfWork.Repository<PropertyDetail>().GetMany((k => k.Approved == true && k.Approved != false));
           if (list == null)
               Response.Write("<script>alert(' Approved property For user not Found')</script>");
            
            return PartialView(list);
        }

        [HttpPost]
        public ActionResult ApprovedProperty(System.Web.Mvc.FormCollection formcollection)
        {
            CustomeDbContext db = new CustomeDbContext();
            string[] ids = formcollection["UserID"].Split(new char[] { ',' });
            foreach (string id in ids)
            {
                var list1 = iUnitOfWork.Repository<PropertyDetail>().GetById(int.Parse(id));
                list1.Approved = false;
                iUnitOfWork.Commit();
            }
            var list = iUnitOfWork.Repository<PropertyDetail>().GetMany((k => k.Approved == true && k.Approved != false));
            return RedirectToAction("AdminDashboard");
        }

        public ActionResult PropertyRequestListing()
        {
            var list = from pr in iUnitOfWork.Repository<PropertyRequest>().GetAll()
                       join a in iUnitOfWork.Repository<Area>().GetAll()
                       on pr.PropertyRequestAreaId equals a.Id

                       select new PropertyRequestListingViewModel()
                       {
                           FullName = pr.FullName,
                           Email = pr.Email,
                           FromPrice = pr.PropertyRequestPriceMin.Price,
                           ToPrice = pr.PropertyRequestPriceMax.Price,
                           ContactType = pr.PropertyRequestContractType.Name,
                           CreatedDate = pr.CreatedDate,
                           PropertyRequestArea = a.Name,
                           PropertyDescription = pr.PropertyDescription,
                           IsAgree = pr.IsAgree,
                           PhoneNumber = pr.PhoneNumber,
                           PropertyRequestId = pr.PropertyRequestId
                       };
            if (list == null)
                Response.Write("<script>alert(' Property Request detailsList  not found')</script>");

            return PartialView(list);
        }

        public ActionResult NewListing()
        {
            var dateCriteria = DateTime.Now.Date.AddDays(-7);
            var list = iUnitOfWork.Repository<PropertyRequest>().GetMany(r => r.CreatedDate >= dateCriteria);
            if (list == null)
                Response.Write("<script>alert(' Property NewListing  not found')</script>");

            return PartialView(list);
        }

        public ActionResult EnquiryforlistedProperty()
        {
            var list = iUnitOfWork.Repository<PropertyRequest>().GetAll().ToList();
            if (list == null)
                Response.Write("<script>alert(' Enquiry for listed Property  not found')</script>");

            return PartialView(list);
        }
        private string SaveImgae(HttpPostedFileBase file)
        {
            string picture = Path.GetFileName(file.FileName);
            long ticks = DateTime.UtcNow.Ticks;
            string path = Path.Combine(Server.MapPath("~/Images/Server"), string.Format("{0}_{1}", ticks, picture));

            file.SaveAs(path);
            return string.Format("~/Images/Server/{0}_{1}", ticks, picture);
        }



        //from here customer dashboard starts
        public ActionResult CustomerDashboard(int id)
           {
        
            CustomeDbContext db = new CustomeDbContext();

            ViewBag.userapproved = iUnitOfWork.Repository<PropertyDetail>().GetMany(k=>k.UserId==id).Where( k => k.Approved == true && k.Approved != false).Count();
            
            ViewBag.pendindapprove = iUnitOfWork.Repository<PropertyDetail>().GetMany(r => r.UserId == id).Where(k => k.Approved == false).Count();

            ViewBag.newenquiry = iUnitOfWork.Repository<PropertyDetail>().GetMany(m => m.UserId == id).Count();

            return View();
        }


        //public ActionResult pendingapproveofcust(int id)
        //{

        //    var list = iUnitOfWork.Repository<PropertyDetail>().GetMany(m => m.UserId == id).Where(m => m.Approved == true && m.Approved != false);
        //    if (list == null)
        //        Response.Write("<script>alert(' No List Found ')</script>");

        //    return PartialView(list);
        //}
        public ActionResult pendingapproveofcust(int id)
        {

            var list = iUnitOfWork.Repository<PropertyDetail>().GetMany((k => k.Approved == false && k.Approved != true));
            if (list == null)
            Response.Write("<script>alert(' No Properties Pending for approval')</script>");

            return PartialView(list);
        }

        public ActionResult approvepropertyofcust(int id)
        {

            var list = iUnitOfWork.Repository<PropertyDetail>().GetMany((k => k.Approved == true && k.Approved != false));
            if (list == null)
                Response.Write("<script>alert(' No  Approved Property Found ')</script>");

            return PartialView(list);
        }


        public ActionResult propertyrequestofcust(int id)
        {

            var list = iUnitOfWork.Repository<PropertyRequest>().GetAll().ToList();
            if (list == null)
                Response.Write("<script>alert('  Property  request not found')</script>");

            return PartialView(list);
        }
    }
}