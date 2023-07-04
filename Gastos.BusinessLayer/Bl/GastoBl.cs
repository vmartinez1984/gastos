using AutoMapper;
using Gastos.BusinessLayer.Helpers;
using Gastos.Core.Dtos;
using Gastos.Core.Entities;
using Gastos.Core.Interfaces.IBusinessLayer;
using Gastos.Core.Interfaces.IRepositories;
using System.Text.RegularExpressions;
using System;
using System.Collections.Generic;

namespace Gastos.BusinessLayer.Bl
{
    public class GastoBl : BaseBl, IGastoBl
    {
        public GastoBl(IRepositorio repositorio, IMapper mapper) : base(repositorio, mapper)
        {
        }

        public async Task ActualizarAsync(GastoDtoIn item, int id)
        {
            GastoEntity entity;

            entity = await _repositorio.Gasto.ObtenerAsync(id);
            entity.PeriodoId = await ObtenerPeriodoId(item.PeriodoGuidId);
            entity.Nombre = item.Nombre;
            entity.SubcategoriaId = await ObtenerSubcategoriaId(item.SubcategoriaGuidId);
            entity.Cantidad = item.Cantidad;

            await _repositorio.Gasto.ActualizarAsync(entity);
        }

        public async Task<IdDto> AgregarAsync(GastoDtoIn item)
        {
            GastoEntity entity;

            entity = _mapper.Map<GastoEntity>(item);
            entity.PeriodoId = await ObtenerPeriodoId(item.PeriodoGuidId);
            entity.SubcategoriaId = await ObtenerSubcategoriaId(item.SubcategoriaGuidId);
            entity.Id = await _repositorio.Gasto.AgregarAsync(entity);

            return new IdDto { Id = entity.Id, Guid = entity.Guid };
        }

        private async Task<int> ObtenerSubcategoriaId(string idGuid)
        {
            SubcategoriaEntity entity;

            entity = await _repositorio.Subcategoria.ObtenerAsync(idGuid);

            return entity.Id;
        }

        private async Task<int> ObtenerPeriodoId(string idGuid)
        {
            PeriodoEntity entity;

            if (Regex.IsMatch(idGuid, @"^[0-9]+$"))
            {
                entity = await _repositorio.Periodo.ObtenerAsync(Convert.ToInt32(idGuid));
            }
            else
            {
                Guid guid;

                guid = Guid.Parse(idGuid);

                entity = await _repositorio.Periodo.ObtenerAsync(guid);
            }

            return entity.Id;
        }

        public Task BorrarAsync(int id)
        {
            throw new NotImplementedException();
        }

        public Task<List<GastoDto>> ObtenerAsync()
        {
            throw new NotImplementedException();
        }

        public async Task<GastoDto> ObtenerAsync(int id)
        {
            GastoEntity entity;
            GastoDto dto;

            entity = await _repositorio.Gasto.ObtenerAsync(id);
            dto = _mapper.Map<GastoDto>(entity);

            return dto;
        }

        public async Task<List<GastoDto>> ObtenerPorPeriodoIdAsync(int periodoId)
        {
            return _mapper.Map<List<GastoDto>>(await _repositorio.Gasto.ObtenerPorPeriodoIdAsync(periodoId));
        }

        public async Task<GastoDto> ObtenerAsync(string idGuid)
        {
            GastoEntity entity;
            GastoDto dto;

            entity = await _repositorio.Gasto.ObtenerAsync(idGuid);
            dto = _mapper.Map<GastoDto>(entity);

            return dto;
        }

        public async Task<List<GastoDto>> ObtenerListaDeGastosYSubcategorias(string idGuid)
        {
            PeriodoEntity periodoEntity;
            List<SubcategoriaEntity> subcategoriaEntities;
            List<GastoEntity> gastoEntities;
            List<GastoDto> gastoDtos;

            periodoEntity = await _repositorio.Periodo.ObtenerAsync(idGuid);
            subcategoriaEntities = await _repositorio.Subcategoria.ObtenerAsync();
            gastoEntities = await _repositorio.Gasto.ObtenerPorPeriodoIdAsync(periodoEntity.Id);
            gastoDtos = new List<GastoDto>();
            foreach (var subcategoria in subcategoriaEntities)
            {
                GastoDto gastoDto;
                GastoEntity gastoEntity;

                gastoEntity = gastoEntities.FirstOrDefault(gastoEntity => gastoEntity.SubcategoriaId == subcategoria.Id);
                if (gastoEntity == null)
                {
                    gastoDto = new GastoDto
                    {
                        Cantidad = 0,
                        Id = 0,
                        IdemPotency = Guid.NewGuid(),
                        Nombre = string.Empty,
                        PeriodoId = periodoEntity.Id,
                        Presupuesto = subcategoria.Cantidad,
                        Subcategoria = _mapper.Map<SubcategoriaDto>(subcategoria)
                    };
                }
                else
                {
                    gastoDto = _mapper.Map<GastoDto>(gastoEntity);
                    gastoDto.Presupuesto = subcategoria.Cantidad;
                }
                gastoDto.Total = await _repositorio.Apartado.ObtenerTotalPorSubcategoriaId(subcategoria.Id);
                gastoDto.Subcategoria.Total = gastoDto.Total;

                gastoDtos.Add(gastoDto);
            }

            return gastoDtos;
        }
    }
}
