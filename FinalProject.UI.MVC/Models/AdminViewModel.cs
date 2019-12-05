using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;

namespace FinalProject.UI.MVC.Models
{
    public class RoleViewModel
    {
        public string Id { get; set; }
        [Required(AllowEmptyStrings = false)]
        [Display(Name = "Role")]
        public string Name { get; set; }
    }

    public class EditUserViewModel
    {
        public string Id { get; set; }

        //[Required(AllowEmptyStrings = false)]
        //[StringLength(50, ErrorMessage = "* First Name cannot be more than 50 characters.")]
        //[Display(Name = "First Name")]
        //public string FirstName { get; set; }

        //[Required(AllowEmptyStrings = false)]
        //[StringLength(50, ErrorMessage = "* Last Name cannot be more than 50 characters.")]
        //[Display(Name = "Last Name")]
        //public string LastName { get; set; }

        [Required(AllowEmptyStrings = false)]
        [Display(Name = "Email")]
        [EmailAddress]
        public string Email { get; set; }

        public IEnumerable<SelectListItem> RolesList { get; set; }
    }
}