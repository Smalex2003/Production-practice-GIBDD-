//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Gibdd
{
    using System;
    using System.Collections.Generic;
    
    public partial class CarofAccident
    {
        public int id { get; set; }
        public int AccidentId { get; set; }
        public string VehicleVIN { get; set; }
    
        public virtual VehicleAccident VehicleAccident { get; set; }
        public virtual Vehicle Vehicle { get; set; }
    }
}
