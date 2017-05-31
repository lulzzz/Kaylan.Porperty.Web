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
                    return "State Already Exists";
                }
            }

            return "Please try after some time";
        }

        // GET: Utility
        public ActionResult CreateCity(int? page)
        {
            CityViewModel vm = new CityViewModel();

            var result = from country in iUnitOfWork.Repository<Country>().GetAll()
                         join state in iUnitOfWork.Repository<State>().GetAll()
                         on country.Id equals state.CountryId

                         join city in iUnitOfWork.Repository<City>().GetAll()
                         on state.Id equals city.StateId

                         select new City
                         {
                             Id = city.Id,
                             Name = city.Name,
                             IsActive = city.IsActive,
                             State = new State()
                             {
                                 Name = state.Name,
                                 Country = state.Country
                             }
                         };

            vm.CityList = result.ToPagedList(page ?? 1, pageSize);

            return Request.IsAjaxRequest()
                ? (ActionResult)PartialView("_CityList", vm.CityList)
                : View(vm);
        }

        // POST: Utility
        [HttpPost]
        public string CreateCity(CityViewModel cityViewModel)
        {
            if (ModelState.IsValid)
            {
                var result = iUnitOfWork.Repository<City>().GetMany(x => x.Name == cityViewModel.CityName).Any();

                if (!result)
                {
                    try
                    {
                        City city = new City();
                        city.Name = cityViewModel.CityName;
                        city.IsActive = true;
                        city.StateId = cityViewModel.StateId;

                        iUnitOfWork.Repository<City>().Add(city);
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
                    return "City Already Exists";
                }
            }
            return "Please try after some time !";
        }

        // GET: Utility
        public ActionResult CreateArea(int? page)
        {
            AreaViewModel vm = new AreaViewModel();

            var result = from country in iUnitOfWork.Repository<Country>().GetAll()
                         join state in iUnitOfWork.Repository<State>().GetAll()
                         on country.Id equals state.CountryId

                         join city in iUnitOfWork.Repository<City>().GetAll()
                         on state.Id equals city.StateId
                         join area in iUnitOfWork.Repository<Area>().GetAll()
                         on city.Id equals area.CityId
                         select new Area
                         {
                             Id = city.Id,
                             Name = city.Name,
                             IsActive = city.IsActive,
                             City = new City()
                             {
                                 Name = city.Name,
                                 State = new State()
                                 {
                                     Name = state.Name,
                                     Country = new Country()
                                     {
                                         Name = country.Name
                                     }
                                 }
                             }
                         };

            vm.AreaList = result.ToPagedList(page ?? 1, pageSize);

            return Request.IsAjaxRequest()
                ? (ActionResult)PartialView("_AreaList", vm.AreaList)
                : View(vm);
        }

        // POST: Utility
        [HttpPost]
        public string CreateArea(AreaViewModel areaViewModel)
        {
            if (ModelState.IsValid)
            {
                var result = iUnitOfWork.Repository<Area>().GetMany(x => x.Name == areaViewModel.AreaName).Any();

                if (!result)
                {
                    try
                    {
                        Area area = new Area();
                        area.Name = areaViewModel.AreaName;
                        area.IsActive = true;
                        area.CityId = areaViewModel.CityId;

                        iUnitOfWork.Repository<Area>().Add(area);
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
                    return "Area Already Exists";
                }
            }

            return "Please try after some time";
        }

        [HttpGet]
        public ActionResult GetCountryList()
        {
            var result = iUnitOfWork.Repository<Country>()
                .GetAll()
                .Select(x => new Country { Name = x.Name, Id = x.Id })
                  .ToList();

            return Json(result, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public ActionResult GetStateList()
        {
            var result = iUnitOfWork.Repository<State>()
                .GetAll()
                .Select(x => new State { Name = x.Name, Id = x.Id })
                  .ToList();

            return Json(result, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public ActionResult GetCityList()
        {
            var result = iUnitOfWork.Repository<City>()
                .GetAll()
                .Select(x => new City { Name = x.Name, Id = x.Id })
                  .ToList();

            return Json(result, JsonRequestBehavior.AllowGet);
        }
    }
}