using Gastos.Core.Interfaces.IBusinessLayer;
using Microsoft.AspNetCore.Mvc;

namespace Gastos.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CategoriasController : ControllerBaseGastos
    {
        public CategoriasController(IBl bl) : base(bl)
        {
        }

        [HttpGet]
        public async Task<IActionResult> Get()
        {
            return Ok(await _unitOfWork.Categoria.ObtenerAsync());
        }

        [HttpGet("{categoriaId}/Subcategorias")]
        public async Task<IActionResult> ObtenerSubcategoriasPorCategoriaId(int categoriaId)
        {
            return Ok(await _unitOfWork.Subcategoria.ObtenerPorCategoriaIdAsync(categoriaId));
        }
    }
}
