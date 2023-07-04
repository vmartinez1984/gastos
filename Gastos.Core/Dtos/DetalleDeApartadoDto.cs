using Gastos.Core.Validators;
using System;
using System.ComponentModel.DataAnnotations;
using System.Runtime.Serialization;
using System.Text.Json.Serialization;

namespace Gastos.Core.Dtos
{
    public class DetalleDeApartadoBaseDto
    {
        [Required]
        public int ApartadoId { get; set; }

        [Required]
        public decimal Cantidad { get; set; }

        [StringLength(255)]
        public string Nota { get; set; }

        [Required]
        public int PeriodoId { get; set; }

        //[Required]
        //public int SubcategoriaId { get; set; }
    }

    public class DetalleDeApartadoDtoIn : DetalleDeApartadoBaseDto 
    {
        [Required]
        public Guid Guid { get; set; }

        [Required]
        [MaxLength(36)]
        [ApartadoIdGuidValidar("ApartadoId", nameof(DetalleDeApartadoDtoIn))]
        [Display(Name = "Apartado")]
        public string ApartadoIdGuid { get; set; }

        [Required]
        public decimal Cantidad { get; set; }

        [StringLength(255)]
        public string Nota { get; set; }

        [Required]
        [MaxLength(36)]
        [PeriodoGuidValidar(nameof(DetalleDeApartadoDtoIn))]
        public string PeriodoIdGuid { get; set; } = "0";

        [JsonIgnore]
        public int ApartadoId { get; set; }

        [JsonIgnore]
        public int PeriodoId { get; set; }

        [JsonIgnore]
        public int SubcategoriaId { get; set; }

        [Required]
        [SubcategoriaIdGuidValidar(nameof(DetalleDeApartadoDtoIn))]
        [Display(Name = "Subcategoria")]
        public string SubcategoriaIdGuid { get; set; }
    }

    public class DetalleDeApartadoDto : DetalleDeApartadoBaseDto
    {
        [DataType(DataType.Date)]
        public DateTime FechaDeRegistro { get; set; }

        public int Id { get; set; }
        public Guid Guid { get; set; }
    }
}
