using AutoMapper;
using Gastos.BusinessLayer.Helpers;
using Gastos.Core.Dtos;
using Gastos.Core.Entities;
using Gastos.Core.Interfaces.IBusinessLayer;
using Gastos.Core.Interfaces.IRepositories;

namespace Gastos.BusinessLayer.Bl
{
    public class TipoDeApartadoBl : BaseBl, ITipoDeApartadoBl
    {
        public TipoDeApartadoBl(IRepositorio repositorio, IMapper mapper) : base(repositorio, mapper)
        {
        }

        public async Task<List<TipoDeApartadoDto>> ObtenerAsync()
        {
            List<TipoDeApartadoDto> list;
            List<TipoDeApartadoEntity> entities;

            entities = await _repositorio.TipoDeApartado.ObtenerAsync();
            list = _mapper.Map<List<TipoDeApartadoDto>>(entities);

            return list;
        }
    }
}
