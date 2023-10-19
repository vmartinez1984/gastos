namespace Gastos.Core.Dtos
{
    public class PresupuestoDto
    {
        public int Id { get; set; }
                
        public int SubcategoriaId { get; set; }
                
        public decimal Cantidad { get; set; }

        public decimal CantidadMeta { get; set; }
                
        public int VersionDelPresupuestoId { get; set; }

        public bool EstaActivo { get; set; }
    }

    public class PresupuestoDtoIn
    {       
       public int SubcategoriaId { get; set; }

        public decimal Cantidad { get; set; }

        public decimal CantidadMeta { get; set; }

        public int VersionDelPresupuestoId { get; set; }

        public bool EstaActivo { get; set; } = true;
    }
}