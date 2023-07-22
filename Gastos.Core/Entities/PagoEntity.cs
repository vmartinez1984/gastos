using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Gastos.Core.Entities
{
    public class PagoEntity
    {
        [Key]
        public int Id { get; set; }

        public int CompraId { get; set; }

        [ForeignKey("CompraId")]
        public virtual CompraEntity Compra { get; set; }

        public int NumeroDePago { get; set; }
        public decimal CantidadEsperada { get; set; }
        public DateTime FechaDePago { get; set; }
        public decimal CantidadDepositada { get; set; }

        public DateTime? FechaDeDeposito { get; set; }

        public bool EstaActivo { get; set; } = true;
    }
}
