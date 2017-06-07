namespace Kalyan.Property.Infrastructure.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("PropertyImage")]
    public partial class PropertyImage
    {
        public int Id { get; set; }

        [StringLength(500)]
        public string ImagePath { get; set; }

        public bool IsActive { get; set; }

        public int PropertyDetailId { get; set; }

        public virtual PropertyDetail PropertyDetail { get; set; }
    }
}
