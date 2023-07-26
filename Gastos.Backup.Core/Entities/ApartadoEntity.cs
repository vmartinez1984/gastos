using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Gastos.Backup.Core.Entities
{
    [Table("Apartado")]
    public class ApartadoEntity
    {
        [Key]
        public Guid Guid { get; set; } = Guid.NewGuid();

        public Guid PeriodoGuid { get; set; }

        [ForeignKey(nameof(TipoDeApartadoEntity))]
        public Guid TipoDeApartadoGuid { get; set; }
        public virtual TipoDeApartadoEntity TipoDeApartado { get; set; }

        [ForeignKey(nameof(SubcategoriaEntity))]
        public Guid SubcategoriaGuid { get; set; }
        public virtual SubcategoriaEntity Subcategoria { get; set; }

        public string Nombre { get; set; }

        public decimal Intereses { get; set; }

        public decimal CantidadInicial { get; set; }

        public decimal CantidadFinal { get; set; }

        public DateTime FechaInicial { get; set; }

        public DateTime FechaFinal { get; set; }

        public DateTime FechaDeRegistro { get; set; } = DateTime.Now;

        public bool EstaActivo { get; set; } = true;

    }
}
