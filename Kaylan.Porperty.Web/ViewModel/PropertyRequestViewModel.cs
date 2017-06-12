﻿using Kalyan.Property.Infrastructure.Models;
using System;
using System.Collections.Generic;
using System.Web.Mvc;

namespace Kaylan.Porperty.Web.ViewModel
{
    public class PropertyRequestViewModel
    {
        public PropertyRequestViewModel()
        {
            ContactTypeList = new List<string>() { "Email", "Phone" };
        }

        public int PropertyRequestId { get; set; }

        public string FullName { get; set; }

        public string Email { get; set; }

        public string PhoneNumber { get; set; }

        public List<string> ContactTypeList { get; set; }

        public int FromPrice { get; set; }

        public string ContactType { get; set; }

        public int PropertyRequestContractTypeId { get; set; }

        public string PropertyDescription { get; set; }

        public int ToPrice { get; set; }

        public DateTime CreatedDate { get; set; }

        public bool IsAgree { get; set; }

        public int PropertyRequestTypeId { get; set; }

        public int PropertyRequestAreaId { get; set; }
       public IEnumerable<SelectListItem> AreaList { get; set; }
        public SelectList PropertyRequestArea { get; internal set; }

        public PropertyRequest GetPropertyRequest()
        {
            return new PropertyRequest()
            {
                PropertyRequestId = this.PropertyRequestId,
                FullName = this.FullName,
                Email = this.Email,
                PhoneNumber = this.PhoneNumber,
                FromPrice = this.FromPrice,
                ContactType = this.ContactType,
                PropertyRequestContractTypeId = this.PropertyRequestContractTypeId,
                PropertyDescription = this.PropertyDescription,
                ToPrice = this.ToPrice,
                CreatedDate = DateTime.Now,
                IsAgree = this.IsAgree,
                PropertyRequestTypeId = this.PropertyRequestTypeId,
                PropertyRequestAreaId = this.PropertyRequestAreaId
            };
        }

        
    }
}