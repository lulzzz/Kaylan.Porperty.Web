using Kalyan.Property.Infrastructure.Models;
using PagedList;

namespace Kaylan.Porperty.Web.ViewModel
{
    public class CityViewModel
    {
        public IPagedList<City> CityList { get; internal set; }
        public string DistrictName { get; internal set; }
        public int CountryId { get; internal set; }
        public int StateId { get; internal set; }
    }
}