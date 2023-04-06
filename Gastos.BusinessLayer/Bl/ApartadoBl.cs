using AutoMapper;
using Gastos.BusinessLayer.Helpers;
using Gastos.Core.Dtos;
using Gastos.Core.Entities;
using Gastos.Core.Interfaces.IBusinessLayer;
using Gastos.Core.Interfaces.IRepositories;

namespace Gastos.BusinessLayer.Bl
{
    public class ApartadoBl : BaseBl, IApartadoBl
    {
        public ApartadoBl(IRepositorio repositorio, IMapper mapper) : base(repositorio, mapper)
        {
        }

        public Task ActualizarAsync(ApartadoDtoIn item, int id)
        {
            throw new NotImplementedException();
        }

        public async Task<int> AgregarAsync(ApartadoDtoIn item)
        {
            ApartadoEntity apartadoEntity;

            apartadoEntity = _mapper.Map<ApartadoEntity>(item);
            apartadoEntity.Id = await _repositorio.Apartado.AgregarAsync(apartadoEntity);
            await ActualizarGasto(item);

            return apartadoEntity.Id;
        }

        private async Task ActualizarGasto(ApartadoDtoIn item)
        {
            GastoEntity gastoEntity;
            const int Apartados = 1;

            gastoEntity = await _repositorio.Gasto.ObtenerPorSubcategoriaIdAsync(Apartados, item.PeriodoId);
            if (gastoEntity == null)
            {
                gastoEntity = new GastoEntity
                {
                    Cantidad = item.CantidadInicial,
                    EstaActivo = true,
                    Nombre = "Apartados",
                    PeriodoId = item.PeriodoId,
                    SubcategoriaId = Apartados,                    
                };

                gastoEntity.Id = await _repositorio.Gasto.AgregarAsync(gastoEntity);
            }
            else
            {
                List<ApartadoEntity> apartadoEntities;

                apartadoEntities = await _repositorio.Apartado.ObtenerPorPeriodoAsync(item.PeriodoId);
                gastoEntity.Cantidad = apartadoEntities.Sum(x => x.CantidadInicial);

                await _repositorio.Gasto.ActualizarAsync(gastoEntity);
            }
        }

        public Task BorrarAsync(int id)
        {
            throw new NotImplementedException();
        }

        public Task<ApartadoDto> ObtenerAsync(int id)
        {
            throw new NotImplementedException();
        }
    }
}
