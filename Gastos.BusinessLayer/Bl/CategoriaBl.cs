using AutoMapper;
using Gastos.BusinessLayer.Helpers;
using Gastos.Core.Dtos;
using Gastos.Core.Interfaces.IBusinessLayer;
using Gastos.Core.Interfaces.IRepositories;

namespace Gastos.BusinessLayer.Bl
{
    public class CategoriaBl : BaseBl, ICategoriaBl
    {
        public CategoriaBl(IRepositorio repositorio, IMapper mapper) : base(repositorio, mapper)
        {
        }

        public async Task<List<CategoriaDto>> ObtenerAsync()
        {
            return _mapper.Map<List<CategoriaDto>>(await _repositorio.Categoria.ObtenerAsync());
        }
    }
}
