using AutoMapper;
using Gastos.BusinessLayer.Helpers;
using Gastos.Core.Dtos;
using Gastos.Core.Entities;
using Gastos.Core.Interfaces.IBusinessLayer;
using Gastos.Core.Interfaces.IRepositories;
using System.Text.RegularExpressions;

namespace Gastos.BusinessLayer.Bl
{
    public class PeriodoBl : BaseBl, IPeriodoBl
    {
        public PeriodoBl(IRepositorio repositorio, IMapper mapper) : base(repositorio, mapper)
        {
        }

        public async Task ActualizarAsync(PeriodoDtoIn item, string idGuid)
        {
            PeriodoEntity entity;

            entity = await ObtenerPeriodoEntityAsync(idGuid);
            entity.Nombre = item.Nombre;
            entity.FechaInicial = item.FechaInicial;    
            entity.FechaFinal = item.FechaFinal;

            await _repositorio.Periodo.ActualizarAsync(entity);
        }

        public async Task<IdDto> AgregarAsync(PeriodoDtoIn item)
        {
            PeriodoEntity entity;
            IdDto idDto;

            entity = _mapper.Map<PeriodoEntity>(item);
            entity.Id = await _repositorio.Periodo.AgregarAsync(entity);
            idDto = new IdDto
            {
                 Id = entity.Id,
                 Guid = entity.Guid
            };

            return idDto;
        }

        public async Task BorrarAsync(int id)
        {
            await _repositorio.Periodo.BorrarAsync(id);
        }

        public async Task BorrarAsync(string idGuid)
        {
            if (Regex.IsMatch(idGuid, @"^[0-9]+$"))
            {
               await BorrarAsync(Convert.ToInt32(idGuid));
            }
            else
            {
                Guid guid;

                guid = Guid.Parse(idGuid);

                await _repositorio.Periodo.BorrarAsync(guid);
            }
        }
        
        public async Task<PeriodoEntity> ObtenerPeriodoEntityAsync(string idGuid)
        {
            if (Regex.IsMatch(idGuid, @"^[0-9]+$"))
            {
              return await _repositorio.Periodo.ObtenerAsync(Convert.ToInt32(idGuid));
            }
            else
            {
                Guid guid;

                guid = Guid.Parse(idGuid);

                return await _repositorio.Periodo.ObtenerAsync(guid);
            }
        }

        public async Task<List<PeriodoDto>> ObtenerAsync()
        {
            List<PeriodoEntity> entities;
            List<PeriodoDto> list;

            entities = await _repositorio.Periodo.ObtenerAsync();
            list = _mapper.Map<List<PeriodoDto>>(entities);

            return list;
        }

        public async Task<PeriodoConDetallesDto> ObtenerPeriodoConDetallesAsync(string periodId)
        {
            PeriodoConDetallesDto periodo;
            PeriodoEntity periodoEntity;
            List<GastoDto> listaDeGastos;

            periodoEntity = await ObtenerPeriodoEntityAsync(periodId);
            listaDeGastos = _mapper.Map<List<GastoDto>>(await _repositorio.Gasto.ObtenerPorPeriodoIdAsync(periodoEntity.Id));
            periodo = new PeriodoConDetallesDto
            {
                Id = periodoEntity.Id,
                Nombre = periodoEntity.Nombre,
                FechaFinal = periodoEntity.FechaFinal,
                FechaInicial = periodoEntity.FechaInicial,
                ListaDeEntradas = listaDeGastos.Where(x => x.Subcategoria.Categoria.Nombre == "Entrada").ToList(),
                ListaDeGastos = listaDeGastos.Where(x => x.Subcategoria.Categoria.Nombre == "Gastos").ToList(),
                ListaDeApartados = await ObtenerListaDeApartados(listaDeGastos)
            };

            return periodo;
        }

        public async Task<PeriodoDto> ObtenerAsync(string guid)
        {
            PeriodoDto periodoDto;
            PeriodoEntity entity;
            Guid guid1;

            guid1 = Guid.Parse(guid);
            entity = await _repositorio.Periodo.ObtenerAsync(guid1);
            periodoDto = _mapper.Map<PeriodoDto>(entity);

            return periodoDto;
        }

        private async Task<List<GastoApartadoDto>> ObtenerListaDeApartados(List<GastoDto> listaDeGastos)
        {
            List<GastoApartadoDto> listaDeApartados;

            listaDeApartados = _mapper.Map<List<GastoApartadoDto>>(listaDeGastos.Where(x => x.Subcategoria.Categoria.Nombre == "Apartado").ToList());
            foreach (var item in listaDeApartados)
            {
                item.Total = await ObtenerTotalDeApartado(item.Subcategoria.Id);
            }

            return listaDeApartados;
        }

        private async Task<decimal> ObtenerTotalDeApartado(int subcategoriaId)
        {
            decimal total;

            total = await _repositorio.Apartado.ObtenerTotalPorSubcategoriaId(subcategoriaId);

            return total;
        }
    }
}
