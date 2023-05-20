using Gastos.Core.Dtos;
using SQLite;
using System;

namespace Gastos.Mobile.Modelos
{
    public class GastoModel : GastoDtoIn
    {
        public bool EstaSincronizado { get; set; }

        public bool EstaActivo { get; set; } = true;

        public Guid PeriodoGuid { get; set; }

        public Guid SubcategoriaGuid { get; set; }

        public string SubcategoriaNombre { get; set; }

        public decimal Presupuesto { get; set; }

        public int CategoriaId { get; internal set; }

        [PrimaryKey]
        public Guid IdemPotency { get; set; }
    }
}
