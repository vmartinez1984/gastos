using Gastos.Core.Dtos;
using Gastos.Core.Interfaces.IBusinessLayer;
using Microsoft.AspNetCore.Mvc;

namespace Gastos.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ApartadosController : ControllerBaseGastos
    {
        public ApartadosController(IBl bl) : base(bl)
        {
        }

        [HttpPost]
        public async Task<IActionResult> Post(ApartadoDtoIn item)
        {
            int id;

            id = await _unitOfWork.Apartado.AgregarAsync(item);

            return Created($"Apartados/{id}", new { Id = id });
        }
    }
}
