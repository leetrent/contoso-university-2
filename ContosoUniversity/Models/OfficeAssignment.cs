using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ContosoUniversity.Models
{
    public class OfficeAssignment
    {
        /*
        *******************************************************************
            An office assignment only exists in relation to the instructor
            it's assigned to, and therefore its primary key is also its 
            foreign key to the Instructor entity.

            Entity Framework can't automatically recognize InstructorID
            as the primary key of this entity because its name doesn't
            follow the ID or classnameID naming convention. Therefore,
            the Key attribute is used to identify it as the key.
        *******************************************************************    
        */
        [Key]
        public int InstructorID { get; set; }
        
        [StringLength(50)]
        [Display(Name = "Office Location")]
        public string Location { get; set; }

        public Instructor Instructor { get; set; }
    }
}