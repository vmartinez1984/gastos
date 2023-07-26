using AutoMapper;
using Gastos.Backup.Core.Entities;
using Gastos.Backup.Core.Interfaces;
using Gastos.Backup.Core.Interfaces.IRepositories;
using Gastos.Backup.Core.Interfaces.IServices;
using Gastos.Core.Dtos;

namespace Gastos.Backup.BusinessLayer.Bl
{
    public class ApartadoBl : IApartadoBl
    {
        private readonly IApartadoService _apartadoService;
        private readonly IMapper _mapper;
        private readonly IRepositorio _repositorio;

        public ApartadoBl(IApartadoService apartadoService, IMapper mapper, IRepositorio repositorio)
        {
            _apartadoService = apartadoService;
            _mapper = mapper;
            _repositorio = repositorio;
        }

        public async Task SincronizarAsync()
        {
            List<ApartadoDto> dtos;
            List<ApartadoEntity> entities;

            dtos = await _apartadoService.ObtenerTodos();
            entities = _mapper.Map<List<ApartadoEntity>>(dtos);
            foreach (var entity in entities)
            {
                bool existe;

                existe = _repositorio.Apartado.Existe(entity.Guid);
                if (existe)
                    await _repositorio.Apartado.ActualizarAsync(entity);
                else
                    await _repositorio.Apartado.AgregarAsync(entity);
            }
        }
    }
}