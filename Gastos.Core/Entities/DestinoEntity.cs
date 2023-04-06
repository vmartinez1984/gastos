namespace Gastos.Core.Entities
{
    public class DestinoEntity
    {
        public int Id { get; set; }

        public string Nombre { get; set; }

        public decimal Presupuesto { get; set; }

        public bool EstaActivo { get; set; }
    }
}
