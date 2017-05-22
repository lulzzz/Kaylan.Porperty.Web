namespace Kalyan.Property.Infrastructure.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class PropertyRequest
    {
        [Key]
        public int PropRequestId { get; set; }

        [StringLength(50)]
        public string FullName { get; set; }

        [StringLength(50)]
        public string Email { get; set; }

        [StringLength(50)]
        public string PhoneNumber { get; set; }

        [StringLength(50)]
        public string ContractType { get; set; }

        [StringLength(50)]
        public string FromPrice { get; set; }

        public DateTime? Date { get; set; }

        [StringLength(50)]
        public string AreaName { get; set; }

        [StringLength(50)]
        public string Contact { get; set; }

        [StringLength(50)]
        public string PropertyTypees { get; set; }

        [StringLength(50)]
        public string PropertyDescription { get; set; }

        [StringLength(50)]
        public string ToPrice { get; set; }

        [StringLength(50)]
        public string AreaId { get; set; }

        [StringLength(50)]
        public string CityId { get; set; }

        public int? CountryId { get; set; }

        [StringLength(50)]
        public string ContractId { get; set; }

        [StringLength(50)]
        public string ContactBy { get; set; }
    }
}
