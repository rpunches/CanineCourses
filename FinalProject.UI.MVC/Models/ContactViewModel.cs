using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace FinalProject.UI.MVC.Models
{
    public class ContactViewModel
    {
        [Required(ErrorMessage ="*")]
        public string Name { get; set; }

        [Required(ErrorMessage = "*")]
        [EmailAddress]
        public string Email { get; set; }

        [UIHint("MultiLineText")]
        [Required(ErrorMessage = "*")]
        public string Message { get; set; }

    }
}