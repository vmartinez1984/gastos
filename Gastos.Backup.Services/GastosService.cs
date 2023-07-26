using Gastos.Backup.Core.Interfaces.IServices;

namespace Gastos.Backup.Services
{
    public class GastosService: IGastosService
    {
        public IApartadoService Apartado { get; set; }

        public GastosService(IApartadoService apartadoService)
        {
            Apartado = apartadoService;
        }
    }
}
