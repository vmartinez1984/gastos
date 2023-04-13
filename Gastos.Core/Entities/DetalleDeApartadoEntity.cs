namespace Gastos.Core.Entities
{
    public class DetalleDeApartadoEntity
    {
        public int Id { get; set; }
                
        public int ApartadoId { get; set; }
                
        public decimal Cantidad { get; set; }
                
        public string Nota { get; set; }

        public DateTime FechaDeRegistro { get; set; } = DateTime.Now;

        public bool EstaActivo { get; set; } = true;
    }
}
