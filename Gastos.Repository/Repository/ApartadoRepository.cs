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

        public async Task ActualizarAsync(ApartadoEntity entity)
        {
            _appDbContext.Apartado.Update(entity);

            await _appDbContext.SaveChangesAsync();
        }

        public async Task<int> AgregarAsync(ApartadoEntity entity)
        {
            ApartadoEntity apartado;

            apartado = await _appDbContext.Apartado.Where(x => x.Guid == entity.Guid).FirstOrDefaultAsync();
            if (apartado == null)
            {
                await _appDbContext.Apartado.AddAsync(entity);
                await _appDbContext.SaveChangesAsync();
                return entity.Id;
            }
            else
            {
                return apartado.Id;
            }
        }

        public async Task BorrarAsync(int id)
        {
            ApartadoEntity entity;

            entity = await _appDbContext.Apartado.Where(x => x.Id == id).FirstAsync();
            entity.EstaActivo = false;
            _appDbContext.Apartado.Update(entity);

            await _appDbContext.SaveChangesAsync();
        }

        public async Task<List<ApartadoEntity>> ObtenerApartadosPorSubcategoriaId(int subcategoriaId)
        {
            List<ApartadoEntity> entities;

            entities = await _appDbContext
                .Apartado
                .Include(x => x.TipoDeApartado)
                .Where(x => x.SubcategoriaId == subcategoriaId && x.EstaActivo).ToListAsync();

            return entities;
        }

        public async Task<ApartadoEntity> ObtenerAsync(int id)
        {
            return await _appDbContext
                .Apartado
                .Include(x => x.TipoDeApartado)
                //.Include(x => x.ListaDeDetalles)
                .Where(x => x.Id == id).FirstOrDefaultAsync();
        }

        public async Task<ApartadoEntity> ObtenerAsync(Guid id)
        {
            return await _appDbContext
                .Apartado
                .Include(x => x.TipoDeApartado)
                //.Include(x => x.ListaDeDetalles)
                .Where(x => x.Guid == id).FirstOrDefaultAsync();
        }

        public async Task<List<ApartadoEntity>> ObtenerAsync()
        {
            List<ApartadoEntity> entities;

            entities = await _appDbContext
                .Apartado
                .Include(x => x.TipoDeApartado)
                .Where(x => x.EstaActivo).ToListAsync();
            //foreach (var item in entities)
            //{
            //    if (item.Guid == Guid.Empty || item.Guid == null)
            //    {
            //        item.Guid = Guid.NewGuid();
            //        _appDbContext.Apartado.Update(item);
            //    }
            //}
            //await _appDbContext.SaveChangesAsync();


            return entities;
        }

        public async Task<List<ApartadoEntity>> ObtenerPorPeriodoAsync(int periodoId)
        {
            List<ApartadoEntity> entities;

            entities = await _appDbContext.Apartado.Include(x => x.TipoDeApartado).Where(x => x.PeriodoId == periodoId && x.EstaActivo).ToListAsync();

            return entities;
        }

        public async Task<decimal> ObtenerTotalPorSubcategoriaId(int subcategoriaId)
        {
            decimal total = 0;

            total = await _appDbContext.Apartado.Include(x => x.TipoDeApartado).Where(x => x.SubcategoriaId == subcategoriaId && x.EstaActivo).SumAsync(x => x.CantidadInicial);

            return total;
        }
    }
}
