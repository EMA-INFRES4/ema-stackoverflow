
//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------


namespace StackEMA.Models
{

using System;
    using System.Collections.Generic;
    
public partial class Post
{

    public Post()
    {

        this.Replies = new HashSet<Reply>();

    }


    public int Id { get; set; }

    public string Title { get; set; }

    public Nullable<System.DateTime> Date { get; set; }

    public short Popular { get; set; }



    public virtual ICollection<Reply> Replies { get; set; }

    public virtual User User { get; set; }

}

}
