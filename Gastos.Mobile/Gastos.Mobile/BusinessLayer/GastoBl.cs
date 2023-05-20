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
    public class GastoBl
    {
        private RepositorioApi _repositorioApi;
        private RepositorioSqlit _repositorioSqlite;

        public GastoBl(RepositorioApi repositorioApi, RepositorioSqlit repositorioSqlite)
        {
            this._repositorioApi = repositorioApi;
            this._repositorioSqlite = repositorioSqlite;
        }

        internal async Task Sincronizar()
        {
            List<PeriodoModel> listaLocal;

            //obtnemo la lista local de periodos
            listaLocal = _repositorioSqlite.Periodo.ObtenerTodos();
            foreach (var item in listaLocal)
            {
                //await SincronizarBorradosWsConLocal(item);
                await SincronizarWsConLocal(item);
                await SincronizarLocalConWs(item);
            }
        }

        private async Task SincronizarLocalConWs(PeriodoModel periodo)
        {
            List<GastoModel> listaLocal;
            List<GastoModel> listaNoSinconizada;

            listaLocal = _repositorioSqlite.Gasto.ObtenerTodos(periodo.Guid);
            listaNoSinconizada = listaLocal.Where(x => x.EstaSincronizado == false).ToList();

            foreach (var item in listaNoSinconizada)
            {
                GastoDtoIn dtoIn;

                dtoIn = new GastoDtoIn
                {
                    SubcategoriaGuidId = item.SubcategoriaGuid.ToString(),
                    Nombre = item.Nombre,
                    Cantidad = item.Cantidad,
                    PeriodoGuidId = item.PeriodoGuid.ToString(),
                    IdemPotency = item.IdemPotency,
                };

                await _repositorioApi.Gasto.AgregarAsync(dtoIn);
                item.EstaSincronizado = true;
                _repositorioSqlite.Gasto.Actualizar(item);                
            }
        }

        private async Task SincronizarWsConLocal(PeriodoModel item)
        {
            PeriodoConDetallesDto periodo;
            List<GastoModel> listaLocal;
            List<GastoDto> listaDeGastos;

            listaLocal = _repositorioSqlite.Gasto.ObtenerTodos(item.Guid);
            periodo = await _repositorioApi.Periodo.ObtenerAsync(item.Guid);
            listaDeGastos = new List<GastoDto>();
            listaDeGastos.AddRange(periodo.ListaDeGastos);
            listaDeGastos.AddRange(periodo.ListaDeApartados);
            listaDeGastos.AddRange(periodo.ListaDeEntradas);
            listaDeGastos.ForEach(gasto =>
            {
                GastoModel itemModel;

                itemModel = listaLocal.Where(x => x.IdemPotency == gasto.IdemPotency).FirstOrDefault();
                if (itemModel == null)
                {
                    itemModel = new GastoModel
                    {
                        Cantidad = gasto.Cantidad,
                        EstaActivo = true,
                        EstaSincronizado = true,
                        IdemPotency = gasto.IdemPotency,
                        Nombre = gasto.Nombre,
                        PeriodoGuid = periodo.Guid,
                        SubcategoriaGuid = gasto.Subcategoria.Guid,
                        SubcategoriaNombre = gasto.Subcategoria.Nombre
                    };
                    _repositorioSqlite.Gasto.Agregar(itemModel);
                }
            });
        }

        private async Task SincronizarBorradosWsConLocal(PeriodoModel item)
        {
            try
            {
                List<GastoModel> listaLocal;

                listaLocal = _repositorioSqlite.Gasto.ObtenerTodos(item.Guid);
                foreach (var periodo in listaLocal)
                {
                    await _repositorioApi.Gasto.BorrarAsync(periodo.IdemPotency);
                    _repositorioSqlite.Gasto.Borrar(periodo.IdemPotency, false);
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        internal void Agregar(GastoModel gastoModel)
        {
            GastoModel gasto;

            gasto = _repositorioSqlite.Gasto.Obtener(gastoModel.IdemPotency);
            if (gasto == null)
                _repositorioSqlite.Gasto.Agregar(gastoModel);
            else
                _repositorioSqlite.Gasto.Actualizar(gastoModel);
        }
    }
}
