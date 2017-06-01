using Kalyan.Property.Infrastructure.Models;
using PagedList;

namespace Kaylan.Porperty.Web.ViewModel
{
    public class CityViewModel
    {
        //public IPagedList<City> CityList { get; internal set; }

        //public string CityName { get; internal set; }

        //public int CountryId { get; internal set; }

        //public int StateId { get; internal set; }
        public IPagedList<City> CityList { get;  set; }

        public string CityName { get;  set; }

        public int CountryId { get;  set; }

        public int StateId { get;  set; }
    }


    //public class AreaViewModel
    //{
    //    public IPagedList<Area> AreaList { get; internal set; }

    //    public string AreaName { get; internal set; }

    //    public int CountryId { get; internal set; }

    //    public int CityId { get; internal set; }

    //    public int StateId { get; internal set; }
    //}
}