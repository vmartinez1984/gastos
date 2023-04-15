using Gastos.Core.Entities;
using Gastos.Core.Interfaces.IRepositories;
using Gastos.Repositories.Helpers;
using Gastos.Repository.Contexts;
using Microsoft.EntityFrameworkCore;

namespace Gastos.Repositories.Repository
{
    public class CompraRepository : BaseRepository, ICompraRepository
    {
        public CompraRepository(AppDbContext appDbContext) : base(appDbContext)
        {
        }

        public async Task ActualizarAsync(CompraEntity entity)
        {
            _appDbContext.Compra.Update(entity);

            await _appDbContext.SaveChangesAsync();
        }

        public async Task<int> AgregarAsync(CompraEntity entity)
        {
            await _appDbContext.Compra.AddAsync(entity);
            await _appDbContext.SaveChangesAsync();

            return entity.Id;
        }

        public async Task BorrarAsync(int id)
        {
            CompraEntity entity;

            entity = await ObtenerAsync(id);
            entity.EstaActivo = false;

            await ActualizarAsync(entity);
        }

        public async Task<CompraEntity> ObtenerAsync(int id)
        {
            return await _appDbContext.Compra.Where(x=> x.Id == id && x.EstaActivo).FirstOrDefaultAsync();
        }

        public async Task<List<CompraEntity>> ObtenerPorTdcIdAsync(int tdcId)
        {
            return await _appDbContext.Compra.Where(x => x.TdcId == tdcId && x.EstaActivo).ToListAsync();
        }
    }
}