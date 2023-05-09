using Gastos.Core.Dtos;
using System;

namespace Gastos.Mobile.Modelos
{
    public class ApartadoModel : ApartadoDtoIn
    {
        //[AutoIncrement, PrimaryKey]
        //public int Id { get; set; }

        public bool EstaSincronizado { get; set; }
        public bool EstaActivo { get; set; } = true;

        public int DiasRestantes { get; set; }

        public string TipoDeApartadoNombre { get; set; }
        public Guid Guid { get;  set; }
    }
}
