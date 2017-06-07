using Kalyan.Property.Infrastructure;
using Kalyan.Property.Infrastructure.Models;
using Kaylan.Porperty.Web.ViewModel;
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



        public ActionResult PropertyRequestDetails(int PropertyRequestId)
        {
            PropertyRequest details = unitOfWork.Repository<PropertyRequest>().GetById(PropertyRequestId);

            if (details == null)
               Response.Write("<script>alert(' Property Request details not found')</script>");
            return View(details);
   
            
        }






    }
}