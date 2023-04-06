using Gastos.Core.Entities;
using Gastos.Core.Interfaces.IRepositories;
using Gastos.Repositories.Helpers;
using Gastos.Repository.Contexts;
using Microsoft.EntityFrameworkCore;

namespace Gastos.Repositories.Repository
{
    public class PeriodoRepository : BaseRepository, IPeriodoRepository
    {
        public PeriodoRepository(AppDbContext appDbContext) : base(appDbContext)
        {
        }

        public Task ActualizarAsync(PeriodoEntity entity)
        {
            throw new NotImplementedException();
        }

        public async Task<int> AgregarAsync(PeriodoEntity entity)
        {
            _appDbContext.Periodo.Add(entity);
            await _appDbContext.SaveChangesAsync();

            return entity.Id;
        }

        public async Task BorrarAsync(int id)
        {
            PeriodoEntity entity;

            entity = await _appDbContext.Periodo.Where(x=>x.Id == id).FirstOrDefaultAsync();
            entity.EstaActivo = false;
            _appDbContext.Update(entity);

            await _appDbContext.SaveChangesAsync();
        }

        public async Task<PeriodoEntity> ObtenerAsync(int id)
        {
            PeriodoEntity entity;

            entity = await _appDbContext.Periodo.Where(x => x.Id == id).FirstOrDefaultAsync();

            return entity;
        }

        public async Task<List<PeriodoEntity>> ObtenerAsync()
        {
            List<PeriodoEntity> entities;

            entities = await _appDbContext.Periodo.Where(x => x.EstaActivo).ToListAsync();

            return entities;
        }
    }
}
