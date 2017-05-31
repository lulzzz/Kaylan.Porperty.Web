namespace Kalyan.Property.Infrastructure.Models
{
    using System.ComponentModel.DataAnnotations;

    public partial class Area
    {
        public int Id { get; set; }

        [Required]
        [StringLength(50)]
        public string Name { get; set; }

        public bool IsActive { get; set; }

        public int CityId { get; set; }

        public virtual City City { get; set; }
    }
}