using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace MVCWebApplicationTest1.Models
{
    public class State
    {
        public int? StateId { get; set; }
        public int? CountryId { get; set; }
        public string CountryName { get; set; }
        public string StateName { get; set; }
    }

    public class AddState
    {
        [Required(ErrorMessage = "State Name is required")]
        public string StateName { get; set; }

        [Required(ErrorMessage = "Country is required")]
        public int CountryId { get; set; }

        public int? Result = 0;
    }

    public class UpdateState
    {
        [Required]
        public int StateId { get; set; }

        [Required(ErrorMessage = "State Name is required")]
        public string StateName { get; set; }
        [Required(ErrorMessage = "Country is required")]
        public int CountryId { get; set; }

        public int? Result = 0;
    }

    public class DeleteState
    {
        [Required]
        public int StateId { get; set; }

        public int? Result = 0;
    }
}