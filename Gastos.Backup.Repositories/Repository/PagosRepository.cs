using Gastos.Backup.Core.Entities;
using Gastos.Backup.Core.Interfaces.IRepositories;
using Gastos.Backup.Repositories.Contexts;
using Gastos.Backup.Repositories.Helpers;
using Microsoft.EntityFrameworkCore;

namespace Gastos.Backup.Repositories.Repository
{
    public class PagosRepository : BaseRepository, IPagoRepository
    {
        public PagosRepository(AppDbContext appDbContext) : base(appDbContext)
        {
        }

        public async Task ActualizarAsync(PagoEntity entity)
        {
            _appDbContext.Pago.Update(entity);

            await _appDbContext.SaveChangesAsync();
        }

        public async Task<Guid> AgregarAsync(PagoEntity entity)
        {
            await _appDbContext.Pago.AddAsync(entity);
            await _appDbContext.SaveChangesAsync();

            return entity.Guid;
        }

        public async Task BorrarAsync(Guid id)
        {
            PagoEntity entity;

            entity = await ObtenerAsync(id);
            entity.EstaActivo = false;

            await ActualizarAsync(entity);
        }

        public bool Existe(int id)
        {
            throw new NotImplementedException();
        }

        public async Task<PagoEntity> ObtenerAsync(Guid id)
        {
            return await _appDbContext.Pago.Where(x => x.Guid == id && x.EstaActivo).FirstOrDefaultAsync();
        }

        public async Task<List<PagoEntity>> ObtenerPorCompraIdAsync(Guid compraId)
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
            return await _appDbContext.Pago.Where(x => x.CompraId == compraId && x.EstaActivo).ToListAsync();
        }

    }//end class
}