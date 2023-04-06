using Gastos.Core.Entities;
using Gastos.Core.Interfaces.IRepositories;
using Gastos.Repositories.Helpers;
using Gastos.Repository.Contexts;
using Microsoft.EntityFrameworkCore;

namespace Gastos.Repositories.Repository
{
    public class ApartadoRepository : BaseRepository, IApartadoRepository
    {
        public ApartadoRepository(AppDbContext appDbContext) : base(appDbContext)
        {
        }

        public Task ActualizarAsync(ApartadoEntity entity)
        {
            throw new NotImplementedException();
        }

        public async Task<int> AgregarAsync(ApartadoEntity entity)
        {
            await _appDbContext.Apartado.AddAsync(entity);
            await _appDbContext.SaveChangesAsync();

            return entity.Id;
        }

        public Task BorrarAsync(int id)
        {
            throw new NotImplementedException();
        }

        public Task<ApartadoEntity> ObtenerAsync(int id)
        {
            throw new NotImplementedException();
        }

        public async Task<List<ApartadoEntity>> ObtenerPorPeriodoAsync(int periodoId)
        {
            List<ApartadoEntity> entities;

            entities = await _appDbContext.Apartado.Where(x => x.PeriodoId == periodoId && x.EstaActivo).ToListAsync();

            return entities;
        }
    }
}
