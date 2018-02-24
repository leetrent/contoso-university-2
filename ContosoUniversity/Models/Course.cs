using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ContosoUniversity.Models
{
    public class Course
    {
        /*
        *******************************************************************************
            The DatabaseGenerated attribute with the None parameter
            on the CourseID property specifies that primary key values
            are provided by the user rather than generated by the database.

            By default, Entity Framework assumes that primary key values
            are generated by the database. That's what you want in most scenarios.
            However, for Course entities, you'll use a user-specified course number
            such as a 1000 series for one department, a 2000 series for another
            department, and so on.
        ****************************************************************************** 
        */
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        [Display(Name = "Number")]
        public int CourseID { get; set; }

        [StringLength(50, MinimumLength = 3)]
        public string Title { get; set; }

        [Range(0, 5)]
        public int Credits { get; set; }

        /*
        ********************************************************************************            
            A course is assigned to one department, so there's a DepartmentID foreign key
            and a Department navigation property.

            Entity Framework doesn't require you to add a foreign key property
            to your data model when you have a navigation property for a 
            related entity.
            
            EF automatically creates foreign keys in the database wherever they're needed
            and creates shadow properties for them.
            
            But having the foreign key in the data model can make updates simpler and
            more efficient. For example, when you fetch a course entity to edit, the
            Department entity is null if you don't load it, so when you update the
            course entity, you would have to first fetch the Department entity.
            
            When the foreign key property DepartmentID is included in the data model,
            you don't need to fetch the Department entity before you update.            
        ********************************************************************************            
        */
        public int DepartmentID { get; set; }

        public Department Department { get; set; }
        
        /*
        *************************************************************
            A course can have any number of students enrolled in it,
            so the Enrollments navigation property is a collection. 
        *************************************************************            
         */
        public ICollection<Enrollment> Enrollments { get; set; }
        
        /* 
        *****************************************************
            A course may be taught by multiple instructors,
            so the CourseAssignments navigation property is
             a collection of 'CourseAssignment'.
        *****************************************************             
        */
        public ICollection<CourseAssignment> CourseAssignments { get; set; }
    }
}