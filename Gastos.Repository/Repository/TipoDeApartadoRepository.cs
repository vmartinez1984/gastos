﻿using Gastos.Core.Entities;
using Gastos.Core.Interfaces.IRepositories;
using Gastos.Repositories.Helpers;
using Gastos.Repository.Contexts;
using Microsoft.EntityFrameworkCore;

namespace Gastos.Repositories.Repository
{
    public class TipoDeApartadoRepository : BaseRepository, ITipoDeApartadoRepository
    {
        public TipoDeApartadoRepository(AppDbContext appDbContext) : base(appDbContext)
        {
        }

        public bool Existe(int id)
        {
            return _appDbContext.TipoDeApartado.Any(a => a.Id == id);
        }

        public async Task<List<TipoDeApartadoEntity>> ObtenerAsync()
        {
            return await _appDbContext.TipoDeApartado.Where(x => x.EstaActivo)
                .OrderBy(x=> x.Nombre)
                .ToListAsync();
        }
    }
}
