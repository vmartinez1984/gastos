using Gastos.Core.Dtos;
using Gastos.Core.Interfaces.IBusinessLayer;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace Gastos.Mvc.Controllers
{
    public class DetallesDeApartadosController : ControllerGastos
    {
        public DetallesDeApartadosController(IBl bl) : base(bl)
        {
        }

        // GET: DetallesDeApartadosController
        public async Task<ActionResult> Index(int apartadoId, int? periodoId = null)
        {
            ApartadoDto apartado;

            apartado = await _unitOfWork.Apartado.ObtenerAsync(apartadoId);
            ViewBag.PeriodoId = periodoId;

            return View(apartado);
        }

        // GET: DetallesDeApartadosController/Details/5
        public ActionResult Details()
        {
            return View();
        }

        // GET: DetallesDeApartadosController/Create
        public async Task<ActionResult> Create(int apartadoId, int periodoId = 0)
        {
            ApartadoDto apartado;

            apartado = await _unitOfWork.Apartado.ObtenerAsync(apartadoId);
            ViewBag.Subcategorias = new SelectList(await _unitOfWork.Subcategoria.ObtenerAsync(), "Id", "Nombre");
            ViewBag.Apartados = new SelectList(await _unitOfWork.Apartado.ObtenerAsync(), "Id", "Nombre");

            return View(new DetalleDeApartadoDtoIn
            {
                Guid = Guid.NewGuid(),
                ApartadoId = apartado.Id,
                ApartadoIdGuid = apartado.Id.ToString(),
                SubcategoriaId = apartado.Subcategoria.Id,
                SubcategoriaIdGuid = apartado.Subcategoria.Id.ToString(),
                PeriodoId = periodoId,
                PeriodoIdGuid = periodoId.ToString()
            });
        }

        // POST: DetallesDeApartadosController/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create(DetalleDeApartadoDtoIn detalle)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    await _unitOfWork.DetalleDeApartado.AgregarAsync(detalle);
                    if (detalle.PeriodoId == 0)
                        return RedirectToAction(nameof(Index), new { apartadoId = detalle.ApartadoId });
                    else
                        return RedirectToAction(nameof(Index), "Gastos", new { periodoId = detalle.PeriodoId });
                }
                else
                {
                    return View(detalle);
                }
            }
            catch
            {
                ViewBag.Subcategorias = new SelectList(await _unitOfWork.Subcategoria.ObtenerAsync(), "Id", "Nombre");
                ViewBag.Apartados = new SelectList(await _unitOfWork.Apartado.ObtenerAsync(), "Id", "Nombre");

                return View(detalle);
            }
        }

        // GET: DetallesDeApartadosController/Edit/5
        public async Task<ActionResult> Edit(int id)
        {
            DetalleDeApartadoDto detalles;

            detalles = await _unitOfWork.DetalleDeApartado.ObtenerAsync(id);

            return View(detalles);
        }

        // POST: DetallesDeApartadosController/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit(int id, DetalleDeApartadoDtoIn collection)
        {
            try
            {
                await _unitOfWork.DetalleDeApartado.ActualizarAsync(collection, id);
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }

        // GET: DetallesDeApartadosController/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: DetallesDeApartadosController/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Delete(int id, IFormCollection collection)
        {
            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }
    }
}
