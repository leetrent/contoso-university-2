using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ContosoUniversity.Models
{
    public class Department
    {
        public int DepartmentID { get; set; }

        [StringLength(50, MinimumLength = 3)]
        public string Name { get; set; }

        /*
         **********************************
            [Column(TypeName = "money")]
            is SQL Server specific
         **********************************
        */
        //[Column(TypeName = "money")]
        
        [DataType(DataType.Currency)]
        public decimal Budget { get; set; }

        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        [Display(Name = "Start Date")]
        public DateTime StartDate { get; set; }

        /*
        ******************************************************** 
            A department may or may not have an administrator,
            and an administrator is always an instructor.
            
            Therefore the InstructorID property is included
            as the foreign key to the Instructor entity,
            and a question mark is added after the int type
            designation to mark the property as nullable.
            
            The navigation property is named Administrator
            but holds an Instructor entity        

            By convention, the Entity Framework enables
            cascade delete for non-nullable foreign keys
            and for many-to-many relationships. This can
            result in circular cascade delete rules,
            which will cause an exception when you try to
            add a migration. 
            
            For example, if you didn't define the 
            Department.InstructorID property as nullable,
            EF would configure a cascade delete rule to
            delete the instructor when you delete the
            department, which isn't what you want to have happen.
            
            If your business rules required the InstructorID
            property to be non-nullable, you would have to use
            the following fluent API statement to disable
            cascade delete on the relationship:

            modelBuilder.Entity<Department>()
            .HasOne(d => d.Administrator)
            .WithMany()
            .OnDelete(DeleteBehavior.Restrict)
        ********************************************************         
         */
        public int? InstructorID { get; set; }

        /*
         ******************************************************** 
            Used to detect concurrency conflicts
         ********************************************************     
         */
        [Timestamp]
        //public byte[] RowVersion { get; set; }
        public DateTime RowVersion { get; set; }

        public Instructor Administrator { get; set; }

        /*
        **********************************************
            A department may have many courses,
            so there's a Courses navigation property
        **********************************************    
        */
        public ICollection<Course> Courses { get; set; }
    }
}