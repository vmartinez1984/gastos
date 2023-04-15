using AutoMapper;
using Gastos.BusinessLayer.Helpers;
using Gastos.Core.Dtos;
using Gastos.Core.Entities;
using Gastos.Core.Interfaces.IBusinessLayer;
using Gastos.Core.Interfaces.IRepositories;

namespace Gastos.BusinessLayer.Bl
{
    public class PeriodoBl : BaseBl, IPeriodoBl
    {
        public PeriodoBl(IRepositorio repositorio, IMapper mapper) : base(repositorio, mapper)
        {
        }

        public async Task ActualizarAsync(PeriodoDtoIn item, int id)
        {
            PeriodoEntity entity;

            entity = await _repositorio.Periodo.ObtenerAsync(id);
            entity.Nombre = item.Nombre;
            entity.FechaInicial = item.FechaInicial;    
            entity.FechaFinal = item.FechaFinal;

            await _repositorio.Periodo.ActualizarAsync(entity);
        }

        public async Task<int> AgregarAsync(PeriodoDtoIn item)
        {
            PeriodoEntity entity;

            entity = _mapper.Map<PeriodoEntity>(item);
            entity.Id = await _repositorio.Periodo.AgregarAsync(entity);

            return entity.Id;
        }

        public async Task BorrarAsync(int id)
        {
            await _repositorio.Periodo.BorrarAsync(id);
        }

        public async Task<List<PeriodoDto>> ObtenerAsync()
        {
            List<PeriodoEntity> entities;
            List<PeriodoDto> list;

            entities = await _repositorio.Periodo.ObtenerAsync();
            list = _mapper.Map<List<PeriodoDto>>(entities);

            return list;
        }

        public async Task<PeriodoConDetallesDto> ObtenerAsync(int periodId)
        {
            PeriodoConDetallesDto periodo;
            PeriodoEntity periodoEntity;
            List<GastoDto> listaDeGastos;

            periodoEntity = await _repositorio.Periodo.ObtenerAsync(periodId);
            listaDeGastos = _mapper.Map<List<GastoDto>>(await _repositorio.Gasto.ObtenerPorPeriodoIdAsync(periodId));
            periodo = new PeriodoConDetallesDto
            {
                Id = periodId,
                Nombre = periodoEntity.Nombre,
                FechaFinal = periodoEntity.FechaFinal,
                FechaInicial = periodoEntity.FechaInicial,
                ListaDeEntradas = listaDeGastos.Where(x => x.Subcategoria.Categoria.Nombre == "Entrada").ToList(),
                ListaDeGastos = listaDeGastos.Where(x => x.Subcategoria.Categoria.Nombre == "Gastos").ToList(),
                ListaDeApartados = await ObtenerListaDeApartados(listaDeGastos)
            };

            return periodo;
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
