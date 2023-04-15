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

        [HttpPut("{id}")]
        public async Task<IActionResult> Put([FromBody] GastoDtoIn gasto, int id)
        {
            if (await _unitOfWork.Gasto.ObtenerAsync(id) == null)
                return NotFound(new { Message = "Elemento no encontrado" });

            await _unitOfWork.Gasto.ActualizarAsync(gasto, id); 

            return Accepted();
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            if(await _unitOfWork.Gasto.ObtenerAsync(id) == null)
                return NotFound(new { Message = "Elemento no encontrado" });

            await _unitOfWork.Gasto.BorrarAsync(id);

            return Accepted();
        }
    }
}
