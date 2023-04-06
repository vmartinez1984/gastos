using Gastos.Core.Entities;
using Gastos.Core.Interfaces.IRepositories;
using Gastos.Repositories.Helpers;
using Gastos.Repository.Contexts;
using Microsoft.EntityFrameworkCore;

namespace Gastos.Repositories.Repository
{
    public class SubcategoriaRepository : BaseRepository, ISubcategoriaRepository
    {
        public SubcategoriaRepository(AppDbContext appDbContext) : base(appDbContext)
        {
        }

        public Task ActualizarAsync(SubcategoriaEntity entity)
        {
            throw new NotImplementedException();
        }

        public async Task<int> AgregarAsync(SubcategoriaEntity entity)
        {
            _appDbContext.Subcategoria.Add(entity);
            await _appDbContext.SaveChangesAsync();

            return entity.Id;
        }

        public Task BorrarAsync(int id)
        {
            throw new NotImplementedException();
        }

        public Task<List<SubcategoriaEntity>> ObtenerAsync()
        {
            return _appDbContext.Subcategoria
                .Include(x => x.Categoria)
                .Where(x => x.EstaActivo)
                .ToListAsync();
        }

        public async Task<SubcategoriaEntity> ObtenerAsync(int id)
        {
            SubcategoriaEntity entity;

            entity = await _appDbContext.Subcategoria
                .Include(x=> x.Categoria)
                .Where(x => x.Id == id).FirstOrDefaultAsync();

            return entity;
        }
    }
}
