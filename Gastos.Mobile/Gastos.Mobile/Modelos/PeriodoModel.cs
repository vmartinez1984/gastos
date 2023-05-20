using Gastos.Core.Dtos;
using SQLite;
using System;
using System.Collections.Generic;

namespace Gastos.Mobile.Modelos
{
    public class PeriodoModel : PeriodoDtoIn
    {
        public bool EstaSincronizado { get; set; }

        public bool EstaActivo { get; set; } = true;

        [PrimaryKey]
        public Guid Guid { get; set; } = Guid.NewGuid();
    }

    public class PeriodoConDetallesModel
    {
        public List<GastoModel> ListaDeApartados { get; set; }
        public List<GastoModel> ListaDeGastos { get; set; }
        public List<GastoModel> ListaDeEntradas { get; set; }
        public DateTime FechaInicial { get; internal set; }
        public DateTime FechaFinal { get; internal set; }
        public string Nombre { get; internal set; }
    }
}
