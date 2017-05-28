using Kalyan.Property.Infrastructure.Models;
using System;
using System.Collections.Generic;

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

        public string ContractType { get; set; }

        public List<string> ContactTypeList { get; set; }

        public int FromPrice { get; set; }

        public string ContactType { get; set; }

        public int PropertyRequestTypeId { get; set; }

        public string PropertyDescription { get; set; }

        public int ToPrice { get; set; }

        public DateTime CreatedDate { get; set; }

        public bool IsAgree { get; set; }

        public PropertyRequest GetPropertyRequest()
        {
            return new PropertyRequest()
            {
                PropertyRequestId = this.PropertyRequestId,
                FullName = this.FullName,
                Email = this.Email,
                ContractType = this.ContractType,
                PhoneNumber = this.PhoneNumber,
                FromPrice = this.FromPrice,
                ContactType = this.ContactType,
                PropertyRequestTypeId = this.PropertyRequestTypeId,
                PropertyDescription = this.PropertyDescription,
                ToPrice = this.ToPrice,
                CreatedDate = DateTime.Now,
                IsAgree = this.IsAgree
            };
        }
    }
}