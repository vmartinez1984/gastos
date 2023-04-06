using AutoMapper;
using Gastos.BusinessLayer.Helpers;
using Gastos.Core.Dtos;
using Gastos.Core.Entities;
using Gastos.Core.Interfaces.IBusinessLayer;
using Gastos.Core.Interfaces.IRepositories;

namespace Gastos.BusinessLayer.Bl
{
    public class PeriodoBl :BaseBl, IPeriodoBl
    {
        public PeriodoBl(IRepositorio repositorio, IMapper mapper) : base(repositorio, mapper)
        {
        }

        public Task ActualizarAsync(PeriodoDtoIn item, int id)
        {
            throw new NotImplementedException();
        }

        public async Task<int> AgregarAsync(PeriodoDtoIn item)
        {
            PeriodoEntity entity;

            entity = _mapper.Map<PeriodoEntity>(item);
            entity.Id = await _repositorio.Periodo.AgregarAsync(entity);

            return entity.Id;
        }

        public Task BorrarAsync(int id)
        {
            throw new NotImplementedException();
        }

        public async Task<PeriodoDto> ObtenerAsync(int id)
        {
            return _mapper.Map<PeriodoDto>(await _repositorio.Periodo.ObtenerAsync(id));
        }
        
        public async Task<List<PeriodoDto>> ObtenerAsync()
        {
            List<PeriodoEntity> entities;
            List<PeriodoDto> list;

            entities = await _repositorio.Periodo.ObtenerAsync();
            list = _mapper.Map<List<PeriodoDto>>(entities);

            return list;
        }
    }
}
