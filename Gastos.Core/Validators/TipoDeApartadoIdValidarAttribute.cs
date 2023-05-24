using Gastos.Core.Interfaces.IRepositories;
using System.ComponentModel.DataAnnotations;

namespace Gastos.Core.Validators
{
    internal class TipoDeApartadoIdValidarAttribute: ValidationAttribute
    {
        protected override ValidationResult IsValid(object value, ValidationContext validationContext)
        {
            bool existe;
            int id;

            id = int.Parse(value.ToString());
            var repositorio = validationContext.GetService(typeof(IRepositorio)) as IRepositorio;
            existe = repositorio.TipoDeApartado.Existe(id);
            if(!existe)
            {
                return new ValidationResult("CategoriaId no existe");
            }                       

            return ValidationResult.Success;
        }
    }
}
