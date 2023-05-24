using Gastos.Core.Dtos;
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

        /// <summary>
        /// Obtiene la lista de apartados
        /// </summary>        
        /// <response code="200">Lista de apartados</response>
        [HttpGet]
        [ProducesResponseType(typeof(List<PeriodoDto>), StatusCodes.Status200OK)]
        [Produces("application/json")]
        public async Task<IActionResult> Get()
        {
            return Ok(await _unitOfWork.TipoDeApartado.ObtenerAsync());
        }
    }
}
