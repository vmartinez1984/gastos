using Gastos.Core.Dtos;

namespace Gastos.Mvc.Models
{
    public class PeriodoConGastosModel
    {
        public PeriodoDto    Periodo { get; set; }

        public List<GastoDto> ListaDeGastos { get; set; }
    }
}
