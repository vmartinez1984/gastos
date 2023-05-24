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

        public decimal Cantidad { get; set; }

        public decimal Total { get; set; }

        public Guid Guid { get; set; }
    }

    public class SubcategoriaDtoIn
    {
        [Required]
        [CategoriaIdExiste]
        public int CategoriaId { get; set; }

        [Required]
        [StringLength(50)]
        public string Nombre { get; set; }

        [Required]
        [Range(0, int.MaxValue)]
        public decimal Cantidad { get; set; }

        [Required]
        [SubcategoriaGuidExiste]
        public Guid Guid { get; set; }
    }

    public class SubcategoriaDtoUpdate
    {
        [Required]
        [CategoriaIdExiste]
        public int CategoriaId { get; set; }

        [Required]
        [StringLength(50)]
        public string Nombre { get; set; }

        [Required]
        [Range(0, int.MaxValue)]
        public decimal Cantidad { get; set; }
    }
}