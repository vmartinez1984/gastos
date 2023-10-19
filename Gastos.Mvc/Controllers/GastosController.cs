using Gastos.Core.Dtos;
using Gastos.Core.Interfaces.IBusinessLayer;
using Gastos.Mvc.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace Gastos.Mvc.Controllers
{
    public class GastosController : ControllerGastos
    {
        public GastosController(IBl bl) : base(bl)
        {
        }


        public async Task<IActionResult> Create()
        {
            ViewBag.ListaDeSubcategorias = new SelectList(await _unitOfWork.Subcategoria.ObtenerAsync(), "Id", "Nombre");
            return View();
        }

        public async Task<IActionResult> Index(int periodoId)
        {
            PeriodoConGastosModel periodoConGastosModel;

            periodoConGastosModel = new PeriodoConGastosModel
            {
                Periodo = await _unitOfWork.Periodo.ObtenerAsync(periodoId.ToString()),
                ListaDeGastos = await _unitOfWork.Gasto.ObtenerListaDeGastosYSubcategorias(periodoId.ToString())
            };            

            return View(periodoConGastosModel);
        }

        public async Task<IActionResult> Agregar(int periodoId, int subcategoriaId)
        {
            GastoDtoIn gasto;
            SubcategoriaDto subcategoria;

            subcategoria = await _unitOfWork.Subcategoria.ObtenerAsync(subcategoriaId.ToString());
            gasto = new GastoDtoIn
            {
                PeriodoId = periodoId,
                PeriodoGuidId = periodoId.ToString(),
                SubcategoriaId = subcategoriaId,
                SubcategoriaGuidId = subcategoriaId.ToString(),
                Cantidad = subcategoria.Cantidad,
            };
            ViewBag.Subcategorias = new SelectList(await _unitOfWork.Subcategoria.ObtenerAsync(), "Id", "Nombre");

            return View(gasto);
        }

        [HttpPost]
        public async Task<IActionResult> Agregar(GastoDtoIn gasto)
        {
            if (ModelState.IsValid)
            {
                await _unitOfWork.Gasto.AgregarAsync(gasto);

                return RedirectToAction("Index", "Gastos", new { PeriodoId = gasto.PeriodoGuidId });
            }
            else
            {
                SubcategoriaDto subcategoria = await _unitOfWork.Subcategoria.ObtenerAsync(gasto.SubcategoriaGuidId);
                gasto.SubcategoriaId = subcategoria.Id;
                ViewBag.Subcategorias = new SelectList(await _unitOfWork.Subcategoria.ObtenerAsync(), "Id", "Nombre");

                return View(gasto);
            }
        }

        public async Task<IActionResult> Editar(int id)
        {
            GastoDto gasto;

            gasto = await _unitOfWork.Gasto.ObtenerAsync(id);
            ViewBag.Id = id;
            ViewBag.Subcategorias = new SelectList(await _unitOfWork.Subcategoria.ObtenerAsync(), "Id", "Nombre");

            return View(new GastoDtoIn
            {
                Cantidad = gasto.Cantidad,
                PeriodoId = gasto.PeriodoId,
                Nombre = gasto.Nombre,
                Guid = gasto.IdemPotency,
                PeriodoGuidId = gasto.PeriodoId.ToString(),
                SubcategoriaGuidId = gasto.Subcategoria.Id.ToString(),
                SubcategoriaId = gasto.Subcategoria.Id
            });
        }

        [HttpPost]
        public async Task<IActionResult> Editar(int id, GastoDtoIn gasto)
        {
            if (ModelState.IsValid)
            {
                await _unitOfWork.Gasto.ActualizarAsync(gasto, id);

                return RedirectToAction("Index", "Gastos", new { PeriodoId = gasto.PeriodoGuidId });
            }
            else
            {
                GastoDto gastoDto;

                gastoDto = await _unitOfWork.Gasto.ObtenerAsync(id);
                ViewBag.Id = id;
                ViewBag.Subcategorias = new SelectList(await _unitOfWork.Subcategoria.ObtenerAsync(), "Id", "Nombre");

                return View(new GastoDtoIn
                {
                    Cantidad = gasto.Cantidad,
                    PeriodoId = gasto.PeriodoId,
                    Nombre = gasto.Nombre,
                    Guid = gastoDto.IdemPotency,
                    PeriodoGuidId = gasto.PeriodoId.ToString(),
                    SubcategoriaGuidId = gastoDto.Subcategoria.Id.ToString(),
                    SubcategoriaId = gastoDto.Subcategoria.Id
                });
            }
        }
    }
}
