using Kalyan.Property.Infrastructure;
using Kalyan.Property.Infrastructure.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Kaylan.Porperty.Web.Controllers
{
    public class DistrictController : Controller
    {

        private IUnitOfWork unitOfWork;

        public DistrictController()
        {
            unitOfWork = new UnitOfWork();
        }





        // GET: District
        public ActionResult CreateDistrict()
        {
            return View();
        }
        public ActionResult CreateDistrictDetails()
        {
            return View();
        }

        public ActionResult GetState(int stateId)
        {
            try
            {
                List<State> result = new List<State>();

                result = unitOfWork.Repository<State>().GetMany(x => x.Id == stateId).ToList();

                return Json(result, JsonRequestBehavior.AllowGet);
            }
            catch (Exception exception)
            {
                System.Diagnostics.Debug.WriteLine(exception);
                return null;
            }
        }




    }
}