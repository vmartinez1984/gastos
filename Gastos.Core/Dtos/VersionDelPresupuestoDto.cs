using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace Gastos.Core.Dtos
{
    public class VersionDelPresupuestoDto: VersionDelPresupuestoDtoIn
    {
        public int Id { get; set; }
    }
    public class VersionDelPresupuestoDtoIn
    {
        

        [Required]
        public string Nombre { get; set; }

        [Required]
        [Display(Name = "Fecha inicial")]
        [DataType(DataType.Date)]
        public DateTime FechaInicial { get; set; }

        [Required]
        [Display(Name = "Fecha inicial")]
        [DataType(DataType.Date)]
        public DateTime FechaFinal { get; set; }

        [Display(Name = "¿Está activo?")]
        public bool EstaActivo { get; set; } = true;
    }


}
