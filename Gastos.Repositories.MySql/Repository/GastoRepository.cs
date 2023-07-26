using Gastos.Core.Entities;
using Gastos.Core.Interfaces.IRepositories;
using Gastos.Repositories.Helpers;
using Gastos.Repository.Contexts;
using Microsoft.EntityFrameworkCore;
using System.Text.RegularExpressions;

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

        public async Task<int> AgregarAsync(GastoEntity entity)
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

            return entity.Id;
        }

        public async Task BorrarAsync(int id)
        {
            GastoEntity entity;

            entity = await _appDbContext.Gasto.Where(x => x.Id == id).FirstOrDefaultAsync();
            entity.EstaActivo = false;
            _appDbContext.Update(entity);

            await _appDbContext.SaveChangesAsync();
        }

        public async Task<GastoEntity> ObtenerAsync(int id)
        {
            GastoEntity entity;

            entity = await _appDbContext.Gasto
                .Include(x => x.Subcategoria)
                .Include(x => x.Subcategoria.Categoria)
                .Where(x => x.Id == id).FirstOrDefaultAsync();

            return entity;
        }

        public async Task<GastoEntity> ObtenerAsync(string idGuid)
        {

            if (Regex.IsMatch(idGuid, @"^[0-9]+$"))
            {
                return await ObtenerAsync(Convert.ToInt32(idGuid));
            }
            else
            {
                Guid guid;

                guid = Guid.Parse(idGuid);

                return await _appDbContext.Gasto.Where(x => x.Guid == guid).FirstOrDefaultAsync();
            }
        }

        public async Task<List<GastoEntity>> ObtenerPorPeriodoIdAsync(int periodoId)
        {
            List<GastoEntity> entities;

            entities = await _appDbContext.Gasto
                .Include(x => x.Subcategoria)
                .Include(x => x.Subcategoria.Categoria)
                .Where(x => x.PeriodoId == periodoId && x.EstaActivo).ToListAsync();

            return entities;
        }

        public async Task<GastoEntity> ObtenerPorSubcategoriaIdAsync(int subcategoriaId, int periodoId)
        {
            GastoEntity entity;

            entity = await _appDbContext.Gasto.Where(x => x.SubcategoriaId == subcategoriaId && x.PeriodoId == periodoId).FirstOrDefaultAsync();

            return entity;
        }
    }
}
