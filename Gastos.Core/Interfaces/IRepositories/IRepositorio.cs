using Gastos.Core.Entities;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Gastos.Core.Interfaces.IRepositories
{
    public interface IRepositorio
    {
        IPeriodoRepository Periodo { get; }

        IGastoRepository Gasto { get; }

        ISubcategoriaRepository Subcategoria { get; }   
        
        IApartadoRepository Apartado { get; }   
        
        ITipoDeApartadoRepository TipoDeApartado { get; }

        IDestinoRepository Destino { get; }

        ICategoriaRepository Categoria { get; }

        IDetalleDeApartadoRepository DetalleDeApartado { get; }

        ICompraRepository Compra { get; }
    }

    public interface ICompraRepository : IBaseRepositorio<CompraEntity>
    {
        Task<List<CompraEntity>> ObtenerPorTdcIdAsync(int tdcId);
    }

    public interface IDetalleDeApartadoRepository : IBaseRepositorio<DetalleDeApartadoEntity>
    {
        Task<DetalleDeApartadoEntity> ObtenerAsync(string idGuid);
        Task<List<DetalleDeApartadoEntity>> ObtenerPorApartadoIdAsync(int apartadoId);
        Task<decimal> ObtenerTotalAsync(int apartadoId);
    }

    public interface IDestinoRepository
    {
        Task<List<DestinoEntity>> ObtenerAsync();
    }
    
    public interface ITipoDeApartadoRepository
    {
        bool Existe(int id);
        Task<List<TipoDeApartadoEntity>> ObtenerAsync();
    }

    public interface IApartadoRepository : IBaseRepositorio<ApartadoEntity>
    {
        Task BorrarAsync(string idGuid);
        bool Existe(Guid guid);
        Task<List<ApartadoEntity>> ObtenerApartadosPorSubcategoriaId(int subcategoriaId);
        Task<List<ApartadoEntity>> ObtenerAsync();
        Task<ApartadoEntity> ObtenerAsync(Guid id);
        Task<ApartadoEntity> ObtenerAsync(string idGuid);
        Task<List<ApartadoEntity>> ObtenerPorPeriodoAsync(int periodoId);
        Task<decimal> ObtenerTotalPorSubcategoriaId(int subcategoriaId);
    }

    public interface ICategoriaRepository
    {
        bool Existe(int id);
        Task<List<CategoriaEntity>> ObtenerAsync();

    }

    public interface ISubcategoriaRepository//: IBaseRepositorio<SubcategoriaEntity>
    {
        Task<List<SubcategoriaEntity>> ObtenerAsync();        
        Task<SubcategoriaEntity> ObtenerAsync(string idGuid);
        Task BorrarAsync(string idGuid);
        Task<List<SubcategoriaEntity>> ObtenerPorCategoriaIdAsync(int categoriaId);
        Task ActualizarAsync(SubcategoriaEntity entity);
        Task<int> AgregarAsync(SubcategoriaEntity entity);
        bool Existe(Guid guid);
    }

    public interface IGastoRepository: IBaseRepositorio<GastoEntity> 
    {
        Task<GastoEntity> ObtenerAsync(string idGuid);
        Task<List<GastoEntity>> ObtenerPorPeriodoIdAsync(int periodoId);
        Task<GastoEntity> ObtenerPorSubcategoriaIdAsync(int subcategoriaId, int periodoId);
    }

    public interface IBaseRepositorio<T> where T : class
    {
        Task<T> ObtenerAsync(int id);

        //Task<List<T>> ObtenerTodos();

        Task ActualizarAsync(T entity);

        Task<int> AgregarAsync(T entity);

        Task BorrarAsync(int id);
    }


    public interface IPeriodoRepository: IBaseRepositorio<PeriodoEntity>
    {
        Task BorrarAsync(Guid guid);
        bool Existe(Guid guid);
        Task<List<PeriodoEntity>> ObtenerAsync();
        Task<PeriodoEntity> ObtenerAsync(Guid guid1);
        Task<PeriodoEntity> ObtenerAsync(string idGuid);
    }
}
