using System.ComponentModel.DataAnnotations;

namespace Gastos.Core.Dtos
{
    public class ApartadoDto
    {
        public int Id { get; set; }
    }
    
    public class ApartadoDtoIn
    {
        public int TipoDeApartadoId { get; set; }

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
        public int PeriodoId { get; set; }

        public int DestinoId { get; set; }
    }
}
