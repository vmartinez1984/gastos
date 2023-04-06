using Gastos.Core.Entities;
using Gastos.Core.Interfaces.IRepositories;
using Gastos.Repositories.Helpers;
using Gastos.Repository.Contexts;
using Microsoft.EntityFrameworkCore;

namespace Gastos.Repositories.Repository
{
    public class CategoryRepository : BaseRepository, ICategoriaRepository
    {
        public CategoryRepository(AppDbContext appDbContext) : base(appDbContext)
        {
        }

        public async Task<List<CategoriaEntity>> ObtenerAsync()
        {
            return await _appDbContext.Categoria.Where(x => x.EstaActivo).ToListAsync();
        }
    }
}
