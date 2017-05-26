using Kalyan.Property.Infrastructure;
using Kalyan.Property.Infrastructure.Models;
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

        //public ActionResult About()
        //{
        //    ViewBag.Message = "Your application description page.";

        //    return View();
        //}

        //public ActionResult Contact()
        //{
        //    ViewBag.Message = "Your contact page.";

        //    return View();
        //}
    }
}