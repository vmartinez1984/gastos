using Gastos.Backup.Core.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace Gastos.Backup.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ApartadosController : ControllerBase
    {
        private readonly IBl _bl;

        public ApartadosController(IBl bl)
        {
            _bl = bl;
        }

        [HttpGet]
        public async Task<IActionResult> Sincronizar()
        {
            await _bl.Apartado.SincronizarAsync();

            return Ok();
        }
    }
}
