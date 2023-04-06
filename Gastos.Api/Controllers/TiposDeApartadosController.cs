using Gastos.Core.Interfaces.IBusinessLayer;
using Microsoft.AspNetCore.Mvc;

namespace Gastos.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class TiposDeApartadosController : ControllerBaseGastos
    {
        public TiposDeApartadosController(IBl bl) : base(bl)
        {
        }

        [HttpGet]
        public async Task<IActionResult> Get()
        {
            return Ok(await _unitOfWork.TipoDeApartado.ObtenerAsync());
        }
    }
}
