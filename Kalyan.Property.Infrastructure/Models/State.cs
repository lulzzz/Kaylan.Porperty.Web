namespace Kalyan.Property.Infrastructure.Models
{
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;

    public partial class State
    {
        public State()
        {
            City = new HashSet<City>();
        }

        public int Id { get; set; }

        [StringLength(50)]
        public string Name { get; set; }

        public bool IsActive { get; set; }

        public int CountryId { get; set; }

        public virtual ICollection<City> City { get; set; }

        public virtual Country Country { get; set; }
    }
}