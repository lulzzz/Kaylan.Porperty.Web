namespace Kalyan.Property.Infrastructure.Models
{
    using System.ComponentModel.DataAnnotations;

    public partial class PropertyType
    {
        public int Id { get; set; }

        [Required]
        [StringLength(50)]
        public string Name { get; set; }

        public bool IsActive { get; set; }
    }
}