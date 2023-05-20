using Gastos.Mobile.RepositorioApis;
using Gastos.Mobile.RepositorioSqlite;

namespace Gastos.Mobile.BusinessLayer
{
    public class UnitOfWork
    {
        public UnitOfWork(string path)
        {
            RepositorioApi repositorioApi = new RepositorioApi();
            RepositorioSqlit repositorioSqlite = new RepositorioSqlit(path);
            Periodo = new PeriodoBl(repositorioApi,repositorioSqlite);
            Apartado = new  ApartadoBl(repositorioApi,repositorioSqlite);
            Subcategoria = new SubcategoriaBl(repositorioApi, repositorioSqlite);
            Categoria = new CategoriaBl(repositorioApi, repositorioSqlite);
            Gasto = new GastoBl(repositorioApi,repositorioSqlite);
        }

        public PeriodoBl Periodo { get; set; }

        public ApartadoBl Apartado { get; set; }

        public SubcategoriaBl Subcategoria { get; set; }

        public CategoriaBl Categoria { get; set; }

        public GastoBl Gasto { get; set; }
    }


}
