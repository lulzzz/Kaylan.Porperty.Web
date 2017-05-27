namespace Kalyan.Property.Infrastructure.Models
{
    using System;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    public partial class ContractType
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }

        [StringLength(50)]
        public string Conmmertial { get; set; }

        public DateTime? Date { get; set; }

        [StringLength(50)]
        public string Rent { get; set; }

        [StringLength(50)]
        public string Sale { get; set; }
    }
}