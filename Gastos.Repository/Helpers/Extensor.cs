using Gastos.Core.Interfaces.IRepositories;
using Gastos.Repositories.Repository;
using Gastos.Repository.Contexts;
using Microsoft.Extensions.DependencyInjection;

namespace Gastos.Repositories.Helpers
{
    public static class  Extensor
    {
        public static void AgregarRepository(this IServiceCollection services)
        {
            services.AddScoped<AppDbContext>();

            services.AddScoped<IPeriodoRepository, PeriodoRepository>();
            services.AddScoped<IRepositorio, Repositorio>();
            services.AddScoped<IApartadoRepository, ApartadoRepository>();
            services.AddScoped<IGastoRepository, GastoRepository>();
            services.AddScoped<ITipoDeApartadoRepository, TipoDeApartadoRepository>();
            services.AddScoped<IDestinoRepository, DestinoRepository>();
            services.AddScoped<ICategoriaRepository, CategoryRepository>();
            services.AddScoped<ISubcategoriaRepository, SubcategoriaRepository>();
            services.AddScoped<IDetalleDeApartadoRepository, DetalleDeApartadoRepository>();
            services.AddScoped<ICompraRepository, CompraRepository>();
            services.AddScoped<IPagoRepository, PagosRepository>();
        }
    }
}