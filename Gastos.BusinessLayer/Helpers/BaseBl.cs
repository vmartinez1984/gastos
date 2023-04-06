using AutoMapper;
using Gastos.Core.Interfaces.IRepositories;

namespace Gastos.BusinessLayer.Helpers
{
    public class BaseBl
    {
        protected readonly IRepositorio _repositorio;
        protected readonly IMapper _mapper;

        public BaseBl(
            IRepositorio repositorio,
            IMapper mapper
        )
        {
            _repositorio = repositorio;
            _mapper = mapper;
        }
    }
}
