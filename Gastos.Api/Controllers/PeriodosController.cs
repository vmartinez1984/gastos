using Gastos.Core.Dtos;
using Gastos.Core.Interfaces.IBusinessLayer;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Gastos.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PeriodosController : ControllerBaseGastos
    {
        public PeriodosController(IBl bl) : base(bl)
        {
        }

        // GET: api/<PeriodosController>
        [HttpGet]
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

        [HttpGet("{periodoId}")]
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

        [HttpPut("{periodoId}")]
        public async Task<IActionResult> ActualizarAsync(string periodoId, [FromBody] PeriodoDtoUpdate item)
        {
            await _unitOfWork.Periodo.ActualizarAsync(item, periodoId);

            return Accepted(new { Mensaje = "Datos Actualizados" });
        }

        // POST api/<PeriodosController>
        [HttpPost]
        public async Task<IActionResult> Post([FromBody] PeriodoDtoIn item)
        {
            IdDto idDto;
            PeriodoDto periodoDto;

            periodoDto = await _unitOfWork.Periodo.ObtenerAsync(item.Guid.ToString());
            if (periodoDto == null)
            {
                idDto = await _unitOfWork.Periodo.AgregarAsync(item);

                return Created($"Periodos/{idDto.Id}", idDto);
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
