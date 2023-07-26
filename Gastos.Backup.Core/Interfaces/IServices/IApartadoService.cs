using Gastos.Core.Dtos;

namespace Gastos.Backup.Core.Interfaces.IServices
{
    public interface IGastosService
    {
        public IApartadoService Apartado { get; set; }
    }

    public interface IApartadoService
    {
        Task<List<ApartadoDto>> ObtenerTodos();
    }
}
