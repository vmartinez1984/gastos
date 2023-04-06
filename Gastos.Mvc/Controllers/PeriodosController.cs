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

        // GET: PeriodosController/Details/5
        public async Task<ActionResult> Details(int id)
        {
            PeriodoCompletoDto periodo;
            PeriodoDto periodoDto;

            periodoDto = await _unitOfWork.Periodo.ObtenerAsync(id);
            periodo = new PeriodoCompletoDto
            {
                FechaFinal = periodoDto.FechaFinal,
                FechaInicial = periodoDto.FechaInicial,
                Id = id,
                Nombre = periodoDto.Nombre,
                ListaDeGastos = await _unitOfWork.Gasto.ObtenerPorPeriodoIdAsync(id)
            };

            return View(periodo);
        }

        // GET: PeriodosController/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: PeriodosController/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(IFormCollection collection)
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

        // GET: PeriodosController/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: PeriodosController/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(int id, IFormCollection collection)
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

        // GET: PeriodosController/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: PeriodosController/Delete/5
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
