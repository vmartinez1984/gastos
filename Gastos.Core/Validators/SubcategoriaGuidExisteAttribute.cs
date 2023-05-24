using Gastos.Core.Interfaces.IBusinessLayer;
using System;
using System.ComponentModel.DataAnnotations;
using System.Text.RegularExpressions;

namespace Gastos.Core.Validators
{
    internal class SubcategoriaGuidExisteAttribute : ValidationAttribute
    {
        protected override ValidationResult IsValid(object value, ValidationContext validationContext)
        {
            bool existe;
            Guid guid;

            if (string.IsNullOrEmpty(value.ToString()))
            {
                return new ValidationResult("Guid es obligatorio");
            }
            guid = Guid.Parse(value.ToString());
            var _unitOfWork = validationContext.GetService(typeof(IBl)) as IBl;
            existe = _unitOfWork.Subcategoria.Existe(guid);
            if (existe)
            {
                return new ValidationResult("Guid ya existe, pruebe con otro");
            }
            if (guid == Guid.Empty)
            {
                return new ValidationResult("Guid no valido");
            }

            return ValidationResult.Success;
        }
    }

    internal class SubcategoriaIdGuidValidarAttribute : ValidationAttribute
    {
        protected override ValidationResult IsValid(object value, ValidationContext validationContext)
        {
            bool existe;
            Guid guid;

            if (string.IsNullOrEmpty(value.ToString()))
            {
                return new ValidationResult("El Id o Guid es obligatorio");
            }
            if (Regex.IsMatch(value.ToString(), @"^[0-9]+$"))
            {
                //Todo bien es un Id
            }
            else if (Guid.TryParse(value.ToString(), out guid))
            {
                //Todo bien es un guid
            }
            else
            {
                return new ValidationResult("Guid no tiene el formato correspondiente");
            }
            var _unitOfWork = validationContext.GetService(typeof(IBl)) as IBl;
            existe = _unitOfWork.Subcategoria.ObtenerAsync(value.ToString()).Result == null ? false : true;
            if (existe == false)
            {
                return new ValidationResult("La SubcategoriaId Guid no existe");
            }

            return ValidationResult.Success;
        }
    }
}
