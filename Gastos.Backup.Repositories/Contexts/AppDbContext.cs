using Gastos.Backup.Core.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;

namespace Gastos.Backup.Repositories.Contexts
{
    public class AppDbContext : DbContext
    {
        private readonly IConfiguration _configuration;

        public AppDbContext()
        {
            
        }

        //public AppDbContext(IConfiguration configuration)
        //{
        //    _configuration = configuration;
        //}


        public DbSet<ApartadoEntity> Apartado { get; set; }
        public DbSet<CategoriaEntity> Categoria { get; set; }
        public DbSet<CompraEntity> Compra { get; set; }
        public DbSet<DetalleDeApartadoEntity> DetalleDeApartado { get; set; }
        public DbSet<GastoEntity> Gasto { get; set; }
        public DbSet<PagoEntity> Pago { get; set; }
        public DbSet<PeriodoEntity> Periodo { get; set; }
        public DbSet<SubcategoriaEntity> Subcategoria { get; set; }
        public DbSet<TipoDeApartadoEntity> TipoDeApartado { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {               
                string db;
                string conectionString;

                //db = _configuration.GetSection("DbBackup").Value.ToString();
                //conectionString = _configuration.GetConnectionString(db);
                ////db = "SqlServer";
                ////conectionString = "Data Source=.\\SQLEXPRESS;Initial Catalog=Gastos; Persist Security Info=True;User ID=sa;Password=123456; TrustServerCertificate=True;";
                db = "MySqlBackup";
                conectionString = "Server=localhost; Port=3306; Database=gastos; Uid=root; Pwd=123456;";

                switch (db)
                {
                    case "MySqlBackup":
                        optionsBuilder.UseMySql(conectionString, ServerVersion.AutoDetect(conectionString));
                        break;
                    //case "SqlServer":
                    //    optionsBuilder.UseSqlServer(conectionString);
                    //    break;
                    default:
                        break;
                }
            }
        }

        //protected override void OnModelCreating(ModelBuilder modelBuilder)
        //{ 
        //    modelBuilder.Entity<CategoriaEntity>().HasData(
        //        new CategoriaEntity { Guid = Guid.NewGuid(), Nombre = "Entrada", EstaActivo = true},
        //        new CategoriaEntity { Guid = Guid.NewGuid(), Nombre = "Gastos", EstaActivo = true},
        //        new CategoriaEntity { Guid = Guid.NewGuid(), Nombre = "Apartado", EstaActivo = true}
        //    );
        //}


    }//end class
}
