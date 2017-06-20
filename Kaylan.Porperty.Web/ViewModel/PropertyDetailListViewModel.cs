using Kalyan.Property.Infrastructure.Models;
using PagedList;

namespace Kaylan.Porperty.Web.ViewModel
{
    public class PropertyDetailListViewModel
    {
        public int Id { get; set; }

        public string PorpertyImageUrl { get; set; }

        public string ContractType { get; set; }

        public string AreaName { get; set; }

        public string PropertyName { get; set; }

        public string Price { get; set; }

        public string Bedroom { get; set; }

        public string Bathroom { get; set; }

        public string Parking { get; set; }

        public bool Approved { get; set; }
        public IPagedList<PropertyDetail> PropertydetailsList { get; set; }
    }
}