using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Gastos.Core.Entities
{
    public class DetalleDeApartadoEntity
    {
        [Key]
        public int Id { get; set; }

        //[ForeignKey(nameof(ApartadoEntity))]
        public int ApartadoId { get; set; }

        public decimal Cantidad { get; set; }

        public string Nota { get; set; }

        public DateTime FechaDeRegistro { get; set; } = DateTime.Now;

        public bool EstaActivo { get; set; } = true;
        public Guid Guid { get; set; } = Guid.NewGuid();
    }
}
