using Gastos.Core.Validators;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Gastos.Core.Dtos
{    
    public class ApartadoDto: ApartadoDtoBase
    {
        public int Id { get; set; }

        public TipoDeApartadoDto TipoDeApartado { get; set; }

        //public List<DetalleDeApartadoDto> ListaDeDetalles { get; set; }
        public List<DetalleDeApartadoDto> ListaDeDetalles { get; set; }

        public int DiasRestantes 
        {
            get
            {
                int dias;
                DateTime fechaActual;

                fechaActual = DateTime.Now;
                dias = FechaFinal.DayOfYear - fechaActual.DayOfYear;

                return dias;
            }
        }

        public SubcategoriaDto Subcategoria { get; set; }

        public Guid Guid { get; set; }
    }
    
    public class ApartadoDtoIn: ApartadoDtoUpdate
    {
        [Required]
        [ApartadoGuidExiste]
        public Guid Guid { get; set; }        
                
    }
    
    public class ApartadoDtoUpdate: ApartadoDtoBase
    {      
        [Required]
        [TipoDeApartadoIdValidar]        
        public int TipoDeApartadoId { get; set; }
       
       
        //[Required]
        //[PeriodoGuidExiste]
       // public string PeriodoIdGuid { get; set; }

        [Required]
        [SubcategoriaIdGuidValidar]
        [MaxLength(36)]
        public string SubcategoriaIdGuid { get; set; }
    }

    public class ApartadoDtoBase
    {
        [Required]
        [StringLength(50)]
        public string Nombre { get; set; }

        [Required]
        public decimal Intereses { get; set; }

        [Required]
        public decimal CantidadInicial { get; set; }

        [Required]
        public decimal CantidadFinal { get; set; }

        [Required]
        [DataType(DataType.Date)]
        public DateTime FechaInicial { get; set; }

        [Required]
        [DataType(DataType.Date)]
        public DateTime FechaFinal { get; set; }
    }
}
