using Gastos.Core.Dtos;
using SQLite;
using System;

namespace Gastos.Mobile.Modelos
{
    public class SubcategoriaModel : SubcategoriaDtoIn
    {
        [AutoIncrement, PrimaryKey]
        public int Id { get; set; }

        public bool EstaActivo { get; set; } = true;

        public Guid Guid { get; set; }

        public bool EstaSincronizado { get; set; }
        public string CategoriaNombre { get;  set; }
    }
}
