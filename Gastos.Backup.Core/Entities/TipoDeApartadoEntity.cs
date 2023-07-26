using System;
using System.ComponentModel.DataAnnotations;

namespace Gastos.Backup.Core.Entities
{
    public class TipoDeApartadoEntity
    {
        [Key]
        public Guid Guid { get; set; } = Guid.NewGuid();

        public string Nombre { get; set; }

        public bool EstaActivo { get; set; }
    }
}