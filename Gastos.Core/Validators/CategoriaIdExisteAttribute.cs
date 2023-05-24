using Gastos.Core.Interfaces.IBusinessLayer;
using System;
using System.ComponentModel.DataAnnotations;

namespace Gastos.Core.Validators
{
    internal class CategoriaIdExisteAttribute: ValidationAttribute
    {
        protected override ValidationResult IsValid(object value, ValidationContext validationContext)
        {
            bool existe;
            int id;

            id = int.Parse(value.ToString());
            var _unitOfWork = validationContext.GetService(typeof(IBl)) as IBl;
            existe = _unitOfWork.Categoria.Existe(id);
            if(!existe)
            {
                return new ValidationResult("CategoriaId no existe");
            }                       

            return ValidationResult.Success;
        }
    }
}
