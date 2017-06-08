﻿using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Web;
using System.Web.Mvc;

namespace Kaylan.Porperty.Web.ViewModel
{
    public class PropertyDetailViewModel
    {
        public PropertyDetailViewModel()
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
            this.BedList = new SelectList(Bed, "Value", "Text");
            this.BathList = new SelectList(Bath, "Value", "Text");
        }

        //public PropertyDetailViewModel(
            

        //    )
        //{
           

        //    this.CountryList = new SelectList(CountryList, "Value", "Text");
        //    this.StateList = new SelectList(StateList, "Value", "Text");
        //    this.CityList = new SelectList(CityList, "Value", "Text");
        //    this.AreaList = new SelectList(AreaList, "Value", "Text");
        //    this.ContractList = new SelectList(ContractTypeList, "Value", "Text");
        //    this.PropertyTypeList = new SelectList(PropertyTypeList, "Value", "Text");
          
        //    this.Amenity = new List<SelectListItem>(Amenity);
        //}

        [Required(ErrorMessage = "Property Type Required.")]
        public int SelectedPropertyTypeId { get; set; }

        public IEnumerable<SelectListItem> PropertyTypeList { get; set; }

        [Required(ErrorMessage = "Country Required.")]
        public int SelectedCountryId { get; set; }

        public IEnumerable<SelectListItem> CountryList { get; set; }

        [Required(ErrorMessage = "City Required.")]
        public int SelectedCityId { get; set; }

        public IEnumerable<SelectListItem> CityList { get; set; }

        [Required(ErrorMessage = "State Required.")]
        public int SelectedStateId { get; set; }

        public IEnumerable<SelectListItem> StateList { get; set; }

        [Required(ErrorMessage = "Area Required.")]
        public int SelectedAreaId { get; set; }

        public IEnumerable<SelectListItem> AreaList { get; set; }

        [Required(ErrorMessage = "Contract Required.")]
        public int SelectedContractId { get; set; }

        public IEnumerable<SelectListItem> ContractList { get; set; }

        [Required(ErrorMessage = "Beds Required.")]
        public string SelectedBedtId { get; set; }

        public IEnumerable<SelectListItem> BedList { get; set; }

        [Required(ErrorMessage = "Baths Required.")]
        public string SelectedBathtId { get; set; }

        public IEnumerable<SelectListItem> BathList { get; set; }

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