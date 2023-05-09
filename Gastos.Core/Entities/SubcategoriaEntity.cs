using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Gastos.Core.Entities
{
    public class SubcategoriaEntity
    {
        [Key]
        public int Id { get; set; }

        [ForeignKey(nameof(Categoria))]
        public int CategoriaId { get; set; }

        public virtual CategoriaEntity Categoria { get; set; }

        public string Nombre { get; set; }

        public bool EstaActivo { get; set; } = true;

        public decimal Cantidad { get; set; }
        public Guid Guid { get; set; } = Guid.NewGuid();
    }
}
