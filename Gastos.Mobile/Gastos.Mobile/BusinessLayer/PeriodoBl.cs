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
                await SincronizarPeriodosBorradosWsConLocal(lista);
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

        private async Task SincronizarPeriodosBorradosWsConLocal(List<PeriodoDto> lista)
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

        private async void SincronizarPeriodosLocalConWs()
        {
            List<PeriodoModel> listaLocal;

            listaLocal = _repositorioSqlit.Periodo.ObtenerTodos();
            listaLocal = listaLocal.Where(x => x.EstaSincronizado == false).ToList();
            foreach (var item in listaLocal)
            {
                PeriodoDtoIn periodoDtoIn;

                periodoDtoIn = new PeriodoDtoIn
                {
                    Nombre = item.Nombre,
                    FechaFinal = item.FechaFinal,
                    FechaInicial = item.FechaInicial,    
                    Guid = item.Guid,
                };
                IdDto idDto;

                idDto = await _repositorioApi.Periodo.AgregarAsync(periodoDtoIn);
                item.Guid = idDto.Guid;
                item.EstaSincronizado = true;
                _repositorioSqlit.Periodo.Actualizar(item);
            }
        }

        public List<PeriodoModel> ObtenerTodos()
        {
            List<PeriodoModel> listaLocal;

            listaLocal = _repositorioSqlit.Periodo.ObtenerTodos();

            return listaLocal;
        }

        public void Guardar(PeriodoModel periodo)
        {
            PeriodoModel periodoModel;

            periodoModel = _repositorioSqlit.Periodo.Obtener(periodo.Guid);
            if (periodoModel == null)
                _repositorioSqlit.Periodo.Agregar(periodo);
            else
                _repositorioSqlit.Periodo.Actualizar(periodo);
        }

        public void Borrar(PeriodoModel periodo)
        {
            _repositorioSqlit.Periodo.Borrar(periodo.Guid);
        }

        public PeriodoConDetallesModel Obtener(Guid periodoId)
        {
            PeriodoConDetallesModel periodo;
            PeriodoModel periodoModel;
            List<SubcategoriaModel> subcategorias;
            List<GastoModel> gastos;
            const int Gastos = 2;
            const int Apartado = 3;
            const int Entradas = 1;

            periodoModel = _repositorioSqlit.Periodo.Obtener(periodoId);
            gastos = _repositorioSqlit.Gasto.ObtenerTodos(periodoId);
            subcategorias = _repositorioSqlit.Subcategoria.ObtenerTodos();
            periodo = new PeriodoConDetallesModel
            {
                ListaDeApartados = ObtenerlistaDeGastos(subcategorias, gastos, periodoModel.Guid, Apartado),
                ListaDeGastos = ObtenerlistaDeGastos(subcategorias, gastos, periodoModel.Guid, Gastos),
                ListaDeEntradas = ObtenerlistaDeGastos(subcategorias, gastos, periodoModel.Guid, Entradas),
                FechaInicial = periodoModel.FechaInicial,
                FechaFinal = periodoModel.FechaFinal,
                Nombre = periodoModel.Nombre
            };

            return periodo;
        }

        private List<GastoModel> ObtenerlistaDeGastos(List<SubcategoriaModel> subcategorias, List<GastoModel> listaDeGastos, Guid periodoGuid, int categoriaId)
        {
            List<GastoModel> lista;
            lista = new List<GastoModel>();
            subcategorias.Where(x => x.CategoriaId == categoriaId).ToList().ForEach(subcategoria =>
            {
                GastoModel gasto;

                gasto = listaDeGastos.Where(y => y.SubcategoriaGuid == subcategoria.Guid).FirstOrDefault();
                if (gasto == null)
                {
                    gasto = new GastoModel
                    {
                        Cantidad = 0,
                        Nombre = string.Empty,
                        SubcategoriaGuid = subcategoria.Guid,
                        PeriodoGuid = periodoGuid,
                        Presupuesto = subcategoria.Cantidad,
                        SubcategoriaNombre = subcategoria.Nombre,
                        CategoriaId = categoriaId
                    };
                }
                else
                {
                    gasto.Presupuesto = subcategoria.Cantidad;
                }
                lista.Add(gasto);
            });

            return lista;
        }
    }//end class
}