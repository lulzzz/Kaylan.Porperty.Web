using Kalyan.Property.Infrastructure;
using Kalyan.Property.Infrastructure.Models;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;

namespace Kaylan.Porperty.Web.Controllers
{
    public class HomeController : Controller
    {
        private IUnitOfWork unitOfWork;

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

        public ActionResult AllUser()
        {
            ViewBag.Message = "Your request page.";

            return View();
        }

        public ActionResult GetAllPropertyType()
        {
            List<PropertyType> result = new List<PropertyType>();
            using (unitOfWork = new UnitOfWork())
            {
                result = unitOfWork.Repository<PropertyType>().GetAll().ToList();
            }
            return Json(result, JsonRequestBehavior.AllowGet);
        }

        public ActionResult GetAllCountry()
        {
            List<Country> result = new List<Country>();
            using (unitOfWork = new UnitOfWork())
            {
                result = unitOfWork.Repository<Country>().GetAll().ToList();
            }
            return Json(result, JsonRequestBehavior.AllowGet);
        }

        public ActionResult GetStateByCountry(int CountryId)
        {
            List<State> result = new List<State>();
            using (unitOfWork = new UnitOfWork())
            {
                result = unitOfWork.Repository<State>().GetMany(x => x.CountryId == CountryId).ToList();
            }
            return Json(result, JsonRequestBehavior.AllowGet);
        }

        public ActionResult GetCityByState(int StateId)
        {
            List<City> result = new List<City>();
            using (unitOfWork = new UnitOfWork())
            {
                result = unitOfWork.Repository<City>().GetMany(x => x.StateId == StateId).ToList();
            }
            return Json(result, JsonRequestBehavior.AllowGet);
        }
    }
}