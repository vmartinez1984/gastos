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
            int id;

            id = await _unitOfWork.Subcategoria.AgregarAsync(subcategoria);

            return Created($"Subcategorias/{id}", new { Id = id });
        }
    }
}
