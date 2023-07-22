using System;
using System.ComponentModel.DataAnnotations;

namespace Gastos.Core.Dtos
{
    public class PagoDto : PagoDtoIn
    {
        public int Id { get; set; }
    }

    public class PagoDtoIn
    {
        public int CompraId { get; set; }

        [Display(Name = "No de pago")]
        public int NumeroDePago { get; set; }

        [Display(Name = "Cantidad esperada")]
        [DataType(DataType.Currency)]
        public decimal CantidadEsperada { get; set; }

        [Display(Name = "Fecha de pago")]
        [DataType(DataType.Date)]
        public DateTime FechaDePago { get; set; }

        [Display(Name = "Cantidad depositada")]
        [DataType(DataType.Currency)]
        public decimal CantidadDepositada { get; set; }

        [Display(Name = "Fecha de deposito")]
        [DataType(DataType.Date)]
        public DateTime? FechaDeDeposito { get; set; }
    }
}
