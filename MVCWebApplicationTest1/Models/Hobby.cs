using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace MVCWebApplicationTest1.Models
{
    public class Hobby
    {
        public int? HobbyId { get; set; }
        public string HobbyName { get; set; }
    }

    public class AddHobby
    {
        [Required(ErrorMessage = "Hobby name is required")]
        public string HobbyName { get; set; }
        public int Result { get; set; }
    }

    public class UpdateHobby
    {
        [Required]
        public int HobbyId { get; set; }
        [Required(ErrorMessage = "Hobby name is required")]
        public string HobbyName { get; set; }
        public int Result { get; set; }
    }

    public class DeleteHobby
    {
        [Required]
        public int HobbyId { get; set; }
        public int Result { get; set; }
    }
}