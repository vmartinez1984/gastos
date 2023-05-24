using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Gastos.Core.Entities
{
    [Table("Apartado")]
    public class ApartadoEntity
    {
        [Key]
        public int Id { get; set; }

        public int PeriodoId { get; set; } 

        [ForeignKey(nameof(TipoDeApartadoEntity))]
        public int TipoDeApartadoId { get; set; }
        public virtual TipoDeApartadoEntity TipoDeApartado { get; set; }

        [ForeignKey(nameof(SubcategoriaEntity))]
        public int SubcategoriaId { get; set; }
        public virtual SubcategoriaEntity Subcategoria { get; set; }


        public string Nombre { get; set; }

        public decimal Intereses { get; set; }

        public decimal CantidadInicial { get; set; }

        public decimal CantidadFinal { get; set; }

        public DateTime FechaInicial { get; set; }

        public DateTime FechaFinal { get; set; }

        public DateTime FechaDeRegistro { get; set; } = DateTime.Now;

        public bool EstaActivo { get; set; } = true;

        public Guid Guid { get; set; } = Guid.NewGuid();

        //public List<DetalleDeApartadoEntity> ListaDetalleDeApartados { get; set; }
    }
}
