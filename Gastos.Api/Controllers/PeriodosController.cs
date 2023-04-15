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

            return Ok(list.OrderByDescending(x=> x.Id));
        }

        [HttpGet("{periodoId}/Gastos")]
        public async Task<IActionResult> ObtenerPorPeriodoIdAsync(int periodoId)
        {
            PeriodoConDetallesDto periodo;

            periodo = await _unitOfWork.Periodo.ObtenerAsync(periodoId);

            return Ok(periodo);
        }

        // POST api/<PeriodosController>
        [HttpPost]
        public async Task<IActionResult> Post([FromBody] PeriodoDtoIn item)
        {
            int id;

            id = await _unitOfWork.Periodo.AgregarAsync(item);

            return Created($"Periodos/{id}", new { Id = id });
        }       
    }
}
