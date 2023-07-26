using System;
using System.ComponentModel.DataAnnotations;

namespace Gastos.Backup.Core.Entities
{
    public class DetalleDeApartadoEntity
    {
        [Key]
        public Guid Guid { get; set; } = Guid.NewGuid();

        public int ApartadoId { get; set; }

        public decimal Cantidad { get; set; }

        public string Nota { get; set; }

        public DateTime FechaDeRegistro { get; set; } = DateTime.Now;

        public bool EstaActivo { get; set; } = true;
    }
}
