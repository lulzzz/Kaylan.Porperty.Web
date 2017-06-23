using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Kaylan.Porperty.Web.ViewModel
{
    public class UserenqueryViewModel
    {

        public int userid;

        public int Userenquieryid { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        public string MobileNumber { get; set; }
        public int PropertyDetailId { get; set; }

        public int UserId { get; set; }

        public DateTime Date { get; set; }

        public string FromPrice { get; set; }

        public string ToPrice { get; set; }

        public string PropertyName { get; set; }
        public string Address { get; set; }
        public int AreaId { get; set; }
    }
}