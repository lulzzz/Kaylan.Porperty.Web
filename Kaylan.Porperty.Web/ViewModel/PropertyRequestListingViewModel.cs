using System;

namespace Kaylan.Porperty.Web.ViewModel
{
    public class PropertyRequestListingViewModel
    {
        public int PropertyRequestId { get; set; }

        public string FullName { get; set; }

        public string Email { get; set; }

        public string PhoneNumber { get; set; }

        public string FromPrice { get; set; }

        public string ToPrice { get; set; }

        public string ContactType { get; set; }

        public string PropertyRequestContractType { get; set; }

        public string PropertyDescription { get; set; }

        public string PropertyRequestArea { get; set; }

        public DateTime CreatedDate { get; set; }

        public bool IsAgree { get; set; }

        public int PropertyRequestType { get; set; }
    }
}