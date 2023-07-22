using Gastos.Core.Dtos;
using Gastos.Core.Interfaces.IBusinessLayer;
using Microsoft.AspNetCore.Mvc;

namespace Gastos.Mvc.Controllers
{
    public class PagosController : GastosController
    {
        public PagosController(IBl bl) : base(bl)
        {
        }


        // GET: PagosController/Edit/5
        public async Task<ActionResult> Edit(int id)
        {
            PagoDto dto;

            dto = await _unitOfWork.Pago.ObtenerAsync(id);
            dto.FechaDeDeposito = DateTime.Now;

            return View(dto);
        }

        // POST: PagosController/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit(int id, PagoDtoIn collection)
        {
            try
            {
                await _unitOfWork.Pago.ActualizarAsync(collection, id);
                return RedirectToAction("Details", "Compras", new { Id = collection.CompraId });
            }
            catch
            {
                return View();
            }
        }
    }
}
