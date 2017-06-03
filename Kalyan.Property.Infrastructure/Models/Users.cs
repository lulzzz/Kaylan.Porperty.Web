using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using System;
using System.Security.Claims;
using System.Threading.Tasks;

namespace Kalyan.Property.Infrastructure.Models
{
    public class Users : IdentityUser<int, UserLogin, UserRole, UserClaim>
    {
        public string FirstName { get; set; }

        public string LastName { get; set; }

        public string Phone { get; set; }

        public string Gender { get; set; }

        public DateTime DateOfBirth { get; set; }

        public async Task<ClaimsIdentity> GenerateUserIdentityAsync(UserManager<Users, int> manager)
        {
            // Note the authenticationType must match the one defined in CookieAuthenticationOptions.AuthenticationType
            var userIdentity = await manager.CreateIdentityAsync(this, DefaultAuthenticationTypes.ApplicationCookie);
            // Add custom user claims here
            if (this.FirstName != null)
                userIdentity.AddClaim(new Claim("FirstName", FirstName));
            if (this.LastName != null)
                userIdentity.AddClaim(new Claim("LastName", LastName));
            return userIdentity;
        }
    }
}