namespace Kalyan.Property.Infrastructure.Models
{
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    [Table("Amenity")]
    public partial class Amenity
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Amenity()
        {
            PropertyAmenityMapping = new HashSet<PropertyAmenityMapping>();
        }

        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int Id { get; set; }

        [Required]
        [StringLength(50)]
        public string Name { get; set; }

        public bool IsActive { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PropertyAmenityMapping> PropertyAmenityMapping { get; set; }
    }

    [Table("PropertyAmenityMapping")]
    public partial class PropertyAmenityMapping
    {
        public int AmenityId { get; set; }

        public int PropertyDetailId { get; set; }

        public int Id { get; set; }

        public virtual Amenity Amenity { get; set; }

        public virtual PropertyDetail PropertyDetail { get; set; }
    }
}