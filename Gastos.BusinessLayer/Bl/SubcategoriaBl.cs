using AutoMapper;
using Gastos.BusinessLayer.Helpers;
using Gastos.Core.Dtos;
using Gastos.Core.Entities;
using Gastos.Core.Interfaces.IBusinessLayer;
using Gastos.Core.Interfaces.IRepositories;

namespace Gastos.BusinessLayer.Bl
{
    public class SubcategoriaBl : BaseBl, ISubcategoriaBl
    {
        public SubcategoriaBl(IRepositorio repositorio, IMapper mapper) : base(repositorio, mapper)
        {
        }

        public async Task ActualizarAsync(SubcategoriaDtoIn item, string idGuid)
        {
            SubcategoriaEntity entity;

            entity = await _repositorio.Subcategoria.ObtenerAsync(idGuid);
            entity = _mapper.Map(item, entity);

            await _repositorio.Subcategoria.ActualizarAsync(entity);
        }
               
        public async Task<IdDto> AgregarAsync(SubcategoriaDtoIn item)
        {
            SubcategoriaEntity entity;

            entity = _mapper.Map<SubcategoriaEntity>(item);
            entity.Id = await _repositorio.Subcategoria.AgregarAsync(entity);

            return new IdDto { Id = entity.Id, Guid = (Guid)entity.Guid };
        }

        public async Task BorrarAsync(string idGuid)
        {
            await _repositorio.Subcategoria.BorrarAsync(idGuid);
        }

        public bool Existe(Guid guid)
        {
            return _repositorio.Subcategoria.Existe(guid);
        }

        public async Task<List<SubcategoriaDto>> ObtenerAsync()
        {
            var entities = await _repositorio.Subcategoria.ObtenerAsync();

            var list = _mapper.Map<List<SubcategoriaDto>>(entities);
            foreach (var subcategoriDto in list)
            {
                subcategoriDto.Total = await _repositorio.Apartado.ObtenerTotalPorSubcategoriaId(subcategoriDto.Id);
            }

            return list;
        }

        public async Task<SubcategoriaDto> ObtenerAsync(string idGuid)
        {
            SubcategoriaEntity entity;
            SubcategoriaDto item;

            entity = await _repositorio.Subcategoria.ObtenerAsync(idGuid);
            item = _mapper.Map<SubcategoriaDto>(entity);
            item.Total = await _repositorio.Apartado.ObtenerTotalPorSubcategoriaId(entity.Id);

            return item;
        }

        public async Task<List<SubcategoriaDto>> ObtenerPorCategoriaIdAsync(int categoriaId)
        {
            List<SubcategoriaEntity> entities;

            entities = await _repositorio.Subcategoria.ObtenerPorCategoriaIdAsync(categoriaId);
            var list = _mapper.Map<List<SubcategoriaDto>>(entities);

            return list;
        }

        public async Task<List<SubcategoriaDto>> ObtenerTodosPorVersionAsync(int versionId)
        {
            List<SubcategoriaEntity> entities;
            List<SubcategoriaDto> dtos;

            entities = await _repositorio.Subcategoria.ObtenerTodosPorVersionAsync(versionId);
            dtos = _mapper.Map<List<SubcategoriaDto>>(entities);

            return dtos;
        }
    }
}
