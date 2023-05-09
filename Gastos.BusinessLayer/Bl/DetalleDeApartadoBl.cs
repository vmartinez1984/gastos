using AutoMapper;
using Gastos.BusinessLayer.Helpers;
using Gastos.Core.Dtos;
using Gastos.Core.Entities;
using Gastos.Core.Interfaces.IBusinessLayer;
using Gastos.Core.Interfaces.IRepositories;

namespace Gastos.BusinessLayer.Bl
{
    public class DetalleDeApartadoBl : BaseBl, IDetalleDeApartadoBl
    {
        public DetalleDeApartadoBl(IRepositorio repositorio, IMapper mapper) : base(repositorio, mapper)
        {
        }

        public Task ActualizarAsync(DetalleDeApartadoDtoIn item, int id)
        {
            throw new NotImplementedException();
        }

        public async Task<IdDto> AgregarAsync(DetalleDeApartadoDtoIn item)
        {
            DetalleDeApartadoEntity entity;

            entity = _mapper.Map<DetalleDeApartadoEntity>(item);
            await _repositorio.DetalleDeApartado.AgregarAsync(entity);
            await ActualizarApartadoAsync(item.ApartadoId);
            if (item.PeriodoId != 0) 
                await AgregarGastoAsync(item);

            return new IdDto { Id = entity.Id, Guid = entity.Guid };
        }

        private async Task AgregarGastoAsync(DetalleDeApartadoDtoIn item)
        {
            GastoEntity entity;

            entity = new GastoEntity
            {
                Cantidad = item.Cantidad,
                EstaActivo = true,
                FechaDeRegistro = DateTime.Now,
                IdemPotency = Guid.NewGuid(),
                PeriodoId = item.PeriodoId,
                SubcategoriaId = item.SubcategoriaId,
                Nombre = string.Empty
            };

            await _repositorio.Gasto.AgregarAsync(entity);
        }

        private async Task ActualizarApartadoAsync(int apartadoId)
        {
            decimal total;
            ApartadoEntity entity;

            total = await _repositorio.DetalleDeApartado.ObtenerTotalAsync(apartadoId);
            entity = await _repositorio.Apartado.ObtenerAsync(apartadoId);
            entity.CantidadInicial = total;

            await _repositorio.Apartado.ActualizarAsync(entity);
        }

        public Task BorrarAsync(int id)
        {
            throw new NotImplementedException();
        }

        public Task<DetalleDeApartadoDto> ObtenerAsync(int id)
        {
            throw new NotImplementedException();
        }

        public async Task<int> RetirarAsync(DetalleDeApartadoDtoIn item)
        {
            DetalleDeApartadoEntity entity;

            entity = _mapper.Map<DetalleDeApartadoEntity>(item);
            entity.Cantidad = entity.Cantidad * -1;
            await _repositorio.DetalleDeApartado.AgregarAsync(entity);
            await ActualizarApartadoAsync(item.ApartadoId);

            return entity.Id;
        }
    }
}
