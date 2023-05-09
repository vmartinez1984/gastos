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

        public async Task ActualizarAsync(SubcategoriaEntity entity)
        {
            _appDbContext.Subcategoria.Update(entity);
            await _appDbContext.SaveChangesAsync();
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

        public async Task<List<SubcategoriaEntity>> ObtenerAsync()
        {
            List<SubcategoriaEntity> entities = await  _appDbContext.Subcategoria
                .Include(x => x.Categoria)
                .Where(x => x.EstaActivo).OrderBy(x=>x.Nombre)
                .ToListAsync();

            //foreach (var item in entities)
            //{
            //    if (item.Guid == Guid.Empty || item.Guid == null)
            //    {
            //        item.Guid = Guid.NewGuid();
            //        _appDbContext.Subcategoria.Update(item);
            //    }
            //}
            //await _appDbContext.SaveChangesAsync();

            return entities;
        }

        public async Task<SubcategoriaEntity> ObtenerAsync(int id)
        {
            SubcategoriaEntity entity;

            entity = await _appDbContext.Subcategoria
                .Include(x=> x.Categoria)
                .Where(x => x.Id == id).FirstOrDefaultAsync();

            return entity;
        }

        public Task<List<SubcategoriaEntity>> ObtenerPorCategoriaIdAsync(int categoriaId)
        {
            return _appDbContext.Subcategoria
                .Include(x => x.Categoria)
                .Where(x => x.CategoriaId == categoriaId && x.EstaActivo)
                .ToListAsync();
        }
    }
}
