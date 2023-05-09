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
            IdDto id;

            id = await _unitOfWork.Apartado.AgregarAsync(item);

            return Created($"Apartados/{id.Id}",  id );
        }

        [HttpGet]
        public async Task<IActionResult> Get()
        {
            List<ApartadoDto> apartados;

            apartados = await _unitOfWork.Apartado.ObtenerAsync();

            return Ok(apartados);
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> Get(string id)
        {
            ApartadoDto apartado;

            apartado = await _unitOfWork.Apartado.ObtenerAsync(id);

            return Ok(apartado);
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> put(int id, [FromBody] ApartadoDtoIn apartado)
        {
            await _unitOfWork.Apartado.ActualizarAsync(apartado, id);

            return Accepted(new { IsSuccess = true });
        }

        [HttpPost("Detalles")]
        public async Task<IActionResult> AgregarIncrementoAsync([FromBody] DetalleDeApartadoDtoIn detalleDeApartado)
        {
            IdDto id;

            id = await _unitOfWork.DetalleDeApartado.AgregarAsync(detalleDeApartado);
            //id = 10;

            return Created("", id);
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            await _unitOfWork.Apartado.BorrarAsync(id);

            return Accepted();
        }
    }
}
