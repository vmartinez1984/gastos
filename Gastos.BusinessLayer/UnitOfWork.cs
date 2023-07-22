using Gastos.Core.Interfaces.IBusinessLayer;

namespace Gastos.BusinessLayer
{
    public class UnitOfWork : IBl
    {
        public UnitOfWork(
            IPeriodoBl periodoBl,
            IApartadoBl apartadoBl,
            ITipoDeApartadoBl tipoDeApartadoBl,
            IDestinoBl destinoBl,
            IGastoBl gastoBl,
            ISubcategoriaBl subcategoriaBl,
            ICategoriaBl categoriaBl,
            IDetalleDeApartadoBl detalleDeApartadoBl,
            ICompraBl compraBl,
            IPagoBl pagoBl
        )
        {
            Periodo = periodoBl;
            Apartado = apartadoBl;
            TipoDeApartado = tipoDeApartadoBl;
            Destino = destinoBl;
            Gasto = gastoBl;
            Subcategoria = subcategoriaBl;
            Categoria = categoriaBl;
            DetalleDeApartado = detalleDeApartadoBl;
            Compra = compraBl;
            Pago = pagoBl;
        }
        public IPeriodoBl Periodo { get; }

        public IApartadoBl Apartado { get; }

        public ITipoDeApartadoBl TipoDeApartado { get; }
        public IDestinoBl Destino { get; }
        public IGastoBl Gasto { get; }
        public ISubcategoriaBl Subcategoria { get; }
        public ICategoriaBl Categoria { get; }

        public IDetalleDeApartadoBl DetalleDeApartado { get; }
        public ICompraBl Compra { get; }

        public IPagoBl Pago { get; }
    }
}