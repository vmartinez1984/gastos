using System;

namespace Gastos.Core.Entities
{
    public class PeriodoEntity
    {
        public int Id { get; set; }

        public string Nombre { get; set; }

        public DateTime FechaInicial { get; set; }

        public DateTime FechaFinal { get; set; }

        public bool EstaActivo { get; set; } = true;

        public Guid Guid { get; set; } = Guid.NewGuid();
    }
}