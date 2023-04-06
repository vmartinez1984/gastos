using Gastos.Core.Interfaces.IBusinessLayer;
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
    }
}
