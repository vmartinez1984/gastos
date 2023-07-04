using Gastos.Core.Dtos;
using Gastos.Core.Interfaces.IBusinessLayer;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace Gastos.Mvc.Controllers
{
    public class SubcategoriasController : ControllerGastos
    {
        public SubcategoriasController(IBl bl) : base(bl)
        {
        }

        // GET: SubcategoriasController
        public async Task<ActionResult> Index()
        {
            List<SubcategoriaDto> lista;

            lista = await _unitOfWork.Subcategoria.ObtenerAsync();

            return View(lista);
        }

        // GET: SubcategoriasController/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: SubcategoriasController/Create
        public async Task<ActionResult> Create()
        {
            ViewBag.Categorias = new SelectList(await _unitOfWork.Categoria.ObtenerAsync(), "Id", "Nombre");
            return View();
        }

        // POST: SubcategoriasController/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create(SubcategoriaDtoIn subcategoria)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    await _unitOfWork.Subcategoria.AgregarAsync(subcategoria);
                    return RedirectToAction(nameof(Index));
                }
                else
                {
                    ViewBag.Categorias = new SelectList(await _unitOfWork.Categoria.ObtenerAsync(), "Id", "Nombre");

                    return View(subcategoria);
                }
            }
            catch
            {
                return View(subcategoria);
            }
        }

        // GET: SubcategoriasController/Edit/5
        public async Task<ActionResult> Edit(int id)
        {
            SubcategoriaDto subcategoria;

            subcategoria = await _unitOfWork.Subcategoria.ObtenerAsync(id.ToString());
            ViewBag.Categorias = new SelectList(await _unitOfWork.Categoria.ObtenerAsync(), "Id", "Nombre");
            ViewBag.Id = id;

            return View(new SubcategoriaDtoIn
            {
                Cantidad = subcategoria.Cantidad,
                CategoriaId = subcategoria.Categoria.Id,
                Guid = subcategoria.Guid,
                Nombre = subcategoria.Nombre
            });
        }

        // POST: SubcategoriasController/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit(int id, SubcategoriaDtoUpdate subcategoria)
        {
            try
            {
                if (ModelState.IsValid)
                {

                    await _unitOfWork.Subcategoria.ActualizarAsync(subcategoria, id.ToString());
                    return RedirectToAction(nameof(Index));
                }
                else
                {
                    SubcategoriaDto subcategoria1;

                    subcategoria1 = await _unitOfWork.Subcategoria.ObtenerAsync(id.ToString());
                    ViewBag.Categorias = new SelectList(await _unitOfWork.Categoria.ObtenerAsync(), "Id", "Nombre");

                    return View(new SubcategoriaDtoIn
                    {
                        Cantidad = subcategoria.Cantidad,
                        CategoriaId = subcategoria.CategoriaId,
                        Guid = subcategoria1.Guid,                        
                        Nombre = subcategoria.Nombre                        
                    });
                }

            }
            catch
            {
                return View();
            }
        }

        // GET: SubcategoriasController/Delete/5
        public async Task<ActionResult> Delete(int id)
        {
            SubcategoriaDto subcategoria;

            subcategoria = await _unitOfWork.Subcategoria.ObtenerAsync(id.ToString());

            return View(subcategoria);
        }

        // POST: SubcategoriasController/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Delete(int id, SubcategoriaDtoIn collection)
        {
            try
            {
                await _unitOfWork.Subcategoria.BorrarAsync(id.ToString());
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }
    }
}
