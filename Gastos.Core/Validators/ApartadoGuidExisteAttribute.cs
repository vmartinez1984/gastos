using Gastos.Core.Dtos;
using Gastos.Core.Interfaces.IBusinessLayer;
using Gastos.Core.Interfaces.IRepositories;
using System;
using System.ComponentModel.DataAnnotations;
using System.Text.RegularExpressions;

namespace Gastos.Core.Validators
{
    internal class ApartadoGuidExisteAttribute: ValidationAttribute
    {
        protected override ValidationResult IsValid(object value, ValidationContext validationContext)
        {
            bool existe;
            Guid guid;

            guid = Guid.Parse(value.ToString());
            var repositorio = validationContext.GetService(typeof(IRepositorio)) as IRepositorio;
            existe = repositorio.Apartado.Existe(guid);
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

    public class ApartadoIdGuidValidarAttribute : ValidationAttribute
    {
        private string Clase;

        public ApartadoIdGuidValidarAttribute()
        {
            
        }

        public ApartadoIdGuidValidarAttribute(string atributoDestino, string clase)
        {
            this.Clase = clase;
            this.AtributoDestino = atributoDestino;
        }

        public string AtributoDestino { get; }

        protected override ValidationResult IsValid(object value, ValidationContext validationContext)
        {
            bool existe;
            Guid guid;
            ApartadoDto apartado;
            if (string.IsNullOrEmpty(value.ToString()))
            {
                return new ValidationResult("El Id o Guid es obligatorio");
            }
            if (Regex.IsMatch(value.ToString(), @"^[0-9]+$"))
            {
                //Todo bien es un Id
                if (Int32.TryParse(value.ToString(),out int id))
                {

                }
                else
                {
                    return new ValidationResult("El Id es invalido");
                }
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
            apartado = _unitOfWork.Apartado.ObtenerAsync(value.ToString()).Result;
            if (apartado == null)
            {
                return new ValidationResult("El apartadoGuid no existe");
            }
            else
            {
                if(validationContext.ObjectType.Name == Clase)
                {
                    (validationContext.ObjectInstance as DetalleDeApartadoDtoIn).ApartadoId = apartado.Id;
                }
            }

            return ValidationResult.Success;
        }
    }
}
