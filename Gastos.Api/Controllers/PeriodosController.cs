using Gastos.Core.Dtos;
using Gastos.Core.Interfaces.IBusinessLayer;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Gastos.Api.Controllers
{
    /// <summary>
    /// Periodos
    /// </summary>
    [Route("api/[controller]")]
    public class PeriodosController : ControllerBaseGastos
    {
        public PeriodosController(IBl bl) : base(bl)
        {
        }

        /// <summary>
        /// Obtiene la lista de los periodos
        /// </summary>
        /// <response code="200">Lista de periodos</response>
        [HttpGet]
        [ProducesResponseType(typeof(List<PeriodoDto>), StatusCodes.Status200OK)]
        [Produces("application/json")]
        public async Task<IActionResult> Get()
        {
            List<PeriodoDto> list;

            list = await _unitOfWork.Periodo.ObtenerAsync();

            return Ok(list.OrderByDescending(x => x.Id));
        }

        [HttpGet("{periodoId}/Gastos")]
        public async Task<IActionResult> ObtenerPorPeriodoConDetalleAsync(string periodoId)
        {
            PeriodoConDetallesDto periodo;

            periodo = await _unitOfWork.Periodo.ObtenerPeriodoConDetallesAsync(periodoId);

            return Ok(periodo);
        }

        /// <summary>
        /// Obtiene el periodo por el Id o Guid
        /// </summary>
        /// <param name="periodoId"></param>
        /// <response code="200">Perido previamente registrado</response>
        /// <response code="404">Perido no encontrado</response>        
        [HttpGet("{periodoId}")]
        [ProducesResponseType(typeof(PeriodoDto), StatusCodes.Status200OK)]
        [Produces("application/json")]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<IActionResult> ObtenerPorPeriodoIdAsync(string periodoId)
        {
            PeriodoDto periodo;

            periodo = await _unitOfWork.Periodo.ObtenerAsync(periodoId);
            if (periodo == null)
            {
                return NotFound(new { Mensaje = "No encontrado" });
            }

            return Ok(periodo);
        }

        /// <summary>
        /// Actualiza el periodo
        /// </summary>
        /// <param name="periodoId"></param>
        /// <param name="item"></param>
        [HttpPut("{periodoId}")]
        public async Task<IActionResult> ActualizarAsync(string periodoId, [FromBody] PeriodoDtoUpdate item)
        {
            await _unitOfWork.Periodo.ActualizarAsync(item, periodoId);

            return Accepted(new { Mensaje = "Datos Actualizados" });
        }

        /// <summary>
        /// Agregar periodo
        /// </summary>
        /// <response code="200">Perido previamente registrado</response>
        /// <response code="201">Perido registrado</response>        
        [HttpPost]
        [ProducesResponseType(typeof(IdDto), StatusCodes.Status200OK)]
        [ProducesResponseType(typeof(IdDto), StatusCodes.Status201Created)]
        [Produces("application/json")]
        public async Task<IActionResult> Post([FromBody] PeriodoDtoIn item)
        {
            IdDto idDto;
            PeriodoDto periodoDto;

            periodoDto = await _unitOfWork.Periodo.ObtenerAsync(item.Guid.ToString());
            if (periodoDto == null)
            {
                if (ModelState.IsValid)
                {
                    idDto = await _unitOfWork.Periodo.AgregarAsync(item);

                    return Created($"Periodos/{idDto.Id}", idDto);
                }
                else
                {
                    return BadRequest(ModelState);
                }
            }
            else
            {
                idDto = new IdDto
                {
                    Guid = periodoDto.Guid,
                    Id = periodoDto.Id
                };

                return Ok(idDto);
            }
        }

        /// <summary>
        /// Borrar periodo por el Id o Guid
        /// </summary>
        /// <param name="periodoId"></param>
        /// <returns></returns>
        [HttpDelete("{periodoId}")]
        public async Task<IActionResult> Delete(string periodoId)
        {
            PeriodoDto periodo;

            periodo = await _unitOfWork.Periodo.ObtenerAsync(periodoId);
            if (periodo == null)
                return NotFound(new { Mensaje = "No se encontro periodo" });

            await _unitOfWork.Periodo.BorrarAsync(periodoId);

            return Accepted();
        }
    }
}
