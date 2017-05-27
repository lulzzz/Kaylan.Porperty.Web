namespace Kalyan.Property.Infrastructure.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;

    public partial class PropertyRequest
    {
        [Key]
        public int PropertyRequestId { get; set; }

        [StringLength(50)]
        public string FullName { get; set; }

        [StringLength(50)]
        public string Email { get; set; }

        [StringLength(50)]
        public string PhoneNumber { get; set; }

        [StringLength(50)]
        public string ContractType { get; set; }

        public int FromPrice { get; set; }

        [StringLength(50)]
        public string ContactType { get; set; }

        public int PropertyRequestTypeId { get; set; }

        [StringLength(50)]
        public string PropertyDescription { get; set; }

        public int ToPrice { get; set; }

        public DateTime CreatedDate { get; set; }

        public virtual PropertyRequestPrice PropertyRequestPriceMin { get; set; }

        public virtual PropertyRequestPrice PropertyRequestPriceMax { get; set; }

        public virtual PropertyRequestType PropertyRequestType { get; set; }
    }

    public partial class PropertyRequestType
    {
        public PropertyRequestType()
        {
            PropertyRequests = new HashSet<PropertyRequest>();
        }

        public int Id { get; set; }

        [StringLength(50)]
        public string Name { get; set; }

        public bool IsActive { get; set; }

        public virtual ICollection<PropertyRequest> PropertyRequests { get; set; }
    }

    public partial class PropertyRequestPrice
    {
        public PropertyRequestPrice()
        {
            PropertyRequests = new HashSet<PropertyRequest>();
            PropertyRequests1 = new HashSet<PropertyRequest>();
        }

        public int Id { get; set; }

        [StringLength(50)]
        public string Price { get; set; }

        public bool IsActive { get; set; }

        public virtual ICollection<PropertyRequest> PropertyRequests { get; set; }

        public virtual ICollection<PropertyRequest> PropertyRequests1 { get; set; }
    }
}