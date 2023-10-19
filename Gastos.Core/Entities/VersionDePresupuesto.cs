using System;
using System.ComponentModel.DataAnnotations;

namespace Gastos.Core.Entities
{
    public class VersionDePresupuestoEntity
    {
        [Key]
        public int Id { get; set; }

        [Required]
        public string Nombre { get; set; }

        [Required]
        public DateTime FechaInicial { get; set; }

        [Required]
        public DateTime FechaFinal { get; set; }

        public bool EstaActivo { get; set; } = true;

        public string Nota { get; set; }
    }
}
