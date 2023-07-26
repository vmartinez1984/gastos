using Gastos.Backup.BusinessLayer.Bl;
using Gastos.Backup.Core.Interfaces;
using Microsoft.Extensions.DependencyInjection;

namespace Gastos.Backup.BusinessLayer.Extensors
{
    public static class GastosBackupBlExtensor
    {
        public static void AgregarBackupBl(this IServiceCollection services)
        {
            services.AgregarMappers();

            services.AddScoped<IBl, GastosBackupBl>();

            services.AddScoped<IApartadoBl, ApartadoBl>();
        }
    }
}
