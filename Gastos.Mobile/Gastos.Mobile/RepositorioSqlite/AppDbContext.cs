namespace Gastos.Mobile.RepositorioSqlite
{
    public class RepositorioSqlit
    {
        public RepositorioSqlit(string path)
        {
            Periodo = new PeriodoRepositorioSqlite(path);
            Apartado = new ApartadoRepositorioSqlite(path);
            Subcategoria = new SubcategoriaRepositorioSqlite(path);
            Categoria = new CategoriaRepositorioSqlite(path);
            Gasto = new GastoRepositorySqlite(path);
        }

        public PeriodoRepositorioSqlite Periodo { get; }

        public ApartadoRepositorioSqlite Apartado { get; }

        public SubcategoriaRepositorioSqlite Subcategoria { get; }

        public CategoriaRepositorioSqlite Categoria { get; }

        public GastoRepositorySqlite Gasto { get; }
    }

   
}
