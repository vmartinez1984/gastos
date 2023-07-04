using Gastos.Core.Dtos;
using Gastos.Core.Interfaces.IBusinessLayer;
using Gastos.Mvc.Models;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;

namespace Gastos.Mvc.Controllers
{
    public class HomeController : ControllerGastos
    {
        private readonly ILogger<HomeController> _logger;

        public HomeController(IBl bl) : base(bl)
        {
        }

        //public HomeController(ILogger<HomeController> logger)
        //{
        //    _logger = logger;
        //}

        public async Task<IActionResult> Index()
        {
            PeriodoDto periodo;
            List<PeriodoDto> periodos;

            periodos = await _unitOfWork.Periodo.ObtenerAsync();
            periodo = periodos.OrderByDescending(x => x.Id).FirstOrDefault();
            ViewBag.Periodo = periodo;
            ViewBag.Periodos = periodos;
            ViewBag.ListaDeGastos = await _unitOfWork.Gasto.ObtenerListaDeGastosYSubcategorias(periodo.Id.ToString());

            return View();
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}