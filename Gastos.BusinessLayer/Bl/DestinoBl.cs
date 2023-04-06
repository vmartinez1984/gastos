using AutoMapper;
using Gastos.BusinessLayer.Helpers;
using Gastos.Core.Dtos;
using Gastos.Core.Interfaces.IBusinessLayer;
using Gastos.Core.Interfaces.IRepositories;

namespace Gastos.BusinessLayer.Bl
{
    internal class DestinoBl : BaseBl, IDestinoBl
    {
        public DestinoBl(IRepositorio repositorio, IMapper mapper) : base(repositorio, mapper)
        {
        }

        public async Task<List<DestinoDto>> ObtenerAsync()
        {
            return _mapper.Map<List<DestinoDto>>(await _repositorio.Destino.ObtenerAsync());
        }
    }
}
