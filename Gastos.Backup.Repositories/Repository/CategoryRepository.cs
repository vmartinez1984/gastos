using Gastos.Backup.Core.Entities;
using Gastos.Backup.Core.Interfaces.IRepositories;
using Gastos.Backup.Repositories.Helpers;
using Gastos.Backup.Repositories.Contexts;
using Microsoft.EntityFrameworkCore;


namespace Gastos.Repositories.Repository
{
    public class CategoryRepository : BaseRepository, ICategoriaRepository
    {
        public CategoryRepository(AppDbContext appDbContext) : base(appDbContext)
        {
        }

        public bool Existe(Guid id)
        {
            return _appDbContext.Categoria.Any(c => c.Guid == id);
        }

        public async Task<List<CategoriaEntity>> ObtenerAsync()
        {
            return await _appDbContext.Categoria.Where(x => x.EstaActivo).ToListAsync();
        }
    }
}
