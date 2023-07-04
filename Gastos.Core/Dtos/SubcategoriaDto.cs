using Gastos.Core.Validators;
using System;
using System.ComponentModel.DataAnnotations;

namespace Gastos.Core.Dtos
{
    public class SubcategoriaDto
    {
        public int Id { get; set; }

        public CategoriaDto Categoria { get; set; }

        public string Nombre { get; set; }

        [DataType(DataType.Currency)]
        public decimal Cantidad { get; set; }

        [DataType(DataType.Currency)]
        public decimal Total { get; set; }

        public Guid Guid { get; set; }
    }

    public class SubcategoriaDtoIn
    {
        [Required(ErrorMessage = "Seleccione una categoria")]
        [CategoriaIdExiste("Seleccione una categoria valida")]
        [Display(Name = "Categoria")]
        public int CategoriaId { get; set; }

        [Required(ErrorMessage = "El Nombre es requerido")]
        [StringLength(50)]
        public string Nombre { get; set; }

        [Required(ErrorMessage = "La cantidad es requerida")]
        [Range(0, int.MaxValue, ErrorMessage = "La cantidad debe estar entre {0} y {1}")]
        public decimal Cantidad { get; set; }

        [Required(ErrorMessage = "El Guid es requerido")]
        [SubcategoriaGuidExiste]
        public Guid Guid { get; set; }
    }

    public class SubcategoriaDtoUpdate
    {
        [Required]
        [CategoriaIdExiste("Seleccione una categoria valida")]
        public int CategoriaId { get; set; }

        [Required]
        [StringLength(50)]
        public string Nombre { get; set; }

        [Required]
        [Range(0, int.MaxValue)]
        public decimal Cantidad { get; set; }
    }
}