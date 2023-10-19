using Gastos.Core.Entities;
using Gastos.Core.Interfaces.IRepositories;
using Gastos.Repositories.Helpers;
using Gastos.Repository.Contexts;
using Microsoft.EntityFrameworkCore;

namespace Gastos.Repositories.Repository
{
    public class VersionDePresupuestoRepository : BaseRepository, IVersionDePresupuesto
    {
        public VersionDePresupuestoRepository(AppDbContext appDbContext) : base(appDbContext)
        {
        }

        public async Task ActualizarAsync(VersionDePresupuestoEntity versionDelPresupuesto)
        {
            _appDbContext.VersionDePresupuesto.Update(versionDelPresupuesto);

            await _appDbContext.SaveChangesAsync(); 
        }

        public async Task<int> AgregarAsync(VersionDePresupuestoEntity versionDePresupuesto)
        {
            await _appDbContext.VersionDePresupuesto.AddAsync(versionDePresupuesto);
            await _appDbContext.SaveChangesAsync();

            return versionDePresupuesto.Id;
        }

        public async Task<VersionDePresupuestoEntity> ObtenerPorIdAsync(int versionDelPresupuestoId)
        {
           return await _appDbContext.VersionDePresupuesto.Where(x=> x.Id == versionDelPresupuestoId).FirstOrDefaultAsync();
        }

        public async Task<List<VersionDePresupuestoEntity>> ObtenerTodosAsync()
        {
            return await _appDbContext.VersionDePresupuesto.ToListAsync();
        }
    }
}
