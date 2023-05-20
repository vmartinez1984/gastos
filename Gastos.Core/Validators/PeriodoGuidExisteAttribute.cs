using Gastos.Core.Interfaces.IBusinessLayer;
using System;
using System.ComponentModel.DataAnnotations;

namespace Gastos.Core.Validators
{
    internal class PeriodoGuidExisteAttribute: ValidationAttribute
    {
        protected override ValidationResult IsValid(object value, ValidationContext validationContext)
        {
            bool existe;            
            Guid guid;

            guid = Guid.Parse(value.ToString());
            var _unitOfWork = validationContext.GetService(typeof(IBl)) as IBl;
            existe = _unitOfWork.Periodo.Existe(guid);
            if(existe)
            {
                return new ValidationResult("Guid ya existe, pruebe con otro");
            }            
            if(guid == Guid.Empty)
            {
                return new ValidationResult("Guid no valido");
            }

            return ValidationResult.Success;
        }
    }
}
