using Gastos.Backup.Core.Entities;
using Gastos.Backup.Repositories.Helpers;
using Gastos.Backup.Repositories.Contexts;
using Microsoft.EntityFrameworkCore;
using Gastos.Backup.Core.Interfaces.IRepositories;

namespace Gastos.Repositories.Repository
{
    public class DetalleDeApartadoRepository : BaseRepository, IDetalleDeApartadoRepository
    {
        public DetalleDeApartadoRepository(AppDbContext appDbContext) : base(appDbContext)
        {
        }

        public Task ActualizarAsync(DetalleDeApartadoEntity entity)
        {
            throw new NotImplementedException();
        }

        public async Task<Guid> AgregarAsync(DetalleDeApartadoEntity entity)
        {
            await _appDbContext.DetalleDeApartado.AddAsync(entity);
            await _appDbContext.SaveChangesAsync();

            return entity.Guid;
        }

        public Task BorrarAsync(Guid id)
        {
            throw new NotImplementedException();
        }

        public async Task<DetalleDeApartadoEntity> ObtenerAsync(Guid id)
        {
            return await _appDbContext.DetalleDeApartado.FirstAsync(x => x.Guid == id);
        }
            
        public async Task<decimal> ObtenerTotalAsync(int apartadoId)
        {
            decimal total;

            total = await _appDbContext.DetalleDeApartado.Where(x => x.ApartadoId == apartadoId && x.EstaActivo)
                .SumAsync(x => x.Cantidad);

            return total;
        }
    }
}
