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
            using (unitOfWork = new UnitOfWork())
            {
                unitOfWork.Repository<Country>().Add(new Country() { Name = "England" });
                var result = unitOfWork.Commit();
            }

            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}