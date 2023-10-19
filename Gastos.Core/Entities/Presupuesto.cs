using System.ComponentModel.DataAnnotations;

namespace Gastos.Core.Entities
{
    public class PresupuestoEntity
    {
        [Key]
        public int Id { get; set; }

        [Required]
        public int SubcategoriaId { get; set; }

        [Required]
        public decimal Cantidad { get; set; }

        [Required]
        public decimal CantidadMeta { get; set; }

        [Required]
        public int VersionDelPresupuestoId { get; set; }

        public bool EstaActivo { get; set; } = true;
    }
}
