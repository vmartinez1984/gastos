using System.ComponentModel.DataAnnotations;

namespace Gastos.Core.Dtos
{
    public class SubcategoriaDto
    {
        public int Id { get; set; }

        public CategoriaDto Categoria { get; set; }

        public string Nombre { get; set; }

        public decimal Cantidad { get; set; }
    }

    public class SubcategoriaDtoIn
    {
        [Required]
        public int CategoriaId { get; set; }

        [Required]
        [StringLength(50)]
        public string Nombre { get; set; }

        [Required]
        [Range(0, int.MaxValue)]
        public decimal Cantidad { get; set; }
    }

}