using Gastos.Core.Dtos;
using SQLite;

namespace Gastos.Mobile.Modelos
{
    public class PeriodoModel : PeriodoDtoIn
    {
        [AutoIncrement, PrimaryKey]
        public int Id { get; set; }

        public bool EstaSincronizado { get; set; }

        public bool EstaActivo { get; set; } = true;
    }    
}
