namespace Kalyan.Property.Infrastructure.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class PropertyImage
    {
        public int Id { get; set; }

        public int PropertyTypeId { get; set; }

        public int PropertyDetailId { get; set; }

        [Column("PropertyImage")]
        [Required]
        public byte[] PropertyImage1 { get; set; }

        public DateTime Date { get; set; }

        [StringLength(50)]
        public string ImagePath { get; set; }

        public bool IsActive { get; set; }

        public virtual PropertyDetail PropertyDetail { get; set; }

        public virtual PropertyType PropertyType { get; set; }
    }
}
