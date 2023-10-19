using Gastos.Core.Dtos;
using Gastos.Core.Interfaces.IBusinessLayer;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Gastos.Api.Controllers
{
    /// <summary>
    /// 
    /// </summary>
    [Route("api/[controller]")]
    [ApiController]
    public class PresupuestosController : ControllerBaseGastos
    {
        /// <summary>
        /// 
        /// </summary>
        /// <param name="bl"></param>
        public PresupuestosController(IBl bl) : base(bl)
        {
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="versionDelPresupuestoId"></param>
        /// <returns></returns>
        [HttpGet("VersionDelPresupuesto/{versionDelPresupuestoId}")]
        public async Task<IActionResult> ObtenerTodosPorVersionId(int versionDelPresupuestoId)
        {
            List<PresupuestoDto> lista;

            lista = await _unitOfWork.Presupuesto.ObtenerTodosPorVersionId(versionDelPresupuestoId);

            return Ok(lista);
        }

        /// <summary>
        /// Agregar presupuesto
        /// </summary>
        /// <param name="presupuesto"></param>
        /// <returns></returns>
        [HttpPost]
        public async Task<IActionResult> AgregarAsync(PresupuestoDtoIn presupuesto)
        {
            int id;

            id = await _unitOfWork.Presupuesto.AgregarAsync(presupuesto);

            return Created("", new { Id = id });
        }

        /// <summary>
        /// Obtener por presupuesto id
        /// </summary>
        /// <param name="presupuestoId"></param>
        /// <returns></returns>
        [HttpGet("{presupuestoId}")]
        public async Task<IActionResult> ObtenerPorId(int presupuestoId)
        {
            PresupuestoDto presupuesto;

            presupuesto = await _unitOfWork.Presupuesto.ObtenerPorIdAsync(presupuestoId);

            return Ok(presupuesto);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="presupuestoId"></param>
        /// <param name="presupuesto"></param>
        /// <returns></returns>
        [HttpPut("{presupuestoId}")]
        public async Task<IActionResult> ActualizarAsync(int presupuestoId, PresupuestoDtoIn presupuesto)
        {           
            await _unitOfWork.Presupuesto.ActualizarAsync(presupuestoId, presupuesto);

            return Accepted();
        }
    }
}
