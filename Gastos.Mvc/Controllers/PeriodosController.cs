using Gastos.Core.Dtos;
using Gastos.Core.Interfaces.IBusinessLayer;
using Microsoft.AspNetCore.Mvc;

namespace Gastos.Mvc.Controllers
{
    public class PeriodosController : ControllerGastos
    {
        public PeriodosController(IBl bl) : base(bl)
        {
        }


        // GET: PeriodosController
        public async Task<ActionResult> Index()
        {
            return View(await _unitOfWork.Periodo.ObtenerAsync());
        }

        // GET: PeriodosController/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: PeriodosController/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create(PeriodoDtoIn periodo)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    await _unitOfWork.Periodo.AgregarAsync(periodo);
                    return RedirectToAction(nameof(Index));
                }
                return View(periodo);
            }
            catch
            {
                return View();
            }
        }

        // GET: PeriodosController/Edit/5
        public async Task<ActionResult> Edit(int id)
        {
            PeriodoDto periodo;

            periodo = await _unitOfWork.Periodo.ObtenerAsync(id.ToString());

            return View(periodo);
        }

        // POST: PeriodosController/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit(int id, PeriodoDtoUpdate periodoDtoIn)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    await _unitOfWork.Periodo.ActualizarAsync(periodoDtoIn, id.ToString());
                    return RedirectToAction(nameof(Index));
                }
                return View(new PeriodoDto
                {
                    FechaFinal = periodoDtoIn.FechaFinal,
                    FechaInicial = periodoDtoIn.FechaInicial,
                    Id = id,
                    Nombre = periodoDtoIn.Nombre
                });
            }
            catch
            {
                return View();
            }
        }

        // GET: PeriodosController/Delete/5
        public async Task<ActionResult> Delete(int id)
        {
            PeriodoDto periodo;

            periodo = await _unitOfWork.Periodo.ObtenerAsync(id.ToString());

            return View(periodo);
        }

        // POST: PeriodosController/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Delete(int id, IFormCollection collection)
        {
            try
            {
                await _unitOfWork.Periodo.BorrarAsync(id.ToString());
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }
    }
}
