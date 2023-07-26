using Gastos.Backup.Core.Interfaces;

namespace Gastos.Backup.BusinessLayer
{
    public class GastosBackupBl: IBl
    {
        public IApartadoBl Apartado { get; set; }

        public IPeriodoBl Periodo => throw new NotImplementedException();

        public ITipoDeApartadoBl TipoDeApartado => throw new NotImplementedException();

        public IDestinoBl Destino => throw new NotImplementedException();

        public IGastoBl Gasto => throw new NotImplementedException();

        public ISubcategoriaBl Subcategoria => throw new NotImplementedException();

        public ICategoriaBl Categoria => throw new NotImplementedException();

        public IDetalleDeApartadoBl DetalleDeApartado => throw new NotImplementedException();

        public ICompraBl Compra => throw new NotImplementedException();

        public IPagoBl Pago => throw new NotImplementedException();

        public GastosBackupBl(IApartadoBl apartadoBl)
        {
            Apartado = apartadoBl;
        }
    }
}
