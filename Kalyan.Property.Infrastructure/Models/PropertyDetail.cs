namespace Kalyan.Property.Infrastructure.Models
{
    //    using System;
    //    using System.Collections.Generic;
    //    using System.ComponentModel.DataAnnotations;
    //    using System.ComponentModel.DataAnnotations.Schema;
    //    using System.Data.Entity.Spatial;

    //    public partial class PropertyDetail
    //    {
    //        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
    //        public PropertyDetail()
    //        {
    //            AgentInfoes = new HashSet<AgentInfo>();
    //            PropertyImages = new HashSet<PropertyImage>();
    //        }

    //        [StringLength(50)]
    //        public string ContractType { get; set; }

    //        [StringLength(50)]
    //        public string FromPrice { get; set; }

    //        public int? Bedroom { get; set; }

    //        public int? Bathroom { get; set; }

    //        public int? Parking { get; set; }

    //        public int? AmenitiesID { get; set; }

    //        public int Id { get; set; }

    //        public DateTime? Date { get; set; }

    //        [StringLength(50)]
    //        public string PropertyName { get; set; }

    //        [StringLength(50)]
    //        public string Address { get; set; }

    //        [StringLength(50)]
    //        public string PropertyDescription { get; set; }

    //        [StringLength(50)]
    //        public string FullName { get; set; }

    //        [StringLength(50)]
    //        public string Email { get; set; }

    //        [StringLength(50)]
    //        public string Phone { get; set; }

    //        [StringLength(50)]
    //        public string Comments { get; set; }

    //        [StringLength(50)]
    //        public string Images { get; set; }

    //        [StringLength(1)]
    //        public string Approved { get; set; }

    //        [StringLength(1)]
    //        public string Featured { get; set; }

    //        [StringLength(50)]
    //        public string Area { get; set; }

    //        [StringLength(10)]
    //        public string country { get; set; }

    //        [StringLength(50)]
    //        public string State { get; set; }

    //        public bool agent { get; set; }

    //        [StringLength(10)]
    //        public string city { get; set; }

    //        [StringLength(10)]
    //        public string DistrictId { get; set; }

    //        [StringLength(50)]
    //        public string ToPrice { get; set; }

    //        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
    //        public virtual ICollection<AgentInfo> AgentInfoes { get; set; }

    //        public virtual Amenity Amenity { get; set; }

    //        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
    //        public virtual ICollection<PropertyImage> PropertyImages { get; set; }
    //    }
    //}

    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    [Table("PropertyDetail")]
    public partial class PropertyDetail
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public PropertyDetail()
        {
            PropertyAmenityMappings = new HashSet<PropertyAmenityMapping>();
            PropertyImages = new HashSet<PropertyImage>();
        }

        public int Id { get; set; }

        [StringLength(50)]
        public string ContractType { get; set; }

        [StringLength(50)]
        public string FromPrice { get; set; }

        [StringLength(50)]
        public string Bedroom { get; set; }

        [StringLength(50)]
        public string Bathroom { get; set; }

        [StringLength(50)]
        public string Parking { get; set; }

        public DateTime Date { get; set; }

        [StringLength(50)]
        public string PropertyName { get; set; }

        [StringLength(50)]
        public string Address { get; set; }

        [StringLength(50)]
        public string PropertyDescription { get; set; }

        [StringLength(50)]
        public string FullName { get; set; }

        [StringLength(50)]
        public string Email { get; set; }

        [StringLength(50)]
        public string Phone { get; set; }

        [StringLength(50)]
        public string Comments { get; set; }

        public bool Approved { get; set; }

        public bool? IsActive { get; set; }

        public int AreaId { get; set; }

        public int CountryId { get; set; }

        public int StateId { get; set; }

        public int CityId { get; set; }

        [StringLength(50)]
        public string ToPrice { get; set; }

        public int UserId { get; set; }

        public int PropertyAmenityMappingId { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PropertyAmenityMapping> PropertyAmenityMappings { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PropertyImage> PropertyImages { get; set; }
        public virtual State Name { get; set; }

    }
}