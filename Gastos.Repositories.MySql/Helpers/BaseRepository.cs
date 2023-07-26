using Gastos.Repository.Contexts;

namespace Gastos.Repositories.Helpers
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
