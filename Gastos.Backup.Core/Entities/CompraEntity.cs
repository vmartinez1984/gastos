using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Gastos.Backup.Core.Entities
{
    public class CompraEntity
    {
        public CompraEntity()
        {
            ListaDePagos = new List<PagoEntity>();
        }

        [Key]
        public Guid Guid { get; set; } = Guid.NewGuid();

        public string Nombre { get; set; }

        public string Nota { get; set; }

        public int MesesSinIntereses { get; set; }

        public decimal Cantidad { get; set; }

        public int TdcId { get; set; }

        public DateTime FechaDeRegistro { get; set; } = DateTime.Now;

        public bool EstaActivo { get; set; } = true;


        public virtual List<PagoEntity> ListaDePagos { get; set; }
    }
}