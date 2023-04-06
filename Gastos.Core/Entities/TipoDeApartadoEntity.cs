using System.ComponentModel.DataAnnotations;

namespace Gastos.Core.Entities
{
    public class TipoDeApartadoEntity
    {
        [Key]
        public int Id { get; set; }

        public string Nombre { get; set; }

        public bool EstaActivo { get; set; }       
    }
}