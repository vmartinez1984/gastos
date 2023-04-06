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

        public Task ActualizarAsync(SubcategoriaDtoIn item, int id)
        {
            throw new NotImplementedException();
        }

        public async Task<int> AgregarAsync(SubcategoriaDtoIn item)
        {
            SubcategoriaEntity entity;

            entity = _mapper.Map<SubcategoriaEntity>(item);
            entity.Id = await _repositorio.Subcategoria.AgregarAsync(entity);

            return entity.Id;
        }

        public Task BorrarAsync(int id)
        {
            throw new NotImplementedException();
        }

        public async Task<List<SubcategoriaDto>> ObtenerAsync()
        {
            var entities = await _repositorio.Subcategoria.ObtenerAsync();

            var list = _mapper.Map<List<SubcategoriaDto>>(entities);

            return list;
        }

        public Task<SubcategoriaDto> ObtenerAsync(int id)
        {
            throw new NotImplementedException();
        }
    }
}
