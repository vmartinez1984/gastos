using Gastos.Core.Dtos;

namespace Gastos.Mobile.Modelos
{
    internal class GastoModel: GastoDtoIn
    {
        public int Id { get; set; }

        public bool EstaSincronizado { get; set; }

        public bool EstaActivo { get; set; } = true;
    }
}
