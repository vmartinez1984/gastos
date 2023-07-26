using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Gastos.Backup.Core.Entities
{
    public class SubcategoriaEntity
    {
        [Key]
        public Guid Guid { get; set; } = Guid.NewGuid();

        [ForeignKey(nameof(Categoria))]
        public Guid CategoriaGuid { get; set; }

        public virtual CategoriaEntity Categoria { get; set; }

        public string Nombre { get; set; }

        public bool EstaActivo { get; set; } = true;

        public decimal Cantidad { get; set; }
    }
}
