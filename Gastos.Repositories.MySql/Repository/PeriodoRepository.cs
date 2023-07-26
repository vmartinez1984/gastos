using Gastos.Core.Entities;
using Gastos.Core.Interfaces.IRepositories;
using Gastos.Repositories.Helpers;
using Gastos.Repository.Contexts;
using Microsoft.EntityFrameworkCore;
using System.Text.RegularExpressions;

namespace Gastos.Repositories.Repository
{
    public class PeriodoRepository : BaseRepository, IPeriodoRepository
    {
        public PeriodoRepository(AppDbContext appDbContext) : base(appDbContext)
        {
        }

        public async Task ActualizarAsync(PeriodoEntity entity)
        {
            _appDbContext.Periodo.Update(entity);
            await _appDbContext.SaveChangesAsync();
        }

        public async Task<int> AgregarAsync(PeriodoEntity entity)
        {
            PeriodoEntity periodo;

            periodo = await _appDbContext.Periodo.Where(x => x.Guid == entity.Guid).FirstOrDefaultAsync();
            if (periodo == null)
            {
                _appDbContext.Periodo.Add(entity);
                await _appDbContext.SaveChangesAsync();
            }

            return entity.Id;
        }

        public async Task BorrarAsync(int id)
        {
            PeriodoEntity entity;

            entity = await _appDbContext.Periodo.Where(x => x.Id == id).FirstOrDefaultAsync();
            entity.EstaActivo = false;
            _appDbContext.Update(entity);

            await _appDbContext.SaveChangesAsync();
        }

        public async Task BorrarAsync(Guid guid)
        {
            PeriodoEntity entity;

            entity = await _appDbContext.Periodo.Where(x => x.Guid == guid).FirstOrDefaultAsync();
            entity.EstaActivo = false;
            _appDbContext.Update(entity);

            await _appDbContext.SaveChangesAsync();
        }

        public bool Existe(Guid guid)
        {
            bool existe;

            existe = _appDbContext.Periodo.Any(x => x.Guid == guid);

            return existe;
        }

        public async Task<PeriodoEntity> ObtenerAsync(int id)
        {
            PeriodoEntity entity;

            entity = await _appDbContext.Periodo.Where(x => x.Id == id && x.EstaActivo).FirstOrDefaultAsync();

            return entity;
        }

        public async Task<PeriodoEntity> ObtenerAsync(Guid guid)
        {
            PeriodoEntity entity;

            entity = await _appDbContext.Periodo.Where(x => x.Guid == guid && x.EstaActivo).FirstOrDefaultAsync();

            return entity;
        }

        public async Task<List<PeriodoEntity>> ObtenerAsync()
        {
            List<PeriodoEntity> entities;

            entities = await _appDbContext.Periodo.Where(x => x.EstaActivo).ToListAsync();

            return entities;
        }

        public async Task<PeriodoEntity> ObtenerAsync(string idGuid)
        {
            PeriodoEntity entity;            

            if (Regex.IsMatch(idGuid, @"^[0-9]+$"))
            {
                int id;

                id = int.Parse(idGuid);

                entity = await _appDbContext.Periodo.Where(x => x.Id == id).FirstAsync();
            }
            else
            {
                Guid guid;

                guid = Guid.Parse(idGuid);

                entity = await _appDbContext.Periodo.Where(x => x.Guid == guid).FirstAsync();
            }

            return entity;
        }
    }
}
