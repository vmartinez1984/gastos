using System;
using System.ComponentModel.DataAnnotations;

namespace Gastos.Core.Dtos
{
    public class DetalleDeApartadoBaseDto
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

    public class DetalleDeApartadoDtoIn : DetalleDeApartadoBaseDto { }

    public class DetalleDeApartadoDto : DetalleDeApartadoBaseDto
    {
        [DataType(DataType.Date)]
        public DateTime FechaDeRegistro { get; set; }

        public int Id { get; set; }
    }
}
