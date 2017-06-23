
namespace Kalyan.Property.Infrastructure.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Userenquiery")]
    public partial class Userenquiery
    {
       // public int userid;

        public int Userenquieryid { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        public string MobileNumber { get; set; }
        public int PropertyDetailId { get; set; }

        public DateTime Date { get; set; }
        public virtual PropertyDetail PropertyDetail { get; set; }
    }
}
