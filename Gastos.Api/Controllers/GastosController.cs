using Gastos.Core.Dtos;
using Gastos.Core.Interfaces.IBusinessLayer;
using Microsoft.AspNetCore.Mvc;
using System.ComponentModel.DataAnnotations;

namespace Gastos.Api.Controllers
{
    /// <summary>
    /// 
    /// </summary>
    [Route("api/[controller]")]
    public class GastosController : ControllerBaseGastos
    {
        /// <summary>
        /// 
        /// </summary>
        /// <param name="bl"></param>
        public GastosController(IBl bl) : base(bl)
        {
        }

        /// <summary>
        /// Agregar Gasto
        /// </summary>
        /// <param name="gasto"></param>
        /// <response code="200">Gasto previamente registrado</response>
        /// <response code="201">Gasto registrado</response>        
        [HttpPost]
        [ProducesResponseType(typeof(IdDto), StatusCodes.Status200OK)]
        [ProducesResponseType(typeof(IdDto), StatusCodes.Status201Created)]
        [Produces("application/json")]
        public async Task<IActionResult> Post([FromBody] GastoDtoIn gasto)
        {
            IdDto idDto;
            GastoDto gastoDto;

            gastoDto = await _unitOfWork.Gasto.ObtenerAsync(gasto.Guid.ToString());
            if (gastoDto == null)
            {
                if (ModelState.IsValid)
                {
                    idDto = await _unitOfWork.Gasto.AgregarAsync(gasto);
                    return Created($"Gastos/{idDto.Id}", idDto);
                }
                else
                {
                    return BadRequest(ModelState);
                }
            }
            else
            {
                idDto = new IdDto
                {
                    Guid = gastoDto.IdemPotency,
                    Id = gastoDto.Id
                };

                return Ok(idDto);
            }

        }

        ///// <summary>
        ///// Lista de gastos por periodo id o guid
        ///// </summary>
        ///// <param name="idGuid"></param>
        ///// <response code="200">Lista de gastos por periodo</response>
        //[HttpGet("Periodos/{idGuid}")]
        //[ProducesResponseType(typeof(List<GastoDto>), StatusCodes.Status200OK)]
        //[Produces("application/json")]
        //public async Task<IActionResult> ObtenerListaDeGastosPorPeriodId(string idGuid)
        //{
        //    PeriodoDto periodoDto;

        //    periodoDto = await _unitOfWork.Periodo.ObtenerAsync(idGuid);
        //    if (periodoDto == null)
        //        return NotFound(new { Mensaje = "Periodo no encontrado" });
        //    return Ok(await _unitOfWork.Gasto.ObtenerPorPeriodoIdAsync(periodoDto.Id));
        //}

        /// <summary>
        /// Lista de gastos por periodo id o guid
        /// </summary>
        /// <param name="idGuid"></param>
        /// <response code="200">Lista de gastos por periodo y subcategoria</response>
        [HttpGet("Periodos/{idGuid}")]
        [ProducesResponseType(typeof(List<GastoDto>), StatusCodes.Status200OK)]
        [Produces("application/json")]
        public async Task<IActionResult> ObtenerListaDeGastosPorPeriodId(string idGuid)
        {
            PeriodoDto periodoDto;

            periodoDto = await _unitOfWork.Periodo.ObtenerAsync(idGuid);
            if (periodoDto == null)
                return NotFound(new { Mensaje = "Periodo no encontrado" });
            return Ok(await _unitOfWork.Gasto.ObtenerListaDeGastosYSubcategorias(idGuid));
        }

        //[HttpGet]
        //public async Task<IActionResult> Get(int id)
        //{
        //    return Ok(await _unitOfWork.Gasto.ObtenerAsync(id));
        //}

        /// <summary>
        /// 
        /// </summary>
        /// <param name="gasto">Gasto a actualizar</param>
        /// <param name="idGuid">Id o Guid</param>
        /// <response code="202">Elemento actualizado</response>
        [HttpPut("{idGuid}")]
        public async Task<IActionResult> Put([FromBody] GastoDtoUpdate gasto, [Required] string idGuid)
        {
            GastoDto gastoDto;

            gastoDto = await _unitOfWork.Gasto.ObtenerAsync(idGuid);
            if (gastoDto == null)
                return NotFound(new { Message = "Elemento no encontrado" });

            if (ModelState.IsValid)
            {

                await _unitOfWork.Gasto.ActualizarAsync(new GastoDtoIn
                {
                    Cantidad = gasto.Cantidad,
                    Nombre = gasto.Nombre,
                    PeriodoGuidId = gasto.PeriodoGuidId,
                    SubcategoriaGuidId = gasto.SubcategoriaGuidId,

                }, gastoDto.Id);

                return Accepted(new { Mensaje = "Elemento actualizado" });
            }
            else
            {
                return BadRequest(ModelState);
            }
        }

        /// <summary>
        /// Borra un pago por el id o guid
        /// </summary>
        /// <param name="idGuid">id o Guid</param>   
        /// <response code="202">Elemento borrado</response>
        [HttpDelete("{idGuid}")]
        public async Task<IActionResult> Delete(string idGuid)
        {
            GastoDto gastoDto;

            gastoDto = await _unitOfWork.Gasto.ObtenerAsync(idGuid);
            if (await _unitOfWork.Gasto.ObtenerAsync(idGuid) == null)
                return NotFound(new { Message = "Elemento no encontrado" });

            await _unitOfWork.Gasto.BorrarAsync(gastoDto.Id);

            return Accepted(new { Mensaje = "Elemento borrado" });
        }
    }
}
