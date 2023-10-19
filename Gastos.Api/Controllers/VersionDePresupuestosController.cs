using Gastos.Core.Dtos;
using Gastos.Core.Interfaces.IBusinessLayer;
using Microsoft.AspNetCore.Mvc;

namespace Gastos.Api.Controllers
{
    /// <summary>
    /// 
    /// </summary>
    [Route("api/[controller]")]
    [ApiController]
    public class VersionDePresupuestosController : ControllerBaseGastos
    {
        /// <summary>
        /// 
        /// </summary>
        /// <param name="bl"></param>
        public VersionDePresupuestosController(IBl bl) : base(bl)
        {
        }

        [HttpGet]
        public  async Task<IActionResult> ObtenerTodos()
        {
            List<VersionDelPresupuestoDto> lista;

            lista = await _unitOfWork.VersionDelPresupuesto.ObtenerTodosAsync();

            return Ok(lista);
        }

        [HttpGet("{versionDelPresupuestoId}")]
        public async Task<IActionResult> ObtenerPorId(int versionDelPresupuestoId)
        {
            VersionDelPresupuestoDto item;

            item = await _unitOfWork.VersionDelPresupuesto.ObtenerPorIdAsync(versionDelPresupuestoId);

            return Ok(item);
        }

        /// <summary>
        /// Actualizar
        /// </summary>
        /// <param name="versionDelPresupuestoId"></param>
        /// <param name="versionDelPresupuesto"></param>
        /// <returns></returns>
        [HttpPut("{versionDelPresupuestoId}")]
        public async Task<IActionResult> Actualizar(int versionDelPresupuestoId, VersionDelPresupuestoDtoIn versionDelPresupuesto)
        {
            await _unitOfWork.VersionDelPresupuesto.ActualizarAsync(versionDelPresupuestoId, versionDelPresupuesto);

            return Accepted();
        }

        /// <summary>
        /// Agregar version de Presupuesto
        /// </summary>
        /// <param name="versionDelPresupuesto"></param>
        /// <returns></returns>
        [HttpPost]
        public async Task<IActionResult> Agregar(VersionDelPresupuestoDtoIn versionDelPresupuesto)
        {
            int id;

           id = await _unitOfWork.VersionDelPresupuesto.AgregarAsync(versionDelPresupuesto);

            return Created("", id);
        }
    }
}