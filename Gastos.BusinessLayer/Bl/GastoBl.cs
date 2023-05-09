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

        public async Task ActualizarAsync(GastoDtoIn item, int id)
        {
            GastoEntity entity;

            entity = await _repositorio.Gasto.ObtenerAsync(id);
            entity.PeriodoId = item.PeriodoId;
            entity.Nombre = item.Nombre;    
            entity.SubcategoriaId = item.SubcategoriaId;
            entity.Cantidad = item.Cantidad;

            await _repositorio.Gasto.ActualizarAsync(entity);
        }

        public async Task<IdDto> AgregarAsync(GastoDtoIn item)
        {
            GastoEntity entity;

            entity = _mapper.Map<GastoEntity>(item);
            entity.Id = await _repositorio.Gasto.AgregarAsync(entity);

            return new IdDto { Id = entity.Id, Guid = entity.Guid };
        }        

        public Task BorrarAsync(int id)
        {
            throw new NotImplementedException();
        }

        public Task<List<GastoDto>> ObtenerAsync()
        {
            throw new NotImplementedException();
        }

        public async Task<GastoDto> ObtenerAsync(int id)
        {
            GastoEntity entity;
            GastoDto dto;

            entity = await _repositorio.Gasto.ObtenerAsync(id);
            dto = _mapper.Map<GastoDto>(entity);

            return dto;
        }

        public async Task<List<GastoDto>> ObtenerPorPeriodoIdAsync(int periodoId)
        {
            return _mapper.Map<List<GastoDto>>(await _repositorio.Gasto.ObtenerPorPeriodoIdAsync(periodoId));
        }
    }
}
