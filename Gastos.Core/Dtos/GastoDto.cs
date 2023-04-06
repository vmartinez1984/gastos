using System.ComponentModel.DataAnnotations;

namespace Gastos.Core.Dtos
{
    public class GastoDto : GastoBaseDto
    {
        public int Id { get; set; }

        public SubcategoriaDto Subcategoria { get; set; }
    }

    public class GastoDtoIn: GastoBaseDto
    {

        [Required]
        public int SubcategoriaId { get; set; }

    }
    
    public class GastoBaseDto
    {
        [Required]
        [StringLength(50)]
        public string Nombre { get; set; }

        [Required]
        [Range(0, 13000)]
        public decimal Cantidad { get; set; }

        public decimal Presupuesto { get; set; }

        [Required]
        public int PeriodoId { get; set; }

        [Required]        
        public Guid IdemPotency { get; set; } = Guid.NewGuid();
    }
}
