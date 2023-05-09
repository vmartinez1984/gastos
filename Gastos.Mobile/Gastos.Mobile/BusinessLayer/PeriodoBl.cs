using Gastos.Core.Dtos;
using Gastos.Mobile.Modelos;
using Gastos.Mobile.RepositorioApis;
using Gastos.Mobile.RepositorioSqlite;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Gastos.Mobile.BusinessLayer
{
    public class PeriodoBl
    {
        RepositorioApi _repositorioApi;
        RepositorioSqlit _repositorioSqlit;

        public PeriodoBl(RepositorioApi repositorioApi, RepositorioSqlit repositorioSqlite)
        {
            _repositorioApi = repositorioApi;
            _repositorioSqlit = repositorioSqlite;
        }

        public async Task<List<PeriodoModel>> Sincronizar()
        {
            try
            {
                List<PeriodoDto> lista;
                List<PeriodoModel> listaLocal;

                //sincronizar los de la ws a la dblocal
                lista = await _repositorioApi.Periodo.ObtenerTodosAsync();
                ////obtnemo la lista local
                listaLocal = _repositorioSqlit.Periodo.ObtenerTodos();
                //Borrar los que esten como inactivo en el ws
                SincronizarPeriodosBorradosWsConLocal(lista);
                //Recorremos la lista ws y comparamos con los locales
                SincronizarPeriodosWsConLocal(lista, listaLocal);
                ////Sincronizar local con ws
                SincronizarPeriodosLocalConWs();
                listaLocal = _repositorioSqlit.Periodo.ObtenerTodos();

                return listaLocal;
            }
            catch (Exception)
            {

                throw;
            }
        }

        private void SincronizarPeriodosBorradosWsConLocal(List<PeriodoDto> lista)
        {
            _ = Task.Run(async () =>
            {
                try
                {
                    List<PeriodoModel> listaLocal;

                    listaLocal = _repositorioSqlit.Periodo.ObtenerTodos(false);
                    foreach (var periodo in listaLocal)
                    {
                        await _repositorioApi.Periodo.BorrarAsync(periodo.Guid);
                        _repositorioSqlit.Periodo.Borrar(periodo.Guid, false);
                    }
                }
                catch (Exception)
                {
                    throw;
                }
            });
        }

        private void SincronizarPeriodosWsConLocal(List<PeriodoDto> lista, List<PeriodoModel> listaLocal)
        {
            lista.ForEach(periodoWs =>
            {
                PeriodoModel periodoLocal;

                periodoLocal = listaLocal.Where(x => x.Guid == periodoWs.Guid).FirstOrDefault();
                if (periodoLocal == null)
                {
                    //insertamos el ws en el local
                    periodoLocal = new PeriodoModel
                    {
                        EstaSincronizado = true,
                        FechaFinal = periodoWs.FechaFinal,
                        FechaInicial = periodoWs.FechaInicial,
                        Guid = periodoWs.Guid,
                        Nombre = periodoWs.Nombre,
                    };
                    _repositorioSqlit.Periodo.Agregar(periodoLocal);
                }
            });
        }

        private void SincronizarPeriodosLocalConWs()
        {
            List<PeriodoModel> listaLocal;
            List<PeriodoModel> listaNoSinconizada;

            listaLocal = _repositorioSqlit.Periodo.ObtenerTodos();
            listaNoSinconizada = listaLocal.Where(x => x.EstaSincronizado == false).ToList();

            _ = Task.Run(async () =>
            {
                foreach (var item in listaNoSinconizada)
                {
                    PeriodoDtoIn periodoDtoIn;

                    periodoDtoIn = new PeriodoDtoIn
                    {
                        Nombre = item.Nombre,
                        FechaFinal = item.FechaFinal,
                        FechaInicial = item.FechaInicial,
                        Guid = item.Guid
                    };

                    await _repositorioApi.Periodo.AgregarAsync(periodoDtoIn);
                }
            });
        }

        public List<PeriodoModel> ObtenerTodos()
        {
            List<PeriodoModel> listaLocal;

            listaLocal = _repositorioSqlit.Periodo.ObtenerTodos();

            return listaLocal;
        }

        internal void Guardar(PeriodoModel periodo)
        {
            if (periodo.Id == 0)
            {
                _repositorioSqlit.Periodo.Agregar(periodo);
            }
            else
            {
                _repositorioSqlit.Periodo.Actualizar(periodo);
            }
        }

        private Task ActualizarAsync(PeriodoModel periodo)
        {
            throw new NotImplementedException();
        }

        private void AgregarAsync(PeriodoModel periodo)
        {
            //1.- Guardar en local
            _repositorioSqlit.Periodo.Agregar(periodo);
            //2.- Guardar en ws
            _ = Task.Run(async () =>
            {
                try
                {
                    PeriodoDtoIn periodoDtoIn;

                    periodoDtoIn = new PeriodoDtoIn
                    {
                        FechaFinal = periodo.FechaFinal,
                        FechaInicial = periodo.FechaInicial,
                        Guid = Guid.NewGuid(),
                        Nombre = periodo.Nombre
                    };

                    await _repositorioApi.Periodo.AgregarAsync(periodo);
                    periodo.EstaSincronizado = true;
                    _repositorioSqlit.Periodo.Actualizar(periodo);
                }
                catch (Exception)
                {
                    throw;
                }
            });
        }

        public void Borrar(PeriodoModel periodo)
        {
            _repositorioSqlit.Periodo.Borrar(periodo.Guid);
        }

        internal async Task<PeriodoConDetallesDto> ObtenerAsync(Guid periodoId)
        {
            PeriodoConDetallesDto periodo;
            List<SubcategoriaDto> subcategorias;

            periodo = await _repositorioApi.Periodo.ObtenerAsync(periodoId);
            if (periodo != null)
            {
                List<GastoApartadoDto> listaDeApartados;
                List<GastoDto> listaDeGastos;

                listaDeApartados = new List<GastoApartadoDto>();
                subcategorias = await _repositorioApi.Subcategoria.ObtenerTodosAsync();
                subcategorias.Where(x => x.Categoria.Id == 3).ToList().ForEach(subcategoria =>
                {
                    GastoApartadoDto gasto;

                    gasto = periodo.ListaDeApartados.Where(y => y.Subcategoria.Id == subcategoria.Id).FirstOrDefault();
                    if (gasto == null)
                    {
                        gasto = new GastoApartadoDto
                        {
                            Id = 0,
                            Subcategoria = subcategoria,
                            Cantidad = 0,
                            Nombre = string.Empty,
                            PeriodoId = periodo.Id,
                            Presupuesto = subcategoria.Cantidad,
                            Total = 0
                        };
                    }
                    listaDeApartados.Add(gasto);
                });
                periodo.ListaDeApartados = listaDeApartados;
                listaDeGastos = new List<GastoDto>();
                subcategorias.Where(x => x.Categoria.Id == 2).ToList().ForEach(subcategoria =>
                {
                    GastoDto gasto;

                    gasto = periodo.ListaDeGastos.Where(y => y.Subcategoria.Id == subcategoria.Id).FirstOrDefault();
                    if (gasto == null)
                    {
                        gasto = new GastoDto
                        {
                            Id = 0,
                            Subcategoria = subcategoria,
                            Cantidad = 0,
                            Nombre = string.Empty,
                            PeriodoId = periodo.Id,
                            Presupuesto = subcategoria.Cantidad
                        };
                    }
                    listaDeGastos.Add(gasto);
                });
                periodo.ListaDeGastos = listaDeGastos;
            }

            return periodo;
        }

    }//end class
}