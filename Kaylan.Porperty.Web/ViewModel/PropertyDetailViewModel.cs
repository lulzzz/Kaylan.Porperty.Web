using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Web;
using System.Web.Mvc;

namespace Kaylan.Porperty.Web.ViewModel
{
    public class PropertyDetailViewModel
    {
        public PropertyDetailViewModel()
        {
        }

        public PropertyDetailViewModel(
            IEnumerable<SelectListItem> CountryList,
            IEnumerable<SelectListItem> StateList,
            IEnumerable<SelectListItem> CityList,
            IEnumerable<SelectListItem> AreaList,
            IEnumerable<SelectListItem> ContractTypeList,
            IEnumerable<SelectListItem> PropertyTypeList,
            IEnumerable<SelectListItem> Amenity

            )
        {
            List<SelectListItem> Bed = new List<SelectListItem>()
            {
              new SelectListItem {Text="1",Value="1" },
              new SelectListItem {Text="2",Value="2" },
              new SelectListItem {Text="3",Value="3"},
              new SelectListItem {Text="4",Value="4"},
              new SelectListItem {Text="+5",Value="+5" },
            };

            List<SelectListItem> Bath = new List<SelectListItem>()
            {
              new SelectListItem {Text="1",Value="1" },
              new SelectListItem {Text="2",Value="2" },
              new SelectListItem {Text="3",Value="3"},
              new SelectListItem {Text="4",Value="4"},
              new SelectListItem {Text="+5",Value="+5" },
            };

            this.CountryList = new SelectList(CountryList, "Value", "Text");
            this.StateList = new SelectList(StateList, "Value", "Text");
            this.CityList = new SelectList(CityList, "Value", "Text");
            this.AreaList = new SelectList(AreaList, "Value", "Text");
            this.ContractList = new SelectList(ContractTypeList, "Value", "Text");
            this.PropertyTypeList = new SelectList(PropertyTypeList, "Value", "Text");
            this.BedList = new SelectList(Bed, "Value", "Text");
            this.BathList = new SelectList(Bath, "Value", "Text");
            this.Amenity = new List<SelectListItem>(Amenity);
        }

        [Required(ErrorMessage = "Property Type Required.")]
        public int SelectedPropertyTypeId { get; set; }

        public SelectList PropertyTypeList { get; set; }

        [Required(ErrorMessage = "Country Required.")]
        public int SelectedCountryId { get; set; }

        public SelectList CountryList { get; set; }

        [Required(ErrorMessage = "City Required.")]
        public int SelectedCityId { get; set; }

        public SelectList CityList { get; set; }

        [Required(ErrorMessage = "State Required.")]
        public int SelectedStateId { get; set; }

        public SelectList StateList { get; set; }

        [Required(ErrorMessage = "Area Required.")]
        public int SelectedAreaId { get; set; }

        public SelectList AreaList { get; set; }

        [Required(ErrorMessage = "Contract Required.")]
        public int SelectedContractId { get; set; }

        public SelectList ContractList { get; set; }

        [Required(ErrorMessage = "Beds Required.")]
        public int SelectedBedtId { get; set; }

        public SelectList BedList { get; set; }

        [Required(ErrorMessage = "Baths Required.")]
        public int SelectedBathtId { get; set; }

        public SelectList BathList { get; set; }

        [Required(ErrorMessage = "Property Name Required.")]
        public string PropertyName { get; set; }

        [Required(ErrorMessage = "Property Description Required.")]
        public string PropertyDescription { get; set; }

        [Required(ErrorMessage = "FullName Required.")]
        public string FullName { get; set; }

        [Required(ErrorMessage = "Phone Required.")]
        public string Phone { get; set; }

        [Required(ErrorMessage = "Email Required.")]
        public string Email { get; set; }

        [Required(ErrorMessage = "Comments Required.")]
        public string Comments { get; set; }

        [Required]
        [DataType(DataType.Upload)]
        [Display(Name = "Choose File")]
        public HttpPostedFileBase ImageUploadOne { get; set; }

        [Required]
        [DataType(DataType.Upload)]
        [Display(Name = "Choose File")]
        public HttpPostedFileBase ImageUploadTwo { get; set; }

        [Required]
        [DataType(DataType.Upload)]
        [Display(Name = "Choose File")]
        public HttpPostedFileBase ImageUploadThree { get; set; }

        public List<SelectListItem> Amenity { set; get; }
    }
}