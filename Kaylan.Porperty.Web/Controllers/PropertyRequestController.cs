using Kalyan.Property.Infrastructure;
using Kalyan.Property.Infrastructure.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web.Mvc;
using System.Web.UI;

namespace Kaylan.Porperty.Web.Controllers
{
    public class PropertyRequestController : Controller
    {
        private IUnitOfWork unitOfWork;

        public PropertyRequestController()
        {
            unitOfWork = new UnitOfWork();
        }

        // GET: PropertyRequest

        public ActionResult CreatePropertyRequest()
        {
            //  sir i try this but not wotking -rupesh
            //ViewBag.ContactTypes = unitOfWork.Repository<ContractType>.ToList();
            //ViewBag.PropertyTypes = unitOfWork.Repository<PropertyType>.ToList();
            //ViewBag.Area = unitOfWork.Repository<Area>.ToList();

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
    }
}