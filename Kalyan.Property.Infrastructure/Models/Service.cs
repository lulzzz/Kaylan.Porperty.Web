//namespace Kalyan.Property.Infrastructure.Models
//{
//    using System;
//    using System.Collections.Generic;
//    using System.ComponentModel.DataAnnotations;
//    using System.ComponentModel.DataAnnotations.Schema;
//    using System.Data.Entity.Spatial;

//    public partial class Service
//    {
//        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
//        public Service()
//        {
//            Amenities = new HashSet<Amenity>();
//        }

//        [DatabaseGenerated(DatabaseGeneratedOption.None)]
//        public int Id { get; set; }

//        [StringLength(50)]
//        public string Name { get; set; }

//        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
//        public virtual ICollection<Amenity> Amenities { get; set; }
//    }
//}
