using Gastos.Backup.Core.Interfaces.IRepositories;
using Gastos.Backup.Repositories.Repository;
using Gastos.Backup.Repositories.Contexts;   
using Microsoft.Extensions.DependencyInjection;

namespace Gastos.Backup.Repositories.Helpers
{
    public static class  Extensor
    {
        public static void AgregarBackupRepository(this IServiceCollection services)
        {
            services.AddScoped<AppDbContext>();

            services.AddScoped<IRepositorio, Repositorio>();
            //services.AddScoped<IPeriodoRepository, PeriodoRepository>();
            services.AddScoped<IApartadoRepository, ApartadoRepository>();
            //services.AddScoped<IGastoRepository, GastoRepository>();
            //services.AddScoped<ITipoDeApartadoRepository, TipoDeApartadoRepository>();
            //services.AddScoped<IDestinoRepository, DestinoRepository>();
            //services.AddScoped<ICategoriaRepository, CategoryRepository>();
            //services.AddScoped<ISubcategoriaRepository, SubcategoriaRepository>();
            //services.AddScoped<IDetalleDeApartadoRepository, DetalleDeApartadoRepository>();
            //services.AddScoped<ICompraRepository, CompraRepository>();
            //services.AddScoped<IPagoRepository, PagosRepository>();
        }
    }
}