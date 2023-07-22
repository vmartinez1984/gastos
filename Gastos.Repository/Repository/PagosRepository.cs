using Gastos.Core.Entities;
using Gastos.Core.Interfaces.IRepositories;
using Gastos.Repositories.Helpers;
using Gastos.Repository.Contexts;
using Microsoft.EntityFrameworkCore;

namespace Gastos.Repositories.Repository
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

        public async Task<int> AgregarAsync(PagoEntity entity)
        {
            await _appDbContext.Pago.AddAsync(entity);
            await _appDbContext.SaveChangesAsync();

            return entity.Id;
        }

        public async Task BorrarAsync(int id)
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

        public async Task<PagoEntity> ObtenerAsync(int id)
        {
            return await _appDbContext.Pago.Where(x => x.Id == id && x.EstaActivo).FirstOrDefaultAsync();
        }

        public async Task<List<PagoEntity>> ObtenerPorCompraIdAsync(int compraId)
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