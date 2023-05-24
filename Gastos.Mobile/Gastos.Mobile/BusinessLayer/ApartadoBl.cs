using Gastos.Core.Dtos;
using Gastos.Mobile.Modelos;
using Gastos.Mobile.RepositorioApis;
using Gastos.Mobile.RepositorioSqlite;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Gastos.Mobile.BusinessLayer
{
    public class ApartadoBl
    {
        private RepositorioApi _repositorioApi;
        private RepositorioSqlit _repositorioSqlite;

        public ApartadoBl(RepositorioApi repositorioApi, RepositorioSqlit repositorioSqlite)
        {
            _repositorioApi = repositorioApi;
            _repositorioSqlite = repositorioSqlite;
        }

        public async Task<List<ApartadoModel>> Sincronizar()
        {
            List<ApartadoModel> listaLocal;

            try
            {
                //Borrar los que esten como inactivo en el ws
                await SincronizarBorradosWsConLocal();
                //Recorremos la lista ws y comparamos con los locales
                await SincronizarWsConLocal();
                ////Sincronizar local con ws
                await SincronizarLocalConWs();

                listaLocal = _repositorioSqlite.Apartado.ObtenerTodos();
            }
            catch (Exception)
            {
                listaLocal = _repositorioSqlite.Apartado.ObtenerTodos();
            }

            return listaLocal;
        }

        private async Task SincronizarLocalConWs()
        {
            List<ApartadoModel> listaLocal;
            List<ApartadoModel> listaNoSinconizada;

            listaLocal = _repositorioSqlite.Apartado.ObtenerTodos();
            listaNoSinconizada = listaLocal.Where(x => x.EstaSincronizado == false).ToList();

            foreach (var item in listaNoSinconizada)
            {
                ApartadoDtoIn itemWs;

                itemWs = new ApartadoDtoIn
                {
                    Nombre = item.Nombre,
                    FechaFinal = item.FechaFinal,
                    FechaInicial = item.FechaInicial,
                    CantidadFinal = item.CantidadFinal,
                    CantidadInicial = item.CantidadInicial,
                    Intereses = item.Intereses,
                    //PeriodoId = item.PeriodoId,
                    SubcategoriaId = item.SubcategoriaId,
                    TipoDeApartadoId = item.TipoDeApartadoId
                };

                item.Guid = await _repositorioApi.Apartado.AgregarAsync(itemWs);
                item.EstaSincronizado = true;
                _repositorioSqlite.Apartado.Actualizar(item);
            }

        }

        private async Task SincronizarWsConLocal()
        {
            List<ApartadoDto> listaWs;
            List<ApartadoModel> listaLocal;

            listaLocal = _repositorioSqlite.Apartado.ObtenerTodos();
            listaWs = await _repositorioApi.Apartado.ObtenerTodosAsync();
            listaWs.ForEach(itemWs =>
            {
                ApartadoModel itemLocal;

                var guiString = itemWs.Guid.ToString();
                itemLocal = listaLocal.Where(x => x.Guid == itemWs.Guid).FirstOrDefault();
                if (itemLocal == null)
                {
                    //insertamos el ws en el local
                    itemLocal = new ApartadoModel
                    {
                        // Id = itemWs.Id,
                        DiasRestantes = itemWs.DiasRestantes,
                        TipoDeApartadoId = itemWs.TipoDeApartado.Id,
                        TipoDeApartadoNombre = itemWs.TipoDeApartado.Nombre,
                        Nombre = itemWs.Nombre,
                        Intereses = itemWs.Intereses,
                        CantidadInicial = itemWs.CantidadInicial,
                        CantidadFinal = itemWs.CantidadFinal,
                        FechaInicial = itemWs.FechaInicial,
                        FechaFinal = itemWs.FechaFinal,
                        EstaActivo = true,
                        PeriodoId = itemWs.PeriodoId,
                        SubcategoriaId = itemWs.SubcategoriaId,
                        EstaSincronizado = true,
                        Guid = itemWs.Guid
                    };
                    _repositorioSqlite.Apartado.Agregar(itemLocal);
                }
            });
        }

        private async Task SincronizarBorradosWsConLocal()
        {
            try
            {
                List<ApartadoModel> listaLocal;

                listaLocal = _repositorioSqlite.Apartado.ObtenerTodos(false);
                foreach (var item in listaLocal)
                {
                    await _repositorioApi.Apartado.BorrarAsync(item.Guid);
                    _repositorioSqlite.Apartado.Borrar(item.Guid, false);
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        public List<ApartadoModel> ObtenerTodos()
        {
            return _repositorioSqlite.Apartado.ObtenerTodos();
        }
    }
}
