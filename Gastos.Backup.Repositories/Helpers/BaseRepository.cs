using Gastos.Backup.Repositories.Contexts;

namespace Gastos.Backup.Repositories.Helpers
{
    public class BaseRepository
    {
        protected readonly AppDbContext _appDbContext;

        public BaseRepository(AppDbContext appDbContext)
        {
            _appDbContext = appDbContext;
        }
    }
}
