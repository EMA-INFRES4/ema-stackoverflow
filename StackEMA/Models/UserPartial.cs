using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace StackEMA.Models
{
    [MetadataType(typeof(UserMetadata))]
    public partial class User : IValidatableObject
    {
        internal class UserMetadata
        {
            public int Id { get; set; }

            [Required]
            public string Email { get; set; }

            [Required]
            public string Password { get; set; }

            [Required]
            public string Name { get; set; }
        }

        public IEnumerable<ValidationResult> Validate(ValidationContext vc)
        {
            if(Password.Length < 3)
            {
                yield return new ValidationResult("Password > 3", new List<string> { "Password" }); 
            }
        }


        internal bool IsValid(string email, string password)
        {
            using(var db = new StackEMAContainer()){
                var users =
                    from user in db.User
                    where (user.Email == email && user.Password == password)
                    select user;
                return users.Count() > 0;
            }
        }
    }
}