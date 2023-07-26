using AutoMapper;
using Gastos.Backup.Core.Entities;
using Gastos.Core.Dtos;

namespace Gastos.Backup.Core.Mappers
{
    public class GastosBackupMapper : Profile
    {
        public GastosBackupMapper()
        {
            CreateMap<ApartadoEntity, ApartadoDto>().ReverseMap();
            CreateMap<TipoDeApartadoDto, TipoDeApartadoEntity>();
            CreateMap<SubcategoriaDto, SubcategoriaEntity>();
            CreateMap<CategoriaDto, CategoriaEntity>();
        }
    }
}
