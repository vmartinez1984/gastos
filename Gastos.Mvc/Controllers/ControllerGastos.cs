using Gastos.Core.Interfaces.IBusinessLayer;
using Microsoft.AspNetCore.Mvc;

namespace Gastos.Mvc.Controllers
{
    public class ControllerGastos : Controller
    {
        public readonly IBl _unitOfWork;
        //private readonly ILogger<HomeController> _logger;

        //public ControllerGastos(ILogger<HomeController> logger)
        //{
        //    _logger = logger;
        //}

        public ControllerGastos(IBl bl)
        {
            _unitOfWork = bl;
        }
    }
}