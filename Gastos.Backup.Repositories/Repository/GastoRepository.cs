using Gastos.Backup.Core.Entities;
using Gastos.Backup.Core.Interfaces.IRepositories;
using Gastos.Backup.Repositories.Helpers;
using Gastos.Backup.Repositories.Contexts;
using Microsoft.EntityFrameworkCore;

namespace Gastos.Repositories.Repository
{
    public class GastoRepository : BaseRepository, IGastoRepository
    {
        public GastoRepository(AppDbContext appDbContext) : base(appDbContext)
        {
        }

        public async Task ActualizarAsync(GastoEntity entity)
        {
            _appDbContext.Gasto.Update(entity);

            await _appDbContext.SaveChangesAsync();
        }

        public async Task<Guid> AgregarAsync(GastoEntity entity)
        {
            GastoEntity gastoEntity;

            gastoEntity = await _appDbContext.Gasto.Where(x => x.Guid == entity.Guid).FirstOrDefaultAsync();
            if (gastoEntity is null)
            {
                _appDbContext.Gasto.Add(entity);
                await _appDbContext.SaveChangesAsync();
            }
            else
                entity = gastoEntity;

            return entity.Guid;
        }

        public async Task BorrarAsync(Guid id)
        {
            GastoEntity entity;

            entity = await _appDbContext.Gasto.Where(x => x.Guid == id).FirstOrDefaultAsync();
            entity.EstaActivo = false;
            _appDbContext.Update(entity);

            await _appDbContext.SaveChangesAsync();
        }

        public async Task<GastoEntity> ObtenerAsync(Guid id)
        {
            GastoEntity entity;

            entity = await _appDbContext.Gasto
                .Include(x => x.Subcategoria)
                .Include(x => x.Subcategoria.Categoria)
                .Where(x => x.Guid == id).FirstOrDefaultAsync();

            return entity;
        }

        public async Task<List<GastoEntity>> ObtenerPorPeriodoIdAsync(Guid periodoId)
        {
            List<GastoEntity> entities;

            entities = await _appDbContext.Gasto
                .Include(x => x.Subcategoria)
                .Include(x => x.Subcategoria.Categoria)
                .Where(x => x.PeriodoId == periodoId && x.EstaActivo).ToListAsync();

            return entities;
        }

        //public async Task<GastoEntity> ObtenerPorSubcategoriaIdAsync(int subcategoriaId, int periodoId)
        //{
        //    GastoEntity entity;

        //    entity = await _appDbContext.Gasto.Where(x => x.SubcategoriaId == subcategoriaId && x.PeriodoId == periodoId).FirstOrDefaultAsync();

        //    return entity;
        //}

    }
}
