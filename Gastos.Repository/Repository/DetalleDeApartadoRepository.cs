using Gastos.Core.Entities;
using Gastos.Core.Interfaces.IRepositories;
using Gastos.Repositories.Helpers;
using Gastos.Repository.Contexts;
using Microsoft.EntityFrameworkCore;

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

        public async Task<int> AgregarAsync(DetalleDeApartadoEntity entity)
        {
            await _appDbContext.DetalleDeApartado.AddAsync(entity);
            await _appDbContext.SaveChangesAsync();

            return entity.Id;
        }

        public Task BorrarAsync(int id)
        {
            throw new NotImplementedException();
        }

        public Task<DetalleDeApartadoEntity> ObtenerAsync(int id)
        {
            throw new NotImplementedException();
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
