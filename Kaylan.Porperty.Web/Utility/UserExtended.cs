using System.Security.Claims;
using System.Security.Principal;

namespace Kaylan.Porperty.Web.Utility
{
    public static class UserExtended
    {
        public static string GetFirstName(this IIdentity identity)
        {
            ClaimsIdentity claimsIdentity = identity as ClaimsIdentity;
            Claim claim = claimsIdentity?.FindFirst(c => c.Type == "FirstName");

            return claim.Value ?? "";
        }

        public static string GetLastName(this IIdentity identity)
        {
            ClaimsIdentity claimsIdentity = identity as ClaimsIdentity;
            Claim claim = claimsIdentity?.FindFirst(c => c.Type == "LastName");

            return claim.Value ?? "";
        }

        public static string GetPhone(this IIdentity identity)
        {
            ClaimsIdentity claimsIdentity = identity as ClaimsIdentity;
            Claim claim = claimsIdentity?.FindFirst(c => c.Type == "Phone");

            return claim.Value ?? "";
        }

        public static string GetEmail(this IIdentity identity)
        {
            ClaimsIdentity claimsIdentity = identity as ClaimsIdentity;
            Claim claim = claimsIdentity?.FindFirst(c => c.Type == "Email");

            return claim.Value ?? "";
        }

        public static string GetUserName(this IIdentity identity)
        {
            ClaimsIdentity claimsIdentity = identity as ClaimsIdentity;
            Claim claim = claimsIdentity?.FindFirst(c => c.Type == "UserName");

            return claim.Value ?? "";
        }

        public static string GetDateOfBirth(this IIdentity identity)
        {
            ClaimsIdentity claimsIdentity = identity as ClaimsIdentity;
            Claim claim = claimsIdentity?.FindFirst(c => c.Type == "DateOfBirth");

            return claim.Value ?? "";
        }
    }
}