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
        [Required]
        [StringLength(100)]
        public string Nombre { get; set; }

        [Required]
        [DataType(DataType.Date)]
        public DateTime FechaInicial { get; set; }

        [Required]
        [DataType(DataType.Date)]
        public DateTime FechaFinal { get; set; }
    }

    public class PeriodoDtoIn : PeriodoDtoUpdate
    {
        [Required]
        [StringLength(100)]
        public string Nombre { get; set; }

        [Required]
        [DataType(DataType.Date)]
        public DateTime FechaInicial { get; set; }

        [Required]
        [DataType(DataType.Date)]
        public DateTime FechaFinal { get; set; }

        [Required]
        [PeriodoGuidExiste]        
        public Guid Guid { get; set; }
    }
}
