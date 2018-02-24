using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ContosoUniversity.Models
{
    public enum Grade
    {
        A, B, C, D, F
    }

    public class Enrollment
    {
        public int EnrollmentID { get; set; }
 
        public int CourseID { get; set; }
 
        public int StudentID { get; set; }
 
        [DisplayFormat(NullDisplayText = "No grade")]
         public Grade? Grade { get; set; }

        /* 
        *************************************************
            An enrollment record is for a single course,
            so there's a CourseID foreign key property
            and a Course navigation property
        *************************************************            
        */
        public Course Course { get; set; }
 
        /* 
        *************************************************
            An enrollment record is for a single student,
            so there's a StudentID foreign key property
            and a Student navigation property.
        *************************************************            
        */
        public Student Student { get; set; }
    }
}