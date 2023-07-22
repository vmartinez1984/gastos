using AutoMapper;
using Gastos.BusinessLayer.Helpers;
using Gastos.Core.Dtos;
using Gastos.Core.Entities;
using Gastos.Core.Interfaces.IBusinessLayer;
using Gastos.Core.Interfaces.IRepositories;

namespace Gastos.BusinessLayer.Bl
{
    public class PagoBl : BaseBl, IPagoBl
    {
        public PagoBl(IRepositorio repositorio, IMapper mapper) : base(repositorio, mapper)
        {
        }

        public async Task ActualizarAsync(PagoDtoIn item, int id)
        {
            PagoEntity entity;

            entity = await _repositorio.Pago.ObtenerAsync(id);
            entity.CantidadDepositada = item.CantidadDepositada;
            entity.FechaDeDeposito = item.FechaDeDeposito;

            await _repositorio.Pago.ActualizarAsync(entity);
        }

        public Task<IdDto> AgregarAsync(PagoDtoIn item)
        {
            throw new NotImplementedException();
        }

        public Task BorrarAsync(int id)
        {
            throw new NotImplementedException();
        }

        public async Task<PagoDto> ObtenerAsync(int id)
        {
            PagoDto pago;
            PagoEntity entity;

            entity = await _repositorio.Pago.ObtenerAsync(id);
            pago = _mapper.Map<PagoDto>(entity);

            return pago;
        }
    }
}
