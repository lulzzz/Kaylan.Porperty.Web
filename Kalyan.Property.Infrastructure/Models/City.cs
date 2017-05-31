namespace Kalyan.Property.Infrastructure.Models
{
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;

    public partial class City
    {
        public City()
        {
            Area = new HashSet<Area>();
        }

        public int Id { get; set; }

        [Required]
        [StringLength(50)]
        public string Name { get; set; }

        public bool IsActive { get; set; }

        public int StateId { get; set; }

        public virtual ICollection<Area> Area { get; set; }

        public virtual State State { get; set; }
    }
}