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
    
    public partial class PhotoOfVehicleAccident
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Photo { get; set; }
        public int VehicleAccidentId { get; set; }
    
        public virtual VehicleAccident VehicleAccident { get; set; }
    }
}
