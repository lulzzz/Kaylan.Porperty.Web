using Kalyan.Property.Infrastructure;
using Kalyan.Property.Infrastructure.Models;
using System.Data;
using System.Web.Mvc;

namespace Kaylan.Porperty.Web.Controllers
{
    public class PropertyRequestController : Controller
    {
        private IUnitOfWork unitOfWork;

        // GET: PropertyRequest
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Index(int id)
        {
            return View();
        }
        public ActionResult CreatePropertyRequest()
        {
            return View(new PropertyRequest());
        }

        [HttpPost]
        public ActionResult CreatePropertyRequest(PropertyRequest propertyrequest)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    using (unitOfWork = new UnitOfWork())
                    {
                        unitOfWork.Repository<PropertyRequest>().Add(propertyrequest);
                        bool result = unitOfWork.Commit();
                    }

                    return RedirectToAction("Index");
                }
            }
            catch (DataException)
            {
                ModelState.AddModelError("", "Unable to save changes. " +
                  "Try again, and if the problem persists see your system administrator.");
            }
            return View(propertyrequest);
        }
    }
}