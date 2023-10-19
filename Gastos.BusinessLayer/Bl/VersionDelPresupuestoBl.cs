using AutoMapper;
using Gastos.BusinessLayer.Helpers;
using Gastos.Core.Dtos;
using Gastos.Core.Entities;
using Gastos.Core.Interfaces.IBusinessLayer;
using Gastos.Core.Interfaces.IRepositories;

namespace Gastos.BusinessLayer.Bl
{
    internal class VersionDelPresupuestoBl : BaseBl, IVersionDelPresupuesto
    {
        public VersionDelPresupuestoBl(IRepositorio repositorio, IMapper mapper) : base(repositorio, mapper)
        {
        }

        public async Task ActualizarAsync(int versionDelPresupuestoId, VersionDelPresupuestoDtoIn versionDelPresupuesto)
        {
            VersionDePresupuestoEntity entity;

            entity = await _repositorio.VersionDePresupuesto.ObtenerPorIdAsync(versionDelPresupuestoId);
            entity = _mapper.Map(versionDelPresupuesto, entity);
            await _repositorio.VersionDePresupuesto.ActualizarAsync(entity);
        }

        public async Task<int> AgregarAsync(VersionDelPresupuestoDtoIn versionDelPresupuesto)
        {
            VersionDePresupuestoEntity entity;

            entity = _mapper.Map<VersionDePresupuestoEntity>(versionDelPresupuesto);
            await _repositorio.VersionDePresupuesto.AgregarAsync(entity);

            return entity.Id;
        }

        public async Task<VersionDelPresupuestoDto> ObtenerPorIdAsync(int versionDelPresupuestoId)
        {
            VersionDePresupuestoEntity entity;

            entity = await _repositorio.VersionDePresupuesto.ObtenerPorIdAsync(versionDelPresupuestoId);

            return _mapper.Map<VersionDelPresupuestoDto>(entity);
        }

        public async Task<List<VersionDelPresupuestoDto>> ObtenerTodosAsync()
        {
            List<VersionDePresupuestoEntity> lista;

            lista = await _repositorio.VersionDePresupuesto.ObtenerTodosAsync();

            return _mapper.Map<List<VersionDelPresupuestoDto>>(lista);
        }
    }
}
