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
    
    public partial class Vehicle
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Vehicle()
        {
            this.CarofAccident = new HashSet<CarofAccident>();
        }
    
        public string VIN { get; set; }
        public string VehicleManufacturer { get; set; }
        public string VehicleModel { get; set; }
        public int Year { get; set; }
        public int Weight { get; set; }
        public int VehicleColorId { get; set; }
        public int EngineTypeId { get; set; }
        public int TypeOfDriverId { get; set; }
        public int DriverId { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CarofAccident> CarofAccident { get; set; }
        public virtual Driver Driver { get; set; }
        public virtual EngineType EngineType { get; set; }
        public virtual TypeOfDrive TypeOfDrive { get; set; }
        public virtual VehicleColor VehicleColor { get; set; }
    }
}
