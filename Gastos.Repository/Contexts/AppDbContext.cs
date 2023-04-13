using Gastos.Core.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;

namespace Gastos.Repository.Contexts
{
    public class AppDbContext: DbContext
    {
        private readonly IConfiguration _configuration;

        public AppDbContext(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        public DbSet<ApartadoEntity> Apartado { get; set; }
        public DbSet<CategoriaEntity> Categoria { get; set; }
        public DbSet<DestinoEntity> Destino { get; set; }

        public DbSet<DetalleDeApartadoEntity> DetalleDeApartado { get; set; }
        public DbSet<GastoEntity> Gasto { get; set; }
        public DbSet<PeriodoEntity> Periodo { get; set; }
        public DbSet<SubcategoriaEntity> Subcategoria { get; set; }
        public DbSet<TipoDeApartadoEntity> TipoDeApartado { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                optionsBuilder.UseSqlServer(_configuration.GetConnectionString("SqlServer"));
            }
        }
    }
}
