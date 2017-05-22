using Microsoft.AspNet.Identity.EntityFramework;

namespace Kalyan.Property.Infrastructure.Models
{

    public class Roles : IdentityRole<int, UserRole>
    {
        public Roles()
        {
        }

        public Roles(string name)
        {
            Name = name;
        }
    }
}