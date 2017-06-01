using Kalyan.Property.Infrastructure.Models;
using PagedList;

namespace Kaylan.Porperty.Web.ViewModel
{
    public class CityViewModel
    {
        
        public IPagedList<City> CityList { get;  set; }

        public string CityName { get;  set; }

        public int CountryId { get;  set; }

        public int StateId { get;  set; }
    }


    //public class AreaViewModelzzzz
    //{
    //    public IPagedList<Area> AreaList { get; internal set; }zzzz

    //    public string AreaName { get; internal set; }zzzz

    //    public int CountryId { get; internal set; }zz

    //    public int CityId { get; internal set; }

    //    public int StateId { get; internal set; }
    //}
}