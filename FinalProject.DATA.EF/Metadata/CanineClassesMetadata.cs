using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace FinalProject.DATA.EF//.Metadata
{
    class CanineClassesMetadata
    {
        #region Course Metadata
        public class CourseMetadata
        {
            //public int CourseId { get; set; }
            [Required(ErrorMessage ="*")]
            [StringLength(200, ErrorMessage ="* Course Name cannot be more than 200 characters.")]
            [Display(Name ="Course Name")]
            public string CourseName { get; set; }
            
            [DisplayFormat(NullDisplayText = "N/A")]
            [StringLength(500, ErrorMessage = "* Course Description cannot be more than 500 characters.")]
            [Display(Name = "Course Description")]
            public string CourseDescription { get; set; }

            [Required(ErrorMessage = "*")]
            [Display(Name = "Active")]
            public bool IsActive { get; set; }
        }
        #endregion

        #region Course Completion Metadata
        public class CourseCompletionMetadata
        {
            //public int CourseCompletionId { get; set; }
            [Required(ErrorMessage = "*")]
            [Display(Name = "User ID")]
            public string UserId { get; set; }

            [Required(ErrorMessage = "*")]
            [Display(Name = "Course ID")]
            public int CourseId { get; set; }

            [Required(ErrorMessage = "*")]
            [Display(Name = "Course Complete Date")]
            [DisplayFormat(DataFormatString = "{0:d}", ApplyFormatInEditMode =true)]
            public System.DateTime DateCompleted { get; set; }
        }
        #endregion

        #region Lesson Metadata
        public class LessonMetadata
        {
            //public int LessonId { get; set; }
            [Required(ErrorMessage = "*")]
            [StringLength(200, ErrorMessage = "* Lesson Title cannot be more than 200 characters.")]
            [Display(Name = "Lesson Title")]
            public string LessonTitle { get; set; }

            [Required(ErrorMessage = "*")]
            [Display(Name = "Course ID")]
            public int CourseId { get; set; }

            [DisplayFormat(NullDisplayText = "N/A")]
            [StringLength(300, ErrorMessage = "* Lesson Introduction cannot be more than 300 characters.")]
            [Display(Name = "Introduction")]
            public string Introduction { get; set; }

            [DisplayFormat(NullDisplayText = "N/A")]
            [StringLength(250, ErrorMessage = "* Video URL cannot be more than 250 characters.")]
            [Display(Name = "Video URL")]
            public string VideoURL { get; set; }

            [DisplayFormat(NullDisplayText = "N/A")]
            [StringLength(100, ErrorMessage = "* PDF file name cannot be more than 100 characters.")]
            [Display(Name = "PDF File")]
            public string PdfFileName { get; set; }

            [Required(ErrorMessage = "*")]
            [Display(Name = "Active")]
            public bool IsActive { get; set; }
        }
        #endregion

        #region Lesson View Metadata
        public class LessonViewMetadata
        {
            //public int LessonViewId { get; set; }
            [Required(ErrorMessage = "*")]
            [Display(Name = "User ID")]
            public string UserId { get; set; }

            [Required(ErrorMessage = "*")]
            [Display(Name = "Lesson ID")]
            public int LessonId { get; set; }

            [Required(ErrorMessage = "*")]
            [Display(Name = "Lesson View Date")]
            [DisplayFormat(DataFormatString = "{0:d}", ApplyFormatInEditMode = true)]
            public System.DateTime DateViewed { get; set; }
        }
        #endregion

        #region User Detail Metadata
        public class UserDetailMetadata
        {
            //public string UserId { get; set; }
            [Required(ErrorMessage = "*")]
            [StringLength(50, ErrorMessage = "* First Name cannot be more than 50 characters.")]
            [Display(Name = "First Name")]
            public string FirstName { get; set; }

            [Required(ErrorMessage = "*")]
            [StringLength(50, ErrorMessage = "* Last Name cannot be more than 50 characters.")]
            [Display(Name = "Last Name")]
            public string LastName { get; set; }

            [Required(ErrorMessage = "*")]
            [StringLength(60, ErrorMessage = "* Email cannot be more than 60 characters.")]
            [Display(Name = "E-mail")]
            public string Email { get; set; }
        } 
        [MetadataType(typeof(UserDetailMetadata))]
        public partial class UserDetail
        {
            [Display(Name = "User")]
            public string FullName
            {
                get { return FirstName + " " + LastName; }
            }

            public string FirstName { get; private set; }
            public string LastName { get; private set; }
        }
        #endregion
    }
}
