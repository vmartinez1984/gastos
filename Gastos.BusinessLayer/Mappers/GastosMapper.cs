using AutoMapper;
using Gastos.Core.Dtos;
using Gastos.Core.Entities;

namespace Gastos.Core.Mappers
{

    public class GastosMapper : Profile
    {
        public GastosMapper()
        {
            CreateMap<PeriodoEntity, PeriodoDto>();
            CreateMap<PeriodoDtoIn, PeriodoEntity>();

            CreateMap<ApartadoDtoIn, ApartadoEntity>();

            CreateMap<TipoDeApartadoEntity, TipoDeApartadoDto>();

            CreateMap<DestinoEntity, DestinoDto>();

            CreateMap<GastoEntity, GastoDto>();
            CreateMap<GastoDtoIn, GastoEntity>();

            CreateMap<SubcategoriaEntity, SubcategoriaDto>();
            CreateMap<SubcategoriaDtoIn, SubcategoriaEntity>();

            CreateMap<CategoriaEntity, CategoriaDto>();

            //CreateMap<GastoDto, GastoApartadoDto>();

            CreateMap<ApartadoEntity, ApartadoDto>();

            CreateMap<DetalleDeApartadoDtoIn, DetalleDeApartadoEntity>();
            CreateMap<DetalleDeApartadoEntity, DetalleDeApartadoDto>();

            CreateMap<CompraEntity, CompraDto>();
            CreateMap<CompraDtoIn, CompraEntity>();
        }
    }
}
