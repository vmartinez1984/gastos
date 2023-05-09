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


            var id = await _unitOfWork.Gasto.AgregarAsync(gasto);

            return Created($"Gastos/{id}", id);
        }

        [HttpGet]
        public async Task<IActionResult> Get(int id)
        {
            return Ok(await _unitOfWork.Gasto.ObtenerAsync(id));
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> Put([FromBody] GastoDtoUpdate gasto, int id)
        {
            if (await _unitOfWork.Gasto.ObtenerAsync(id) == null)
                return NotFound(new { Message = "Elemento no encontrado" });

            await _unitOfWork.Gasto.ActualizarAsync(new GastoDtoIn
            {
                Cantidad = gasto.Cantidad,
                Nombre = gasto.Nombre,
                PeriodoId = gasto.PeriodoId,
                SubcategoriaId = gasto.SubcategoriaId,

            }, id);

            return Accepted();
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            if (await _unitOfWork.Gasto.ObtenerAsync(id) == null)
                return NotFound(new { Message = "Elemento no encontrado" });

            await _unitOfWork.Gasto.BorrarAsync(id);

            return Accepted();
        }
    }
}
