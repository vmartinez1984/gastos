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

        [Display(Name = "Restantes")]
        public int DiasRestantes 
        {
            get
            {
                int dias;
                DateTime fechaActual;

                fechaActual = DateTime.Now;
                dias = (FechaFinal - fechaActual).Days;

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
        [DataType(DataType.Currency)]
        [Display(Name = "Cantidad inicial")]
        public decimal CantidadInicial { get; set; }

        [Required]
        [DataType(DataType.Currency)]
        [Display(Name = "Cantidad meta")]
        public decimal CantidadMeta { get; set; }
        
        [Required]
        [DataType(DataType.Currency)]
        [Display(Name = "Cantidad final")]
        public decimal CantidadFinal { get; set; }

        [Required]
        [DataType(DataType.Date)]
        [Display(Name = "Fecha inicial")]
        public DateTime FechaInicial { get; set; }

        [Required]
        [DataType(DataType.Date)]
        [Display(Name = "Fecha final")]
        public DateTime FechaFinal { get; set; }
    }
}
