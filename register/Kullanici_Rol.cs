//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Register
{
    using System;
    using System.Collections.Generic;
    
    public partial class Kullanici_Rol
    {
        public int id { get; set; }
        public int ref_kullanici { get; set; }
        public int ref_rol { get; set; }
    
        public virtual Login Login { get; set; }
        public virtual Rol Rol { get; set; }
    }
}
