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

        public async Task ActualizarAsync(SubcategoriaDtoUpdate item, string idGuid)
        {
            SubcategoriaEntity entity;

            entity = await _repositorio.Subcategoria.ObtenerAsync(idGuid);
            entity.CategoriaId = item.CategoriaId;
            entity.Cantidad = item.Cantidad;
            entity.Nombre = item.Nombre;

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

            return item;
        }

        public async Task<List<SubcategoriaDto>> ObtenerPorCategoriaIdAsync(int categoriaId)
        {
            List<SubcategoriaEntity> entities;

            entities = await _repositorio.Subcategoria.ObtenerPorCategoriaIdAsync(categoriaId);
            var list = _mapper.Map<List<SubcategoriaDto>>(entities);

            return list;
        }
    }
}
