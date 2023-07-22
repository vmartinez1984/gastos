using Gastos.Core.Validators;
using System;
using System.ComponentModel.DataAnnotations;
using System.Text.Json.Serialization;

namespace Gastos.Core.Dtos
{
    public class GastoDto : GastoBaseDto
    {
        public int Id { get; set; }

        public SubcategoriaDto Subcategoria { get; set; }

        [DataType(DataType.Currency)]
        public decimal Presupuesto { get; set; }

        [DataType(DataType.Currency)]
        public decimal Total { get; set; }

        public DateTime FechaDeRegistro { get; set; }
    }    

    public class GastoDtoIn
    {

        [Required]
        [SubcategoriaIdGuidValidar]
        public string SubcategoriaGuidId { get; set; }
        [JsonIgnore]
        public int SubcategoriaId { get; set; }

        [Required(ErrorMessage = "El nombre es requerido")]
        [StringLength(50)]
        public string Nombre { get; set; }

        [Required]
        [Range(0, 13000)]
        public decimal Cantidad { get; set; }


        [Required]
        [PeriodoGuidValidar]
        public string PeriodoGuidId { get; set; }
        [JsonIgnore]
        public int PeriodoId { get; set; }

        [Required]
        public Guid Guid { get; set; } = Guid.NewGuid();

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
        [SubcategoriaIdGuidValidar]
        public string SubcategoriaGuidId { get; set; }

        [Required]
        [PeriodoGuidValidar]
        public string PeriodoGuidId { get; set; }
    }

    public class GastoBaseDto
    {
        [Required]
        [StringLength(50)]
        public string Nombre { get; set; }

        [Required]
        [Range(0, 13000)]
        [DataType(DataType.Currency)]
        public decimal Cantidad { get; set; }


        [Required]
        public int PeriodoId { get; set; }

        [Required]        
        public Guid IdemPotency { get; set; } = Guid.NewGuid();
    }
}
