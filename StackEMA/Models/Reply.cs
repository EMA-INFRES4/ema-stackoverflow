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
    
    public partial class Reply
    {
        public int Id { get; set; }
        public string Message { get; set; }
        public System.DateTime Date { get; set; }
    
        public virtual Post Post { get; set; }
        public virtual User User { get; set; }
    }
}