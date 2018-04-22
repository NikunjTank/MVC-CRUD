using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace MVCWebApplicationTest1.Models
{
    public class Country
    {
        public int? CountryId { get; set; }
        public string CountryName { get; set; }
        public int CreatedBy { get; set; }
        public int ModifiedBy { get; set; }

        public int? Result = 0;
    }

    public class AddCountry
    {
        [Required(ErrorMessage = "Country Name is required")]
        public string CountryName { get; set; }
        public int CreatedBy { get; set; }

        public int? Result = 0;
    }

    public class UpdateCountry
    {
        [Required]
        public int CountryId { get; set; }

        [Required(ErrorMessage = "Country Name is required")]
        public string CountryName { get; set; }
        public int ModifiedBy { get; set; }

        public int? Result = 0;
    }

    public class DeleteCountry
    {
        [Required]
        public int CountryId { get; set; }
        public int ModifiedBy { get; set; }

        public int? Result = 0;
    }
}