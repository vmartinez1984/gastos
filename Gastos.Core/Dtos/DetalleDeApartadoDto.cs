using System.ComponentModel.DataAnnotations;

namespace Gastos.Core.Dtos
{
    public class DetalleDeApartadoDtoIn
    {
        [Required]
        public int ApartadoId { get; set; }

        [Required]
        public decimal Cantidad { get; set; }

        [StringLength(255)]
        public string Nota { get; set; }

        [Required]
        public int PeriodoId { get; set; }

        [Required]
        public int SubcategoriaId { get; set; }
    }

    public class DetalleDeApartadoDto: DetalleDeApartadoDtoIn
    {
        public int Id { get; set; }
    }
}
