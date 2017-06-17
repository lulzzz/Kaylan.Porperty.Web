using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Kaylan.Porperty.Web.ViewModel
{
    public class Approvepropertydetails
    {

        public int Id { get; set; }

       
        public string ContractType { get; set; }

       
        public string FromPrice { get; set; }

        
        public string Bedroom { get; set; }

        
        public string Bathroom { get; set; }

       
        public string Parking { get; set; }

        public DateTime Date { get; set; }

        
        public string PropertyName { get; set; }

       
        public string Address { get; set; }

       
        public string PropertyDescription { get; set; }

       
        public string FullName { get; set; }

       
        public string Email { get; set; }

        
        public string Phone { get; set; }

        
        public string Comments { get; set; }

        public bool Approved { get; set; }

        public bool? IsActive { get; set; }

        public int AreaId { get; set; }

        public int CountryId { get; set; }

        public int StateId { get; set; }

        public int CityId { get; set; }

       
        public string ToPrice { get; set; }

        public int UserId { get; set; }

        public int PropertyAmenityMappingId { get; set; }

        public string FirstName { get; set; }



        public string PorpertyImageUrl1 { get; set; }
        public string PorpertyImageUrl2 { get; set; }
        public string PorpertyImageUrl3 { get; set; }

        public string Description { get; set; }


        public int AmenityId { get; set; }

        public int PropertyDetailId { get; set; }

        

    }
}