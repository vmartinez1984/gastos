using AutoMapper;
using Gastos.BusinessLayer.Helpers;
using Gastos.Core.Dtos;
using Gastos.Core.Entities;
using Gastos.Core.Interfaces.IBusinessLayer;
using Gastos.Core.Interfaces.IRepositories;

namespace Gastos.BusinessLayer.Bl
{
    public class PresupuestoBl : BaseBl, IPresupuestoBl
    {
        public PresupuestoBl(IRepositorio repositorio, IMapper mapper) : base(repositorio, mapper)
        {
        }

        public async Task ActualizarAsync(int presupuestoId, PresupuestoDtoIn presupuesto)
        {
            PresupuestoEntity entity;

            entity = await _repositorio.Presupuesto.ObtenerPorIdAsync(presupuestoId);
            entity = _mapper.Map(presupuesto, entity);

            await _repositorio.Presupuesto.ActualizarAsync(entity);
        }

        public async Task<int> AgregarAsync(PresupuestoDtoIn presupuesto)
        {
            PresupuestoEntity entity;

            entity = _mapper.Map<PresupuestoEntity>(presupuesto);
            await _repositorio.Presupuesto.AgregarAsync(entity);

            return entity.Id;
        }

        public async Task<PresupuestoDto> ObtenerPorIdAsync(int presupuestoId)
        {
            PresupuestoDto item;
            PresupuestoEntity entity;

            entity = await _repositorio.Presupuesto.ObtenerPorIdAsync(presupuestoId);
            item = _mapper.Map<PresupuestoDto>(entity);

            return item;
        }

        public async Task<List<PresupuestoDto>> ObtenerTodosPorVersionId(int versionDelPresupuestoId)
        {
            List<PresupuestoDto> dtos;
            List<PresupuestoEntity> entities;

            entities = await _repositorio.Presupuesto.ObtenerTodosPorVersionId(versionDelPresupuestoId);
            dtos = _mapper.Map<List<PresupuestoDto>>(entities);

            return dtos;
        }
    }
}
