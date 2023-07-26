using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Gastos.Backup.Core.Entities
{
    public class GastoEntity
    {
        [Key]
        public Guid Guid { get; set; }

        public string Nombre { get; set; }

        public decimal Cantidad { get; set; }

        [ForeignKey(nameof(CategoriaEntity))]
        public Guid SubcategoriaId { get; set; }

        public virtual SubcategoriaEntity Subcategoria { get; set; }

        public bool EstaActivo { get; set; } = true;

        public Guid PeriodoId { get; set; }

        public DateTime FechaDeRegistro { get; set; } = DateTime.Now;


    }
}
