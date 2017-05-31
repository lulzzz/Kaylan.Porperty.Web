using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Kaylan.Porperty.Web.ViewModel
{
    public class CountryViewModel
    {
        [Required]
        public string CountryName { get; set; }
    }
}