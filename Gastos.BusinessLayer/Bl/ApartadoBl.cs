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

        public async Task ActualizarAsync(ApartadoDtoUpdate item, int id)
        {
            ApartadoEntity entity;

            entity = await _repositorio.Apartado.ObtenerAsync(id);
            entity.FechaInicial = item.FechaInicial;
            entity.FechaFinal = item.FechaFinal;
            entity.CantidadInicial = item.CantidadInicial;
            entity.CantidadFinal = item.CantidadFinal;
            entity.Intereses = item.Intereses;
            //entity.SubcategoriaId = item.SubcategoriaId;
            //entity.TipoDeApartadoId = item.TipoDeApartadoId;
            entity.Nombre = item.Nombre;

            await _repositorio.Apartado.ActualizarAsync(entity);
        }

        public async Task<IdDto> AgregarAsync(ApartadoDtoIn item)
        {
            ApartadoEntity apartadoEntity;

            apartadoEntity = _mapper.Map<ApartadoEntity>(item);
            apartadoEntity.SubcategoriaId = _repositorio.Subcategoria.ObtenerAsync(item.SubcategoriaIdGuid).Result.Id;
            apartadoEntity.Id = await _repositorio.Apartado.AgregarAsync(apartadoEntity);
            //await AgregarDetalleDeApartadoAsync(apartadoEntity);
            //await ActualizarGasto(item);

            return new IdDto
            {
                Id = apartadoEntity.Id,
                Guid = apartadoEntity.Guid,
            };
        }

        //private async Task AgregarDetalleDeApartadoAsync(ApartadoEntity apartadoEntity)
        //{
        //    DetalleDeApartadoEntity detalleDeApartadoEntity;

        //    detalleDeApartadoEntity = new DetalleDeApartadoEntity
        //    {
        //        ApartadoId = apartadoEntity.Id,
        //        Cantidad = apartadoEntity.CantidadInicial,
        //        EstaActivo = true,
        //        FechaDeRegistro = DateTime.Now
        //    };

        //    await _repositorio.DetalleDeApartado.AgregarAsync(detalleDeApartadoEntity);
        //}

        //private async Task ActualizarGasto(ApartadoDtoIn item)
        //{
        //    GastoEntity gastoEntity;
        //    const int Apartados = 1;

        //    gastoEntity = await _repositorio.Gasto.ObtenerPorSubcategoriaIdAsync(Apartados, item.PeriodoId);
        //    if (gastoEntity == null)
        //    {
        //        gastoEntity = new GastoEntity
        //        {
        //            Cantidad = item.CantidadInicial,
        //            EstaActivo = true,
        //            Nombre = "Apartados",
        //            PeriodoId = item.PeriodoId,
        //            SubcategoriaId = item.SubcategoriaId,
        //            IdemPotency = Guid.NewGuid()
        //        };

        //        gastoEntity.Id = await _repositorio.Gasto.AgregarAsync(gastoEntity);
        //    }
        //    else
        //    {
        //        List<ApartadoEntity> apartadoEntities;

        //        apartadoEntities = await _repositorio.Apartado.ObtenerPorPeriodoAsync(item.PeriodoId);
        //        gastoEntity.Cantidad = apartadoEntities.Sum(x => x.CantidadInicial);

        //        await _repositorio.Gasto.ActualizarAsync(gastoEntity);
        //    }
        //}

        public async Task BorrarAsync(int id)
        {
            await _repositorio.Apartado.BorrarAsync(id);
        }

        public async Task<ApartadoDto> ObtenerAsync(int id)
        {
            ApartadoEntity entity;
            ApartadoDto item;

            entity = await _repositorio.Apartado.ObtenerAsync(id);
            item = _mapper.Map<ApartadoDto>(entity);
            item.ListaDeDetalles = await ObtenerListaDeDetallesAsync(id);

            return item;
        }

        private async Task<List<DetalleDeApartadoDto>> ObtenerListaDeDetallesAsync(int id)
        {
            List<DetalleDeApartadoEntity> entities;
            List<DetalleDeApartadoDto> list;

            entities = await _repositorio.DetalleDeApartado.ObtenerPorApartadoIdAsync(id);
            list = _mapper.Map<List<DetalleDeApartadoDto>>(entities);

            return list;
        }

        public async Task<List<ApartadoDto>> ObtenerApartadosPorSubcategoriaId(int subcategoriaId)
        {
            List<ApartadoDto> list;
            List<ApartadoEntity> entities;

            entities = await _repositorio.Apartado.ObtenerApartadosPorSubcategoriaId(subcategoriaId);
            list = _mapper.Map<List<ApartadoDto>>(entities);

            return list;
        }

        public async Task<List<ApartadoDto>> ObtenerAsync()
        {
            List<ApartadoDto> list;
            List<ApartadoEntity> entities;

            entities = await _repositorio.Apartado.ObtenerAsync();
            list = _mapper.Map<List<ApartadoDto>>(entities);
            foreach (var item in list)
            {
                item.ListaDeDetalles = await ObtenerListaDeDetallesAsync(item.Id);
            }

            return list;
        }

        public async Task<ApartadoDto> ObtenerAsync(string idGuid)
        {
            ApartadoEntity entity;
            ApartadoDto item;

            entity = await _repositorio.Apartado.ObtenerAsync(idGuid);
            item = _mapper.Map<ApartadoDto>(entity);
            if (item != null)
                item.ListaDeDetalles = await ObtenerListaDeDetallesAsync(entity.Id);

            return item;
        }

        public Task ActualizarAsync(ApartadoDtoIn item, int id)
        {
            throw new NotImplementedException();
        }

        public async Task ActualizarAsync(string idGuid, ApartadoDtoUpdate item)
        {
            ApartadoEntity entity;

            entity = await _repositorio.Apartado.ObtenerAsync(idGuid);
            entity.FechaInicial = item.FechaInicial;
            entity.FechaFinal = item.FechaFinal;
            entity.CantidadInicial = item.CantidadInicial;
            entity.CantidadFinal = item.CantidadFinal;
            entity.Intereses = item.Intereses;
            entity.SubcategoriaId = (await _repositorio.Subcategoria.ObtenerAsync(item.SubcategoriaIdGuid)).Id;
            entity.TipoDeApartadoId = item.TipoDeApartadoId;
            entity.Nombre = item.Nombre;

            await _repositorio.Apartado.ActualizarAsync(entity);
        }

        public async Task BorrarAsync(string idGuid)
        {
            await _repositorio.Apartado.BorrarAsync(idGuid);
        }
    }
}
