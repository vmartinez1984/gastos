using Gastos.Core.Dtos;
using Gastos.Core.Interfaces.IBusinessLayer;
using Microsoft.AspNetCore.Mvc;

namespace Gastos.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SubcategoriasController : ControllerBaseGastos
    {
        public SubcategoriasController(IBl bl) : base(bl)
        {
        }

        [HttpGet]
        public async Task<IActionResult> Get()
        {
            return Ok(await _unitOfWork.Subcategoria.ObtenerAsync());
        }

        [HttpPost]
        public async Task<IActionResult> Post([FromBody] SubcategoriaDtoIn subcategoria)
        {
            IdDto id;

            id = await _unitOfWork.Subcategoria.AgregarAsync(subcategoria);

            return Created($"Subcategorias/{id}", id);
        }

        [HttpPut("{idGuid}")]
        public async Task<IActionResult> Put([FromBody] SubcategoriaDtoIn subcategoria, string idGuid)
        {
            await _unitOfWork.Subcategoria.ActualizarAsync(subcategoria, idGuid);

            return Accepted($"Subcategorias/{idGuid}", new { Id = idGuid });
        }

        [HttpGet("{subcategoriaId}/Apartados")]
        public async Task<IActionResult> ObtenerApartadosPorSubcategoriaId(int subcategoriaId)
        {
            List<ApartadoDto> lista;

            lista = await _unitOfWork.Apartado.ObtenerApartadosPorSubcategoriaId(subcategoriaId);

            return Ok(lista);
        }


        [HttpDelete("{idGuid}")]
        public async Task<IActionResult> Delete(string idGuid)
        {
            await _unitOfWork.Subcategoria.BorrarAsync(idGuid);

            return Accepted($"Subcategorias/{idGuid}", new { Id = idGuid });
        }
    }
}
