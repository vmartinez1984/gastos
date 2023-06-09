﻿namespace Gastos.Mobile.RepositorioApis
{
    public class RepositorioApi
    {

        public RepositorioApi(

        )
        {
            Periodo = new PeriodoRepositorioApi();
            Subcategoria = new SubcategoriaRepositorioApi();
            Apartado = new ApartadoRepositoryApi();
            Categoria = new CategoriaRepositorioApi();
            Gasto = new GastoRepositorioApi();
        }

        public PeriodoRepositorioApi Periodo { get; }

        public SubcategoriaRepositorioApi Subcategoria { get; }

        public ApartadoRepositoryApi Apartado { get; set; }

        public CategoriaRepositorioApi Categoria { get; }
        public GastoRepositorioApi Gasto { get; }
    }
}
