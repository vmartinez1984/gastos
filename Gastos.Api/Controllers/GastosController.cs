using Gastos.Core.Dtos;
using Gastos.Core.Interfaces.IBusinessLayer;
using Microsoft.AspNetCore.Mvc;

namespace Gastos.Api.Controllers
{

    public class GastosController : ControllerBaseGastos
    {
        public GastosController(IBl bl) : base(bl)
        {
        }

        [HttpPost]
        public async Task<IActionResult> Post([FromBody] GastoDtoIn gasto)
        {
            int id;
            
            id = await _unitOfWork.Gasto.AgregarAsync(gasto);

            return Created($"Gastos/{id}", new { Id = id });
        }

        [HttpGet]
        public async Task<IActionResult> Get(int id)
        {
            return Ok(await _unitOfWork.Gasto.ObtenerAsync(id));
        }
    }
}
