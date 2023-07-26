using Gastos.Backup.Core.Interfaces.IServices;
using Microsoft.Extensions.DependencyInjection;

namespace Gastos.Backup.Services.Helpers
{
    public static class  GastosBackupServicesExtensor
    {
        public static void AgregarBackupServices(this IServiceCollection services)
        {
            services.AddHttpClient();

            services.AddScoped<IGastosService, GastosService>();            

            services.AddScoped<IApartadoService, ApartadoService>();
        }
    }
}
