using Gastos.Core.Dtos;
using Gastos.Core.Interfaces.IBusinessLayer;
using Microsoft.AspNetCore.Mvc;

namespace Gastos.Api.Controllers
{
    [Route("api/[controller]")]
    public class DetalleDeApartadosController : ControllerBaseGastos
    {
        public DetalleDeApartadosController(IBl bl) : base(bl)
        {
        }

        /// <summary>
        /// Agrega Detalle del apartado
        /// </summary>
        /// <param name="detalleDeApartado"></param>
        /// <response code="200">Perido previamente registrado</response>
        /// <response code="201">Perido registrado</response>        
        [HttpPost]
        [ProducesResponseType(typeof(IdDto), StatusCodes.Status200OK)]
        [ProducesResponseType(typeof(IdDto), StatusCodes.Status201Created)]
        [Produces("application/json")]
        public async Task<IActionResult> Post([FromBody] DetalleDeApartadoDtoIn detalleDeApartado)
        {
            DetalleDeApartadoDto detalleDeApartadoDto;
            IdDto id;

            detalleDeApartadoDto = await _unitOfWork.DetalleDeApartado.ObtenerAsync(detalleDeApartado.Guid.ToString());
            if (detalleDeApartadoDto == null)
            {
                if (ModelState.IsValid)
                {
                    id = await _unitOfWork.DetalleDeApartado.AgregarAsync(detalleDeApartado);

                    return Created("", id);
                }
                else
                {
                    return BadRequest(ModelState);
                }

            }
            else
            {
                return Ok(new IdDto { Guid = detalleDeApartadoDto.Guid, Id = detalleDeApartadoDto.Id });
            }

        }

        /// <summary>
        /// Actualiza el Detalle del apartado
        /// </summary>
        /// <param name="id"></param>
        /// <param name="detalleDeApartado"></param>        
        /// <response code="201">Perido registrado</response>        
        [HttpPut("{id}")]
        [Produces("application/json")]
        public async Task<IActionResult> Put(int id, [FromBody] DetalleDeApartadoDtoIn detalleDeApartado)
        {
            await _unitOfWork.DetalleDeApartado.ActualizarAsync(detalleDeApartado, id);

            return Accepted();
        }
    }
}
