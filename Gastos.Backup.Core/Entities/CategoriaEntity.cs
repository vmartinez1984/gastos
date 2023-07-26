using System;
using System.ComponentModel.DataAnnotations;

namespace Gastos.Backup.Core.Entities
{
    public class CategoriaEntity
    {
        [Key]
        public Guid Guid { get; set; } = Guid.NewGuid();

        public string Nombre { get; set; }

        public bool EstaActivo { get; set; } = true;
    }
}