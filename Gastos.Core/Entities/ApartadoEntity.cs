using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Gastos.Core.Entities
{
    public class ApartadoEntity
    {
        [Key]
        public int Id { get; set; }

        public int PeriodoId { get; set; } 

        [ForeignKey(nameof(TipoDeApartadoEntity))]
        public int TipoDeApartadoId { get; set; }

        public int SubcategoriaId { get; set; }

        public virtual TipoDeApartadoEntity TipoDeApartado { get; set; }

        public string Nombre { get; set; }

        public decimal Intereses { get; set; }

        public decimal CantidadInicial { get; set; }
        public decimal CantidadFinal { get; set; }

        public DateTime FechaInicial { get; set; }

        public DateTime FechaFinal { get; set; }

        public DateTime FechaDeRegistro { get; set; } = DateTime.Now;

        public bool EstaActivo { get; set; } = true;

    }
}
