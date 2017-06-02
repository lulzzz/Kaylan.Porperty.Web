using Kalyan.Property.Infrastructure.Models;
using PagedList;

namespace Kaylan.Porperty.Web.ViewModel
{
    public class StateViewModel
    {
        public int CountryId { get; set; }
        public string StateName { get; set; }
        public IPagedList<State> StateList { get; set; }
    }
}
