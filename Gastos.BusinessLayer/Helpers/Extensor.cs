using Gastos.BusinessLayer.Bl;
using Gastos.Core.Interfaces.IBusinessLayer;
using Microsoft.Extensions.DependencyInjection;

namespace Gastos.BusinessLayer.Helpers
{
    public static class Extensor
    {
        public static void AgregarBl(this IServiceCollection services)
        {
            services.AddScoped<IPeriodoBl, PeriodoBl>();
            services.AddScoped<IApartadoBl, ApartadoBl>();
            services.AddScoped<ITipoDeApartadoBl, TipoDeApartadoBl>();
            services.AddScoped<IDestinoBl, DestinoBl>();
            services.AddScoped<IGastoBl, GastoBl>();
            services.AddScoped<ICategoriaBl, CategoriaBl>();
            services.AddScoped<ISubcategoriaBl, SubcategoriaBl>();
            services.AddScoped<IDetalleDeApartadoBl, DetalleDeApartadoBl>();
            services.AddScoped<ICompraBl, CompraBl>();
            services.AddScoped<IPagoBl, PagoBl>();      
            services.AddScoped<IVersionDelPresupuesto, VersionDelPresupuestoBl>();  
            services.AddScoped<IPresupuestoBl, PresupuestoBl>();

            services.AddScoped<IBl, UnitOfWork>();
        }
    }
}
