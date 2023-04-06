using AutoMapper;
using Microsoft.Extensions.DependencyInjection;

namespace Gastos.Core.Mappers
{
    public static class GastosMapperExtensor
    {
        public static void AgregarMappers(this IServiceCollection services)
        {
            var mapperConfig = new MapperConfiguration(mapperConfig =>
            {
                mapperConfig.AddProfile<GastosMapper>();
            });
            IMapper mapper = mapperConfig.CreateMapper();
            services.AddSingleton(mapper);
        }
    }
}
