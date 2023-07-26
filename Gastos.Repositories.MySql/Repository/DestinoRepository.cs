using Gastos.Core.Entities;
using Gastos.Core.Interfaces.IRepositories;
using Gastos.Repositories.Helpers;
using Gastos.Repository.Contexts;
using Microsoft.EntityFrameworkCore;

namespace Gastos.Repositories.Repository
{
    public class DestinoRepository : BaseRepository, IDestinoRepository
    {
        public DestinoRepository(AppDbContext appDbContext) : base(appDbContext)
        {
        }

        public async Task<List<DestinoEntity>> ObtenerAsync()
        {
            return await _appDbContext.Destino.Where(x=>x.EstaActivo).ToListAsync();
        }
    }
}
