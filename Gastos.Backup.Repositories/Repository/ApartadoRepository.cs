using Gastos.Backup.Core.Entities;
using Gastos.Backup.Core.Interfaces.IRepositories;
using Gastos.Backup.Repositories.Helpers;
using Gastos.Backup.Repositories.Contexts;
using Microsoft.EntityFrameworkCore;

namespace Gastos.Backup.Repositories.Repository
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

        public async Task<Guid> AgregarAsync(ApartadoEntity entity)
        {
            ApartadoEntity apartado;

            apartado = await _appDbContext.Apartado.Where(x => x.Guid == entity.Guid).FirstOrDefaultAsync();
            if (apartado == null)
            {
                await _appDbContext.Apartado.AddAsync(entity);
                await _appDbContext.SaveChangesAsync();
                return entity.Guid;
            }
            else
            {
                return apartado.Guid;
            }
        }

        public async Task BorrarAsync(Guid id)
        {
            ApartadoEntity entity;

            entity = await _appDbContext.Apartado.Where(x => x.Guid == id).FirstAsync();
            entity.EstaActivo = false;
            _appDbContext.Apartado.Update(entity);

            await _appDbContext.SaveChangesAsync();
        }

        public bool Existe(Guid guid)
        {
            return _appDbContext.Apartado.Any(x => x.Guid == guid);
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
                .Include(x => x.Subcategoria)
                    .ThenInclude(x => x.Categoria)
                .Where(x => x.EstaActivo).ToListAsync();

            return entities;
        }
    }
}
