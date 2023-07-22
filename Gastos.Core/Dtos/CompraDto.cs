using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Gastos.Core.Dtos
{
    public class CompraDto: CompraDtoIn
    {
        public int Id { get; set; }

        [Display(Name = "No de pago")]
        public int NumeroDePago { get; set; }

        [DataType(DataType.Date)]
        [Display(Name = "Corte")]
        public DateTime FechaDeCorte { get; set; }
        
        public List<PagoDto> ListaDePagos { get; set; }

        public List<FechaDePagoDto> ListaDeFechaDePagos { get; set; }
               
        [Display(Name = "Pago")]
        [DataType(DataType.Currency)]
        public decimal Pago { get; set; }

        [Display(Name = "Fecha de pago")]
        [DataType(DataType.Date)]
        public DateTime FechaDePago { get; set; }
    }

    public class CompraDtoIn
    {
        [Required(ErrorMessage = "El nombre es requerido")]
        [Display(Name = "Nombre")]
        [StringLength(20)]
        public string Nombre { get; set; }

        [StringLength(255)]
        public string Nota { get; set; }

        [Display(Name = "MSI")]
        [Range(1, 18)]
        public int MesesSinIntereses { get; set; } = 1;

        [Required(ErrorMessage = "El precio es requerido")]
        [Display(Name = "Precio")]
        [DataType(DataType.Currency)]
        //[Range(100,15000)]
        public decimal Cantidad { get; set; }

        public int TdcId { get; set; }

        [Display(Name = "Fecha")]
        [DataType(DataType.Date)]
        public DateTime FechaDeRegistro { get; set; } = DateTime.Now;
    }

    public class FechaDePagoDto
    {
        [DataType(DataType.Date)]
        public DateTime Fecha { get; set; }

        [Display(Name = "No de pago")]
        public int NumeroDePago { get; set; }

        public bool EsActual { get; set; }
    }

    public class TdcDto
    {
        public int Id { get; set; }

        [DataType(DataType.Date)]
        public DateTime DateCut { get; set; }

        [DataType(DataType.Date)]
        public DateTime DatePay { get; set; }
    }
}
