using System.ComponentModel.DataAnnotations;

namespace Gastos.Core.Entities
{
    public class CategoriaEntity
    {
        [Key]
        public int Id { get; set; }

        public string Nombre { get; set; }

        public bool EstaActivo { get; set; }
    }
}