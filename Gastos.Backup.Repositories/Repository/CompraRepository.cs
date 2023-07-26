using Gastos.Backup.Core.Entities;
using Gastos.Backup.Core.Interfaces.IRepositories;
using Gastos.Backup.Repositories.Helpers;
using Gastos.Backup.Repositories.Contexts;
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

        public async Task<Guid> AgregarAsync(CompraEntity entity)
        {
            await _appDbContext.Compra.AddAsync(entity);
            await _appDbContext.SaveChangesAsync();

            return entity.Guid;
        }

        public async Task BorrarAsync(Guid id)
        {
            CompraEntity entity;

            entity = await ObtenerAsync(id);
            entity.EstaActivo = false;

            await ActualizarAsync(entity);
        }

        public async Task<CompraEntity> ObtenerAsync(Guid id)
        {
            return await 
                _appDbContext.Compra
                .Include(x=> x.ListaDePagos)
                .Where(x=> x.Guid == id && x.EstaActivo).FirstOrDefaultAsync();
        }

        public async Task<List<CompraEntity>> ObtenerPorTdcIdAsync(int tdcId)
        {
            //var entities = _appDbContext.Compra.ToList();
            //foreach (var item in entities)
            //{
            //    if (item.Guid == Guid.Empty || item.Guid == null)
            //    {
            //        item.Guid = Guid.NewGuid();
            //        _appDbContext.Compra.Update(item);
            //    }
            //}
            //await _appDbContext.SaveChangesAsync();
            return await _appDbContext.Compra
                .Include(x=> x.ListaDePagos)
                .Where(x => x.TdcId == tdcId && x.EstaActivo).ToListAsync();
        }
    }
}