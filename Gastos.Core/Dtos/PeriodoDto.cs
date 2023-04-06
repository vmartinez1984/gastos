using System.ComponentModel.DataAnnotations;

namespace Gastos.Core.Dtos
{
    public class PeriodoCompletoDto: PeriodoDto
    {
        public List<GastoDto> ListaDeGastos;
    }

    public class PeriodoDto: PeriodoDtoIn
    {
        public int Id { get; set; }
    }

    public class PeriodoDtoIn
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
}
