using Gastos.Core.Interfaces.IBusinessLayer;
using Microsoft.AspNetCore.Mvc;

namespace Gastos.Api.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class ControllerBaseGastos : ControllerBase
    {
        protected readonly IBl _unitOfWork;

        public ControllerBaseGastos(IBl bl)
        {
            _unitOfWork = bl;
        }
    }
}