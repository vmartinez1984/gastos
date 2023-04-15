using System.ComponentModel.DataAnnotations;

namespace Gastos.Core.Dtos
{
    public class CompraDto: CompraDtoIn
    {
        public int Id { get; set; }

        public int NumeroDePago { get; set; }

        public DateTime FechaDeCorte { get; set; }
        
        public List<PayDto> ListPays { get; set; }

        public List<FechaDePagoDto> ListaDeFechaDePagos { get; set; }
               
        [Display(Name = "Pago")]
        [DataType(DataType.Currency)]
        public decimal Pago { get; set; }

        public DateTime FechaDePago { get; set; }
    }

    public class CompraDtoIn
    {
        [Display(Name = "Nombre")]
        [StringLength(20)]
        public string Nombre { get; set; }

        [StringLength(255)]
        public string Nota { get; set; }

        [Display(Name = "MSI")]
        [Range(1,18)]
        public int MesesSinIntereses { get; set; }

        [Display(Name = "Precio")]
        [DataType(DataType.Currency)]
        //[Range(100,15000)]
        public decimal Cantidad { get; set; }

        public int TdcId { get; set; }

        [Display(Name = "Fecha")]
        [DataType(DataType.Date)]
        public DateTime FechaDeRegistro { get; set; }
    }

    public class FechaDePagoDto
    {
        [DataType(DataType.Date)]
        public DateTime Fecha { get; set; }

        [Display(Name = "No de pago")]
        public int NumeroDePago { get; set; }

        public bool EsActual { get; set; }
    }

    public class PayDto : PayDtoIn
    {
        public int Id { get; set; }
    }

    public class PayDtoIn
    {
        public decimal Amount { get; set; }


        public string Name { get; set; }

        public DateTime DateRegistration { get; set; } = DateTime.Now;

        public bool IsActive { get; set; } = true;
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
