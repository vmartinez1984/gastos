using Gastos.Core.Entities;
using Gastos.Core.Interfaces.IRepositories;
using Gastos.Repositories.Helpers;
using Gastos.Repository.Contexts;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Text.RegularExpressions;

namespace Gastos.Repositories.Repository
{
    public class DetalleDeApartadoRepository : BaseRepository, IDetalleDeApartadoRepository
    {
        public DetalleDeApartadoRepository(AppDbContext appDbContext) : base(appDbContext)
        {
        }

        public Task ActualizarAsync(DetalleDeApartadoEntity entity)
        {
            throw new NotImplementedException();
        }

        public async Task<int> AgregarAsync(DetalleDeApartadoEntity entity)
        {
            await _appDbContext.DetalleDeApartado.AddAsync(entity);
            await _appDbContext.SaveChangesAsync();

            return entity.Id;
        }

        public Task BorrarAsync(int id)
        {
            throw new NotImplementedException();
        }

        public Task<DetalleDeApartadoEntity> ObtenerAsync(int id)
        {
            throw new NotImplementedException();
        }

        public async Task<DetalleDeApartadoEntity> ObtenerAsync(string idGuid)
        {
            if (Regex.IsMatch(idGuid, @"^[0-9]+$"))
            {
                var entity = await _appDbContext
                     .DetalleDeApartado                
                .Where(x => x.Id == Convert.ToInt32(idGuid)).FirstOrDefaultAsync();                

                return entity;
            }
            else
            {
                Guid guid;

                guid = Guid.Parse(idGuid);

                return await _appDbContext
                     .DetalleDeApartado                
                .Where(x => x.Guid == guid).FirstOrDefaultAsync();
            }
        }

        public async Task<List<DetalleDeApartadoEntity>> ObtenerPorApartadoIdAsync(int apartadoId)
        {
            //List<DetalleDeApartadoEntity> entities;

            //entities = await _appDbContext.DetalleDeApartado.ToListAsync();
            //foreach (var item in entities)
            //{
            //    if (item.Guid == Guid.Empty || item.Guid == null)
            //    {
            //        item.Guid = Guid.NewGuid();
            //        _appDbContext.DetalleDeApartado.Update(item);
            //    }
            //}
            //await _appDbContext.SaveChangesAsync();
            return await _appDbContext.DetalleDeApartado.Where(x=> x.ApartadoId == apartadoId && x.EstaActivo).ToListAsync();
        }

        public async Task<decimal> ObtenerTotalAsync(int apartadoId)
        {
            decimal total;

            total = await _appDbContext.DetalleDeApartado.Where(x => x.ApartadoId == apartadoId && x.EstaActivo)
                .SumAsync(x => x.Cantidad);

            return total;
        }
    }
}
