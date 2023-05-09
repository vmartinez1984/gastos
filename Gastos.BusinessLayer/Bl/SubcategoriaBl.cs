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

        public async Task ActualizarAsync(SubcategoriaDtoIn item, int id)
        {
            SubcategoriaEntity entity;

            entity = await _repositorio.Subcategoria.ObtenerAsync(id);
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

        public Task BorrarAsync(int id)
        {
            throw new NotImplementedException();
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

        public Task<SubcategoriaDto> ObtenerAsync(int id)
        {
            throw new NotImplementedException();
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
