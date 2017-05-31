namespace Kalyan.Property.Infrastructure.Models
{
    using System.Collections.Generic;

    public partial class Country
    {
        public Country()
        {
            State = new HashSet<State>();
        }

        public int Id { get; set; }

        public string Name { get; set; }

        public bool IsActive { get; set; }

        public virtual ICollection<State> State { get; set; }
    }
}