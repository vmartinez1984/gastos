﻿using Gastos.Core.Dtos;

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

    public interface IDetalleDeApartadoBl : IBaseBl<DetalleDeApartadoDtoIn, DetalleDeApartadoDto> { }

    public interface IBaseBl<T, U> where T : class
    {
        Task<int> AgregarAsync(T item);
        Task BorrarAsync(int id);
        Task<U> ObtenerAsync(int id);
        Task ActualizarAsync(T item, int id);
    }

    public interface IGastoBl : IBaseBl<GastoDtoIn, GastoDto>
    {
        Task<List<GastoDto>> ObtenerPorPeriodoIdAsync(int periodoId);
    }

    public interface IApartadoBl : IBaseBl<ApartadoDtoIn, ApartadoDto>
    {
        Task<List<ApartadoDto>> ObtenerApartadosPorSubcategoriaId(int subcategoriaId);
        Task<List<ApartadoDto>> ObtenerAsync();
    }

    public interface IPeriodoBl
    {
        Task ActualizarAsync(PeriodoDtoIn item, int id);
        Task<int> AgregarAsync(PeriodoDtoIn item);
        Task BorrarAsync(int id);
        Task<List<PeriodoDto>> ObtenerAsync();
        Task<PeriodoConDetallesDto> ObtenerAsync(int periodId);        
    }

    public interface ITipoDeApartadoBl
    {
        Task<List<TipoDeApartadoDto>> ObtenerAsync();
    }

    public interface ICategoriaBl
    {
        Task<List<CategoriaDto>> ObtenerAsync();
    }

    public interface ISubcategoriaBl : IBaseBl<SubcategoriaDtoIn, SubcategoriaDto>
    {
        Task<List<SubcategoriaDto>> ObtenerAsync();
        Task<List<SubcategoriaDto>> ObtenerPorCategoriaIdAsync(int categoriaId);
    }

    public interface IDestinoBl
    {
        Task<List<DestinoDto>> ObtenerAsync();
    }
}