using System;
using System.ComponentModel.DataAnnotations.Schema;

namespace Gastos.Core.Entities
{
    public class GastoEntity
    {
        public int Id { get; set; }

        public string Nombre { get; set; }

        public decimal Cantidad { get; set; }

        [ForeignKey(nameof(CategoriaEntity))]
        public int SubcategoriaId { get; set; }

        public virtual SubcategoriaEntity Subcategoria { get; set; }

        public bool EstaActivo { get; set; } = true;

        public int PeriodoId { get; set; }

        public DateTime FechaDeRegistro { get; set; } = DateTime.Now;

        public Guid IdemPotency { get; set; }
        
    }
}
