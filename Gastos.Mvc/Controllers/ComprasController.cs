using Gastos.Core.Dtos;
using Gastos.Core.Interfaces.IBusinessLayer;
using Microsoft.AspNetCore.Mvc;

namespace Gastos.Mvc.Controllers
{
    public class ComprasController : ControllerGastos
    {
        public ComprasController(IBl bl) : base(bl)
        {
        }

        public async Task<IActionResult> Index(int tdtId = 1)
        {
            List<CompraDto> lista;

            lista = await _unitOfWork.Compra.ObtenerPorTdcIdAsync(tdtId);

            return View(lista);
        }

        public IActionResult Create(int tdtId = 1)
        {
            ViewBag.TdtId = tdtId;
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Create(CompraDtoIn compra)
        {
            if (ModelState.IsValid)
            {
                await _unitOfWork.Compra.AgregarAsync(compra);

                return RedirectToAction("Index");
            }
            else
            {
                return View(compra);
            }
        }

        public async Task<IActionResult> Edit(int id)
        {
            CompraDto compra;

            compra = await _unitOfWork.Compra.ObtenerAsync(id);
            ViewBag.Id = compra.Id;

            return View(new CompraDtoIn
            {
                Cantidad = compra.Cantidad,
                MesesSinIntereses = compra.MesesSinIntereses,
                Nombre = compra.Nombre,
                Nota = compra.Nota,
                TdcId = compra.TdcId,
                FechaDeRegistro = compra.FechaDeRegistro
            });
        }

        [HttpPost]
        public async Task<IActionResult> Edit(int id, CompraDtoIn compra)
        {
            if (ModelState.IsValid)
            {
                await _unitOfWork.Compra.ActualizarAsync(compra, id);

                return RedirectToAction("Index");
            }
            else
            {
                return View(compra);
            }
        }

        public async Task<IActionResult> Details(int id)
        {
            CompraDto compra;

            compra = await _unitOfWork.Compra.ObtenerAsync(id);

            return View(compra);
        }

    }//end class
}
