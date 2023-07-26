using System;
using System.ComponentModel.DataAnnotations;

namespace Gastos.Backup.Core.Entities
{
    public class PeriodoEntity
    {
        [Key]
        public Guid Guid { get; set; } = Guid.NewGuid();

        public string Nombre { get; set; }

        public DateTime FechaInicial { get; set; }

        public DateTime FechaFinal { get; set; }

        public bool EstaActivo { get; set; } = true;
    }
}