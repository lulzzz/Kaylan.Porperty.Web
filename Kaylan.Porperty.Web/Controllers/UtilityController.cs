using Kalyan.Property.Infrastructure;
using Kalyan.Property.Infrastructure.Models;
using Kaylan.Porperty.Web.ViewModel;
using PagedList;
using System;
using System.Linq;
using System.Web.Mvc;

namespace Kaylan.Porperty.Web.Controllers
{
    public class UtilityController : Controller
    {
        public int pageSize = 5;
        private IUnitOfWork iUnitOfWork;

        public UtilityController()
        {
            iUnitOfWork = new UnitOfWork();
        }

        // GET: Utility
        public ActionResult CreateCountry(int? page)
        {
            var result = iUnitOfWork.Repository<Country>().GetAll().Select(x => new Country() { Name = x.Name, Id = x.Id, IsActive = x.IsActive }).ToList();

            PagedList.IPagedList<Country> countryResult = new PagedList.PagedList<Country>(result, page ?? 1, pageSize);

            return View(countryResult);
        }

        // POST: Utility
        [HttpPost]
        public string CreateCountry(string countryName)
        {
            var result = iUnitOfWork.Repository<Country>().GetMany(x => x.Name == countryName).Any();

            if (!result)
            {
                try
                {
                    Country country = new Country();
                    country.Name = countryName;
                    country.IsActive = true;

                    iUnitOfWork.Repository<Country>().Add(country);
                    bool save = iUnitOfWork.Commit();
                    return "Added Successfully";
                }
                catch (Exception exception)
                {
                    System.Diagnostics.Debug.WriteLine(exception);
                    return "Some internal Error Occure";
                }
            }
            else
            {
                return "Country Already Exists";
            }
        }

        // GET: Utility
        public ActionResult CreateState(int? page)
        {
            StateViewModel vm = new StateViewModel();

            var result = from s in iUnitOfWork.Repository<State>().GetAll()
                         join c in iUnitOfWork.Repository<Country>().GetAll()
                         on s.CountryId equals c.Id
                         select new State { Id = s.Id, Name = s.Name, Country = c };
            vm.StateList = result.ToPagedList(page ?? 1, pageSize);

            return Request.IsAjaxRequest()
                ? (ActionResult)PartialView("_StateList", vm.StateList)
                : View(vm);
        }

        // POST: Utility
        [HttpPost]
        public string CreateState(StateViewModel stateViewModel)
        {
            if (ModelState.IsValid)
            {
                var result = iUnitOfWork.Repository<State>().GetMany(x => x.Name == stateViewModel.StateName).Any();

                if (!result)
                {
                    try
                    {
                        State state = new State();
                        state.Name = stateViewModel.StateName;
                        state.IsActive = true;
                        state.CountryId = stateViewModel.CountryId;

                        iUnitOfWork.Repository<State>().Add(state);
                        bool save = iUnitOfWork.Commit();
                        return "Added Successfully";
                    }
                    catch (Exception exception)
                    {
                        System.Diagnostics.Debug.WriteLine(exception);
                        return "Some internal Error Occure";
                    }
                }
                else
                {
                    return "Country Already Exists";
                }
            }

            return "Please try after some time";
        }

        public ActionResult StateList(int page = 1)
        {
            var result = iUnitOfWork.Repository<Country>().GetAll().Select(x => new State() { Name = x.Name, Id = x.Id, IsActive = x.IsActive }).ToList();

            PagedList.IPagedList<State> stateResult = new PagedList.PagedList<State>(result, page, pageSize);

            return Request.IsAjaxRequest()
               ? (ActionResult)PartialView("_StateList", stateResult)
               : View();
        }

        [HttpGet]
        public ActionResult GetCountryList()
        {
            var result = iUnitOfWork.Repository<Country>().GetAll().Select(x => new Country { Name = x.Name, Id = x.Id })
                  .ToList();

            return Json(result, JsonRequestBehavior.AllowGet);
        }
    }
}