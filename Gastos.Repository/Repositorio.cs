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
            IDetalleDeApartadoRepository detalleDeApartadoRepository,
            ICompraRepository compraRepository,
            IPagoRepository pagoRepository
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
            Compra = compraRepository;
            Pago = pagoRepository;
        }

        public IPeriodoRepository Periodo { get;}

        public IGastoRepository Gasto { get; }

        public IApartadoRepository Apartado { get; }

        public ITipoDeApartadoRepository TipoDeApartado { get; }
        public IDestinoRepository Destino { get; }
        public ICategoriaRepository Categoria { get; }
        public ISubcategoriaRepository Subcategoria { get; }

        public IDetalleDeApartadoRepository DetalleDeApartado { get; }
        public ICompraRepository Compra { get; }

        public IPagoRepository Pago { get; }
    }
}
