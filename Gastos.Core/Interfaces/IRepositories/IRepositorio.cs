using Gastos.Core.Entities;

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
    }

    public interface IDetalleDeApartadoRepository : IBaseRepositorio<DetalleDeApartadoEntity>
    {
        Task<decimal> ObtenerTotalAsync(int apartadoId);
    }

    public interface IDestinoRepository
    {
        Task<List<DestinoEntity>> ObtenerAsync();
    }
    
    public interface ITipoDeApartadoRepository
    {
        Task<List<TipoDeApartadoEntity>> ObtenerAsync();
    }

    public interface IApartadoRepository : IBaseRepositorio<ApartadoEntity>
    {
        Task<List<ApartadoEntity>> ObtenerApartadosPorSubcategoriaId(int subcategoriaId);
        Task<List<ApartadoEntity>> ObtenerAsync();
        Task<List<ApartadoEntity>> ObtenerPorPeriodoAsync(int periodoId);
        Task<decimal> ObtenerTotalPorSubcategoriaId(int subcategoriaId);
    }

    public interface ICategoriaRepository
    {
        Task<List<CategoriaEntity>> ObtenerAsync();

    }

    public interface ISubcategoriaRepository: IBaseRepositorio<SubcategoriaEntity>
    {
        Task<List<SubcategoriaEntity>> ObtenerAsync();
        Task<List<SubcategoriaEntity>> ObtenerPorCategoriaIdAsync(int categoriaId);        
    }

    public interface IGastoRepository: IBaseRepositorio<GastoEntity> 
    {     
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
        Task<List<PeriodoEntity>> ObtenerAsync();
    }
}
