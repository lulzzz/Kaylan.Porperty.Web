using Kalyan.Property.Infrastructure;
using Kalyan.Property.Infrastructure.Models;
using Kaylan.Porperty.Web.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
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

        public ActionResult Index()
        {
            //using (unitOfWork = new UnitOfWork())
            //{
            //    unitOfWork.Repository<Countries>().Add(new Countries() { Name = "England" });
            //    var result = unitOfWork.Commit();
            //}

            return View();
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

        public ActionResult Admin()
        {
            ViewBag.Message = "Your request page.";

            return View();
        }

        public ActionResult Membership()
        {
            ViewBag.Message = "Your request page.";

            return View();
        }

        public ActionResult Master()
        {
            ViewBag.Message = "Your request page.";

            return View();
        }
        public ActionResult Details()
        {
            ViewBag.Message = "Your request Page";
            return View();
        }

        public ActionResult AllUser()
        {
            ViewBag.Message = "Your request page.";

            return View();
        }

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



        public ActionResult AdminProfile( )
        {
            return View();
        }
        public ActionResult USerProfile()
        {
            return View();
        }

    }
}