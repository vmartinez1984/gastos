using Gastos.Core.Validators;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Runtime.InteropServices;

namespace Gastos.Core.Dtos
{
    public class PeriodoConDetallesDto : PeriodoDto
    {

        public List<GastoDto> ListaDeGastos { get; set; }

        public List<GastoDto> ListaDeEntradas { get; set; }

        public List<GastoDto> ListaDeApartados { get; set; }

    }

    public class PeriodoDto : PeriodoDtoIn
    {
        public int Id { get; set; }        
    }

    public class PeriodoDtoUpdate
    {
        [Required(ErrorMessage ="El nombre es requerido")]
        [StringLength(100)]
        public string Nombre { get; set; }

        [Required(ErrorMessage = "La fecha inicial es requerida")]
        [DataType(DataType.Date)]
        [Display(Name = "Fecha inicial")]
        public DateTime FechaInicial { get; set; }
                
        [Required(ErrorMessage = "La fecha final es requerida")]
        [DataType(DataType.Date)]
        [Display(Name = "Fecha final")]
        public DateTime FechaFinal { get; set; }
    }

    public class PeriodoDtoIn : PeriodoDtoUpdate
    {        
        [Required]
        [PeriodoGuidExiste]        
        public Guid Guid { get; set; }
    }
}
