using AutoMapper;
using Gastos.BusinessLayer.Helpers;
using Gastos.Core.Dtos;
using Gastos.Core.Entities;
using Gastos.Core.Interfaces.IBusinessLayer;
using Gastos.Core.Interfaces.IRepositories;

namespace Gastos.BusinessLayer.Bl
{
    public class GastoBl : BaseBl, IGastoBl
    {
        public GastoBl(IRepositorio repositorio, IMapper mapper) : base(repositorio, mapper)
        {
        }

        public Task ActualizarAsync(GastoDtoIn item, int id)
        {
            throw new NotImplementedException();
        }

        public async Task<int> AgregarAsync(GastoDtoIn item)
        {
            GastoEntity entity;

            entity = _mapper.Map<GastoEntity>(item);
            entity.Id = await _repositorio.Gasto.AgregarAsync(entity);            

            return entity.Id;
        }        

        public Task BorrarAsync(int id)
        {
            throw new NotImplementedException();
        }

        public Task<List<GastoDto>> ObtenerAsync()
        {
            throw new NotImplementedException();
        }

        public Task<GastoDto> ObtenerAsync(int id)
        {
            throw new NotImplementedException();
        }

        public async Task<List<GastoDto>> ObtenerPorPeriodoIdAsync(int periodoId)
        {
            return _mapper.Map<List<GastoDto>>(await _repositorio.Gasto.ObtenerPorPeriodoIdAsync(periodoId));
        }
    }
}
