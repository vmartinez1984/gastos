using System;
using System.ComponentModel.DataAnnotations;

namespace Gastos.Core.Dtos
{
    public class GastoDto : GastoBaseDto
    {
        public int Id { get; set; }

        public SubcategoriaDto Subcategoria { get; set; }
        
        public decimal Presupuesto { get; set; }
        
        public decimal Total { get; set; }
    }    

    public class GastoDtoIn
    {

        [Required]
        public string SubcategoriaGuidId { get; set; }

        [Required]
        [StringLength(50)]
        public string Nombre { get; set; }

        [Required]
        [Range(0, 13000)]
        public decimal Cantidad { get; set; }


        [Required]
        public string PeriodoGuidId { get; set; }

        [Required]
        public Guid IdemPotency { get; set; } = Guid.NewGuid();
    }
    
    public class GastoDtoUpdate
    {       
        [Required]
        [StringLength(50)]
        public string Nombre { get; set; }

        [Required]
        [Range(0, 13000)]
        public decimal Cantidad { get; set; }

        [Required]
        public string SubcategoriaGuidId { get; set; }

        [Required]
        public string PeriodoGuidId { get; set; }
    }

    public class GastoBaseDto
    {
        [Required]
        [StringLength(50)]
        public string Nombre { get; set; }

        [Required]
        [Range(0, 13000)]
        public decimal Cantidad { get; set; }


        [Required]
        public int PeriodoId { get; set; }

        [Required]        
        public Guid IdemPotency { get; set; } = Guid.NewGuid();
    }
}
