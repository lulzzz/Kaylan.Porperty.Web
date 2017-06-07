//namespace Kalyan.Property.Infrastructure.Models
//{
//    using System;
//    using System.Collections.Generic;
//    using System.ComponentModel.DataAnnotations;
//    using System.ComponentModel.DataAnnotations.Schema;
//    using System.Data.Entity.Spatial;

//    [Table("AgentInfo")]
//    public partial class AgentInfo
//    {
//        [DatabaseGenerated(DatabaseGeneratedOption.None)]
//        public int id { get; set; }

//        public int PropertyDetailId { get; set; }

//        [StringLength(50)]
//        public string FirstName { get; set; }

//        [StringLength(50)]
//        public string LastName { get; set; }

//        [StringLength(10)]
//        public string Phone { get; set; }

//        public bool? IsActive { get; set; }

//        [StringLength(50)]
//        public string Address1 { get; set; }

//        [StringLength(50)]
//        public string Address2 { get; set; }

//        [StringLength(10)]
//        public string City { get; set; }

//        [StringLength(10)]
//        public string State { get; set; }

//        public virtual PropertyDetail PropertyDetail { get; set; }
//    }
//}
