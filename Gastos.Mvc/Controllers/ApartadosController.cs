using Gastos.Core.Dtos;
using Gastos.Core.Interfaces.IBusinessLayer;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace Gastos.Mvc.Controllers
{
    public class ApartadosController : ControllerGastos
    {
        public ApartadosController(IBl bl) : base(bl)
        {
        }

        // GET: ApartadosController
        public async Task<ActionResult> Index(int? subcategoriaId = null, int? periodoId = null)
        {
            List<ApartadoDto> lista;

            lista = await _unitOfWork.Apartado.ObtenerAsync();
            if(subcategoriaId != null)
            {
                lista = lista.Where(x => x.Subcategoria.Id == subcategoriaId).ToList();
                ViewBag.PeriodoId = periodoId;
            }

            return View(lista);
        }

        // GET: ApartadosController/Details/5
        public async Task<ActionResult> Details(int id)
        {
            ApartadoDto apartado;

            apartado = await _unitOfWork.Apartado.ObtenerAsync(id);

            return View(apartado);
        }

        // GET: ApartadosController/Create
        public async Task<ActionResult> Create()
        {
            ViewBag.TipoDeApartados = new SelectList(await _unitOfWork.TipoDeApartado.ObtenerAsync(), "Id", "Nombre");
            ViewBag.Subcategorias = new SelectList(await _unitOfWork.Subcategoria.ObtenerAsync(), "Id", "Nombre");

            return View();
        }

        // POST: ApartadosController/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create(ApartadoDtoIn apartado)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    await _unitOfWork.Apartado.AgregarAsync(apartado);

                    return RedirectToAction(nameof(Index));
                }
                ViewBag.TipoDeApartados = new SelectList(await _unitOfWork.TipoDeApartado.ObtenerAsync(), "Id", "Nombre");
                ViewBag.Subcategorias = new SelectList(await _unitOfWork.Subcategoria.ObtenerAsync(), "Id", "Nombre");

                return View(apartado);
            }
            catch
            {
                return View();
            }
        }

        // GET: ApartadosController/Edit/5
        public async Task<ActionResult> Edit(int id)
        {
            ApartadoDto apartado;

            apartado = await _unitOfWork.Apartado.ObtenerAsync(id);
            ViewBag.Id = apartado.Id;
            ViewBag.Subcategorias = new SelectList(await _unitOfWork.Subcategoria.ObtenerAsync(), "Id", "Nombre");
            ViewBag.TipoDeApartados = new SelectList(await _unitOfWork.TipoDeApartado.ObtenerAsync(), "Id", "Nombre");

            return View(new ApartadoDtoIn
            {
                CantidadFinal = apartado.CantidadFinal,
                CantidadInicial = apartado.CantidadInicial,
                FechaFinal = apartado.FechaFinal,
                FechaInicial = apartado.FechaInicial,
                Guid = apartado.Guid,
                Intereses = apartado.Intereses,
                Nombre = apartado.Nombre,
                SubcategoriaIdGuid = apartado.Subcategoria.Id.ToString(),
                TipoDeApartadoId = apartado.TipoDeApartado.Id
            });
        }

        // POST: ApartadosController/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit(int id, ApartadoDtoUpdate apartado)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    await _unitOfWork.Apartado.ActualizarAsync(id.ToString(), new ApartadoDtoUpdate
                    {
                        CantidadFinal = apartado.CantidadFinal,
                        CantidadInicial = apartado.CantidadInicial,
                        FechaFinal = apartado.FechaFinal,
                        FechaInicial = apartado.FechaInicial,
                        Intereses = apartado.Intereses,
                        Nombre = apartado.Nombre,
                        SubcategoriaIdGuid = apartado.SubcategoriaIdGuid,
                        TipoDeApartadoId = apartado.TipoDeApartadoId
                    });

                    return RedirectToAction(nameof(Index));
                }
                else
                {
                    ViewBag.Id = id;
                    ViewBag.Subcategorias = new SelectList(await _unitOfWork.Subcategoria.ObtenerAsync(), "Id", "Nombre");
                    ViewBag.TipoDeApartados = new SelectList(await _unitOfWork.TipoDeApartado.ObtenerAsync(), "Id", "Nombre");

                    return View(apartado);
                }
            }
            catch
            {
                return View();
            }
        }

        // GET: ApartadosController/Delete/5
        public async Task<ActionResult> Delete(int id)
        {
            ApartadoDto apartado;

            apartado = await _unitOfWork.Apartado.ObtenerAsync(id);

            return View(apartado);
        }

        // POST: ApartadosController/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Delete(int id, ApartadoDtoIn collection)
        {
            try
            {
                await _unitOfWork.Apartado.BorrarAsync(id);

                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }
    }
}
