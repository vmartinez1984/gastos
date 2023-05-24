using Gastos.Core.Dtos;
using Gastos.Core.Interfaces.IBusinessLayer;
using Gastos.Core.Validators;
using Microsoft.AspNetCore.Mvc;
using System.ComponentModel.DataAnnotations;

namespace Gastos.Api.Controllers
{
    [Route("api/[controller]")]
    public class ApartadosController : ControllerBaseGastos
    {
        public ApartadosController(IBl bl) : base(bl)
        {
        }

        /// <summary>
        /// Agregar un apartado
        /// </summary>
        /// <param name="item"></param>
        /// <response code="200">Perido previamente registrado</response>
        /// <response code="201">Perido registrado</response>        
        [HttpPost]
        [ProducesResponseType(typeof(IdDto), StatusCodes.Status200OK)]
        [ProducesResponseType(typeof(IdDto), StatusCodes.Status201Created)]
        [Produces("application/json")]
        public async Task<IActionResult> Post([FromBody] ApartadoDtoIn item)
        {
            IdDto id;
            ApartadoDto apartado;

            apartado = await _unitOfWork.Apartado.ObtenerAsync(item.Guid.ToString());
            if (apartado is null)
            {
                if (ModelState.IsValid)
                {

                    id = await _unitOfWork.Apartado.AgregarAsync(item);

                    return Created($"Apartados/{id.Id}", id);
                }
                else
                    return BadRequest(ModelState);
            }
            else
            {
                id = new IdDto
                {
                    Guid = apartado.Guid,
                    Id = apartado.Id
                };

                return Ok(id);
            }
        }

        /// <summary>
        /// Obtiene la lista de apartados
        /// </summary>
        /// <response code="200">Lista de apartados</response>
        [HttpGet]
        [ProducesResponseType(typeof(List<ApartadoDto>), StatusCodes.Status200OK)]
        [Produces("application/json")]
        public async Task<IActionResult> Get()
        {
            List<ApartadoDto> apartados;

            apartados = await _unitOfWork.Apartado.ObtenerAsync();

            return Ok(apartados);
        }

        /// <summary>
        /// Obtiene apartado por id o guid
        /// </summary>
        /// <param name="id">Id o Guid</param>
        /// <returns></returns>        
        /// <response code="200">Apartado</response>  
        [HttpGet("{id}")]
        [ProducesResponseType(typeof(ApartadoDto), StatusCodes.Status200OK)]
        [Produces("application/json")]
        public async Task<IActionResult> Get(string id)
        {
            ApartadoDto apartado;

            apartado = await _unitOfWork.Apartado.ObtenerAsync(id);

            return Ok(apartado);
        }

        /// <summary>
        /// Actualiza apartado
        /// </summary>
        /// <param name="idGuid">Id o Guid</param>
        /// <param name="apartado">Datos a actualizar</param>
        /// <returns></returns>        
        [HttpPut("{idGuid}")]
        public async Task<IActionResult> put([MaxLength(36)][ApartadoIdGuidValidar] string idGuid, [FromBody] ApartadoDtoUpdate apartado)
        {
            if (!ModelState.IsValid)
                return BadRequest(ModelState);

            ApartadoDto apartadoDto;

            apartadoDto = await _unitOfWork.Apartado.ObtenerAsync(idGuid);
            if (apartadoDto == null)
            {
                return NotFound(new { Mensaje = "Elemento no encontrado" });
            }
            await _unitOfWork.Apartado.ActualizarAsync(idGuid, apartado);

            return Accepted(new { Mensaje = "Elemento actualizado" });

        }

      

        /// <summary>
        /// Borrar apartado
        /// </summary>
        /// <param name="idGuid">Id o Guid</param>        
        /// <response code="202">Elemento borrado</response> 
        /// <response code="404">Elemento no encontrado</response> 
        [HttpDelete("{idGuid}")]
        public async Task<IActionResult> Delete(string idGuid)
        {
            ApartadoDto apartadoDto;

            apartadoDto = await _unitOfWork.Apartado.ObtenerAsync(idGuid);
            if (apartadoDto == null)
            {
                return NotFound(new { Mensaje = "Elemento no encontrado" });
            }
            await _unitOfWork.Apartado.BorrarAsync(idGuid);

            return Accepted(new { Mensaje = "Elemento borrado" });
        }
    }
}
