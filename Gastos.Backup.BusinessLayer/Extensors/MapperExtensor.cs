using AutoMapper;
using Gastos.Backup.Core.Mappers;
using Microsoft.Extensions.DependencyInjection;

namespace Gastos.Backup.BusinessLayer.Extensors
{
    public static class MapperExtensor
    {
        public static void AgregarMappers(this IServiceCollection services)
        {
            var mapperConfig = new MapperConfiguration(mapperConfig =>
            {
                mapperConfig.AddProfile<GastosBackupMapper>();
            });
            IMapper mapper = mapperConfig.CreateMapper();
            services.AddSingleton(mapper);
        }
    }


}
