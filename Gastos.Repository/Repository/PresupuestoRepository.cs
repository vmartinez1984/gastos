using Gastos.Core.Entities;
using Gastos.Core.Interfaces.IRepositories;
using Gastos.Repositories.Helpers;
using Gastos.Repository.Contexts;
using Microsoft.EntityFrameworkCore;

namespace Gastos.Repositories.Repository
{
    public class PresupuestoRepository : BaseRepository, IPresupuestoRepositorio
    {
        public PresupuestoRepository(AppDbContext appDbContext) : base(appDbContext)
        {
        }

        public async Task ActualizarAsync(PresupuestoEntity entity)
        {
            _appDbContext.Presupuesto.Update(entity);
            await _appDbContext.SaveChangesAsync();
        }

        public async Task<int> AgregarAsync(PresupuestoEntity presupuesto)
        {
            _appDbContext.Presupuesto.Add(presupuesto);            
            await _appDbContext.SaveChangesAsync();

            return presupuesto.Id;
        }

        public async Task<PresupuestoEntity> ObtenerPorIdAsync(int presupuestoId)
        {
            return await _appDbContext.Presupuesto.Where(x=> x.Id == presupuestoId).FirstOrDefaultAsync();
        }

        public async Task<List<PresupuestoEntity>> ObtenerTodosPorVersionId(int versionDelPresupuestoId)
        {
            return await _appDbContext.Presupuesto.Where(x => x.VersionDelPresupuestoId == versionDelPresupuestoId).ToListAsync();
        }
    }
}
