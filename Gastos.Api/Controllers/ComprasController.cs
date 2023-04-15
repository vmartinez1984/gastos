using Gastos.BusinessLayer.Bl;
using Gastos.Core.Dtos;
using Gastos.Core.Interfaces.IBusinessLayer;
using Microsoft.AspNetCore.Mvc;

namespace Gastos.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ComprasController : ControllerBaseGastos
    {
        public ComprasController(IBl bl) : base(bl)
        {
        }

        [HttpGet]
        public async Task<IActionResult> Get()
        {
            List<CompraDto> lista;

            lista = await _unitOfWork.Compra.ObtenerPorTdcIdAsync(1);

            return Ok(lista);
        }

        [HttpPost]
        public async Task<IActionResult> Post([FromBody] CompraDtoIn compra)
        {
            int id;

            id = await _unitOfWork.Compra.AgregarAsync(compra);

            return Created($"Compras/{id}", new { Id = id });
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> Put([FromBody] CompraDtoIn compra, int id)
        {
            if (await _unitOfWork.Compra.ObtenerAsync(id) == null)
                return NotFound(new { Message = "Elemento no encontrado" });
            await _unitOfWork.Compra.ActualizarAsync(compra, id);

            return Accepted();
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            if (await _unitOfWork.Compra.ObtenerAsync(id) == null)
                return NotFound(new { Message = "Elemento no encontrado" });
            await _unitOfWork.Compra.BorrarAsync(id);

            return Accepted();
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> Get(int id)
        {
            CompraDto compra;

            compra = await _unitOfWork.Compra.ObtenerAsync(id);
            if (compra == null)
                return NotFound(new { Message = "Elemento no encontrado" });

            return Ok(compra);
        }
    }
}
