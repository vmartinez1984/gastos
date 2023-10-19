using Gastos.Core.Dtos;
using Gastos.Core.Interfaces.IBusinessLayer;
using Microsoft.AspNetCore.Mvc;

namespace Gastos.Mvc.Controllers
{
    public class VersionDePresupuestosController : ControllerGastos
    {
        public VersionDePresupuestosController(IBl bl) : base(bl)
        {
        }

        // GET: VersionDePresupuestosController
        public async Task<ActionResult> Index()
        {
            List<VersionDelPresupuestoDto> lista;

            lista = await _unitOfWork.VersionDelPresupuesto.ObtenerTodosAsync();

            return View(lista);
        }

        // GET: VersionDePresupuestosController/Details/5
        public async Task<ActionResult> Details(int id)
        {
            List<SubcategoriaDto> subcategorias;

            subcategorias = await _unitOfWork.Subcategoria.ObtenerTodosPorVersionAsync(id);

            return View(subcategorias);
        }

        // GET: VersionDePresupuestosController/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: VersionDePresupuestosController/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create(VersionDelPresupuestoDtoIn versionDelPresupuesto)
        {
            try
            {
                await _unitOfWork.VersionDelPresupuesto.AgregarAsync(versionDelPresupuesto);

                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }

        // GET: VersionDePresupuestosController/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: VersionDePresupuestosController/Edit/5
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

        // GET: VersionDePresupuestosController/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: VersionDePresupuestosController/Delete/5
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
