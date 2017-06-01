using Kalyan.Property.Infrastructure.Models;
using PagedList;

namespace Kaylan.Porperty.Web.ViewModel
{
    public class AreaViewModel
    {
        public IPagedList<Area> AreaList { get;  set; }

        public string AreaName { get;  set; }

        public int CountryId { get;  set; }

        public int CityId { get;  set; }

        public int StateId { get;  set; }
    }
}