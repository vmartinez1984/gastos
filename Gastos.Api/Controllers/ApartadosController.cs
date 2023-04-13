using Gastos.Core.Dtos;
using Gastos.Core.Interfaces.IBusinessLayer;
using Microsoft.AspNetCore.Mvc;

namespace Gastos.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ApartadosController : ControllerBaseGastos
    {
        public ApartadosController(IBl bl) : base(bl)
        {
        }

        [HttpPost]
        public async Task<IActionResult> Post([FromBody] ApartadoDtoIn item)
        {
            int id;

            id = await _unitOfWork.Apartado.AgregarAsync(item);

            return Created($"Apartados/{id}", new { Id = id });
        }

        [HttpGet]
        public async Task<IActionResult> Get()
        {
            List<ApartadoDto> apartados;

            apartados = await _unitOfWork.Apartado.ObtenerAsync();

            return Ok(apartados);
        }

        [HttpPost("Detalles")]
        public async Task<IActionResult> AgregarIncrementoAsync([FromBody] DetalleDeApartadoDtoIn detalleDeApartado)
        {
            int id;

            id = await _unitOfWork.DetalleDeApartado.AgregarAsync(detalleDeApartado);

            return Created("", new { Id = id });
        }
    }
}
