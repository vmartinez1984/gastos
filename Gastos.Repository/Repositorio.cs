using Gastos.Core.Interfaces.IRepositories;

namespace Gastos.Repositories
{
    public class Repositorio: IRepositorio
    {
        public Repositorio(
            IPeriodoRepository periodoRepository,
            IGastoRepository gastoRepository,
            IApartadoRepository apartadoRepository,
            ITipoDeApartadoRepository tipoDeApartadoRepository,
            IDestinoRepository destinoRepository,
            ICategoriaRepository categoriaRepository,
            ISubcategoriaRepository subcategoriaRepository,
            IDetalleDeApartadoRepository detalleDeApartadoRepository
        )
        {
            Periodo = periodoRepository;
            Gasto = gastoRepository;
            Apartado = apartadoRepository;
            TipoDeApartado = tipoDeApartadoRepository;
            Destino = destinoRepository;
            Categoria = categoriaRepository;
            Subcategoria = subcategoriaRepository;
            DetalleDeApartado = detalleDeApartadoRepository;
        }

        public IPeriodoRepository Periodo { get;}

        public IGastoRepository Gasto { get; }

        public IApartadoRepository Apartado { get; }

        public ITipoDeApartadoRepository TipoDeApartado { get; }
        public IDestinoRepository Destino { get; }
        public ICategoriaRepository Categoria { get; }
        public ISubcategoriaRepository Subcategoria { get; }

        public IDetalleDeApartadoRepository DetalleDeApartado { get; }
    }
}
