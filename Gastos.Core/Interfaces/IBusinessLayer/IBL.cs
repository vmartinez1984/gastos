using Gastos.Core.Dtos;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Gastos.Core.Interfaces.IBusinessLayer
{
    public interface IBl
    {
        IPeriodoBl Periodo { get; }

        IApartadoBl Apartado { get; }

        ITipoDeApartadoBl TipoDeApartado { get; }

        IDestinoBl Destino { get; }

        IGastoBl Gasto { get; }

        ISubcategoriaBl Subcategoria { get; }

        ICategoriaBl Categoria { get; }

        IDetalleDeApartadoBl DetalleDeApartado { get; }

        ICompraBl Compra { get; }
    }

    public interface ICompraBl : IBaseBl<CompraDtoIn, CompraDto>
    {        
        Task<List<CompraDto>> ObtenerPorTdcIdAsync(int tdcId);
    }

    public interface IDetalleDeApartadoBl : IBaseBl<DetalleDeApartadoDtoIn, DetalleDeApartadoDto>
    {
        Task<DetalleDeApartadoDto> ObtenerAsync(string idGuid);
        Task<int> RetirarAsync(DetalleDeApartadoDtoIn detalleDeApartado);
    }

    public interface IBaseBl<T, U> where T : class
    {
        Task<IdDto> AgregarAsync(T item);
        Task BorrarAsync(int id);
        Task<U> ObtenerAsync(int id);
        Task ActualizarAsync(T item, int id);
    }

    public interface IGastoBl : IBaseBl<GastoDtoIn, GastoDto>
    {
        Task<GastoDto> ObtenerAsync(string idGuid);
        Task<List<GastoDto>> ObtenerPorPeriodoIdAsync(int periodoId);
    }

    public interface IApartadoBl : IBaseBl<ApartadoDtoIn, ApartadoDto>
    {
        Task ActualizarAsync(string idGuid, ApartadoDtoUpdate apartado);
        Task BorrarAsync(string idGuid);
        Task<List<ApartadoDto>> ObtenerApartadosPorSubcategoriaId(int subcategoriaId);
        Task<List<ApartadoDto>> ObtenerAsync();
        Task<ApartadoDto> ObtenerAsync(string id);
    }

    public interface IPeriodoBl
    {
        Task ActualizarAsync(PeriodoDtoUpdate item, string idGuid);

        Task<IdDto> AgregarAsync(PeriodoDtoIn item);

        Task BorrarAsync(string idGuid);

        Task<List<PeriodoDto>> ObtenerAsync();

        Task<PeriodoConDetallesDto> ObtenerPeriodoConDetallesAsync(string periodId);

        Task<PeriodoDto> ObtenerAsync(string guid);
        bool Existe(Guid guid);
    }

    public interface ITipoDeApartadoBl
    {
        Task<List<TipoDeApartadoDto>> ObtenerAsync();
    }

    public interface ICategoriaBl
    {
        bool Existe(int id);
        Task<List<CategoriaDto>> ObtenerAsync();
    }

    public interface ISubcategoriaBl //: IBaseBl<SubcategoriaDtoIn, SubcategoriaDto>
    {
        Task ActualizarAsync(SubcategoriaDtoUpdate subcategoria, string idGuid);
        Task<IdDto> AgregarAsync(SubcategoriaDtoIn subcategoria);
        Task BorrarAsync(string idGuid);
        bool Existe(Guid guid);
        Task<List<SubcategoriaDto>> ObtenerAsync();
        Task<SubcategoriaDto> ObtenerAsync(string idGuid);
        Task<List<SubcategoriaDto>> ObtenerPorCategoriaIdAsync(int categoriaId);
    }

    public interface IDestinoBl
    {
        Task<List<DestinoDto>> ObtenerAsync();
    }
}