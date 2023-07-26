using Gastos.Backup.Core.Interfaces.IRepositories;

namespace Gastos.Backup.Repositories
{
    public class Repositorio: IRepositorio
    {
        public Repositorio(
            IApartadoRepository apartadoRepository
            //,IPeriodoRepository periodoRepository,
            //IGastoRepository gastoRepository,
            //ITipoDeApartadoRepository tipoDeApartadoRepository,
            //ICategoriaRepository categoriaRepository,
            //ISubcategoriaRepository subcategoriaRepository,
            //IDetalleDeApartadoRepository detalleDeApartadoRepository,
            //ICompraRepository compraRepository,
            //IPagoRepository pagoRepository
        )
        {
            Apartado = apartadoRepository;
            //Periodo = periodoRepository;
            //Gasto = gastoRepository;
            //TipoDeApartado = tipoDeApartadoRepository;
            //Categoria = categoriaRepository;
            //Subcategoria = subcategoriaRepository;
            //DetalleDeApartado = detalleDeApartadoRepository;
            //Compra = compraRepository;
            //Pago = pagoRepository;
        }

        public IApartadoRepository Apartado { get; }

        public IPeriodoRepository Periodo { get; }

        public IGastoRepository Gasto { get; }

        public ITipoDeApartadoRepository TipoDeApartado { get; }

        public ICategoriaRepository Categoria { get; }
        public ISubcategoriaRepository Subcategoria { get; }

        public IDetalleDeApartadoRepository DetalleDeApartado { get; }
        public ICompraRepository Compra { get; }

        public IPagoRepository Pago { get; }
    }
}
