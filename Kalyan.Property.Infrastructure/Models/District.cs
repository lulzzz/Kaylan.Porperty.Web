namespace Kalyan.Property.Infrastructure.Models
{
    using System.ComponentModel.DataAnnotations;

    public class District
    {
        public int Id { get; set; }

        [StringLength(50)]
        public string Name { get; set; }

        public bool IsActive { get; set; }

        public int CityId { get; set; }
    }
}