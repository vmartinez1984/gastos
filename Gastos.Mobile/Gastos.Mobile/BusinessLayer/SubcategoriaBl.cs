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
    public class SubcategoriaBl
    {
        private RepositorioApi _repositorioApi;
        private RepositorioSqlit _repositorioSqlit;

        public SubcategoriaBl(RepositorioApi repositorioApi, RepositorioSqlit repositorioSqlite)
        {
            this._repositorioApi = repositorioApi;
            this._repositorioSqlit = repositorioSqlite;
        }

        public async Task<List<SubcategoriaModel>> Sincronizar()
        {
            List<SubcategoriaModel> listaLocal;

            //sincronizar los de la ws a la dblocal                       
            //Borrar los que esten como inactivo en el ws
            await SincronizarBorradosWsConLocal();
            //Recorremos la lista ws y comparamos con los locales
            await SincronizarWsConLocal();
            ////Sincronizar local con ws
            await SincronizarLocalConWs();
            listaLocal = _repositorioSqlit.Subcategoria.ObtenerTodos();

            return listaLocal;
        }

        private async Task SincronizarBorradosWsConLocal()
        {
            try
            {
                List<SubcategoriaModel> listaLocal;

                //sincronizar los de la ws a la dblocal                
                listaLocal = _repositorioSqlit.Subcategoria.ObtenerTodos(false);
                foreach (var Subcategoria in listaLocal)
                {
                    await _repositorioApi.Subcategoria.BorrarAsync(Subcategoria.Guid);
                    _repositorioSqlit.Subcategoria.Borrar(Subcategoria.Guid, false);
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        private async Task SincronizarWsConLocal()
        {
            List<SubcategoriaDto> lista;
            List<SubcategoriaModel> listaLocal;

            //sincronizar los de la ws a la dblocal
            lista = await _repositorioApi.Subcategoria.ObtenerTodosAsync();
            ////obtnemo la lista local
            listaLocal = _repositorioSqlit.Subcategoria.ObtenerTodos();
            lista.ForEach(itemDto =>
            {
                SubcategoriaModel itemModel;

                itemModel = listaLocal.Where(x => x.Guid == itemDto.Guid).FirstOrDefault();
                if (itemModel == null)
                {
                    //insertamos el ws en el local
                    itemModel = new SubcategoriaModel
                    {
                        EstaSincronizado = true,
                        Guid = itemDto.Guid,
                        Nombre = itemDto.Nombre,
                        Cantidad = itemDto.Cantidad,
                        CategoriaId = itemDto.Categoria.Id,
                        EstaActivo = true,
                        CategoriaNombre = itemDto.Categoria.Nombre
                    };
                    _repositorioSqlit.Subcategoria.Agregar(itemModel);
                }
            });
        }

        private async Task SincronizarLocalConWs()
        {
            List<SubcategoriaModel> listaLocal;
            List<SubcategoriaModel> listaNoSinconizada;

            listaLocal = _repositorioSqlit.Subcategoria.ObtenerTodos();
            listaNoSinconizada = listaLocal.Where(x => x.EstaSincronizado == false).ToList();
            foreach (var item in listaNoSinconizada)
            {
                SubcategoriaDtoIn SubcategoriaDtoIn;

                SubcategoriaDtoIn = new SubcategoriaDtoIn
                {
                    Nombre = item.Nombre,
                    Cantidad = item.Cantidad,
                    CategoriaId = item.CategoriaId
                };

                await _repositorioApi.Subcategoria.AgregarAsync(SubcategoriaDtoIn);
            }
        }

        public List<SubcategoriaModel> ObtenerTodos()
        {
            List<SubcategoriaModel> listaLocal;

            listaLocal = _repositorioSqlit.Subcategoria.ObtenerTodos();

            return listaLocal;
        }

        internal void Guardar(SubcategoriaModel Subcategoria)
        {
            if (Subcategoria.Id == 0)
            {
                //AgregarAsync(Subcategoria);
                _repositorioSqlit.Subcategoria.Agregar(Subcategoria);
            }
            else
            {
                Actualizar(Subcategoria);
            }
        }

        private void Actualizar(SubcategoriaModel Subcategoria)
        {
            _repositorioSqlit.Subcategoria.Actualizar(Subcategoria);
        }

        private void AgregarAsync(SubcategoriaModel Subcategoria)
        {
            //1.- Guardar en local
            _repositorioSqlit.Subcategoria.Agregar(Subcategoria);
            //2.- Guardar en ws
            _ = Task.Run(async () =>
            {
                try
                {
                    SubcategoriaDtoIn SubcategoriaDtoIn;

                    SubcategoriaDtoIn = new SubcategoriaDtoIn
                    {
                        Nombre = Subcategoria.Nombre,
                        Cantidad = Subcategoria.Cantidad,
                        CategoriaId = Subcategoria.CategoriaId
                    };

                    await _repositorioApi.Subcategoria.AgregarAsync(Subcategoria);
                    Subcategoria.EstaSincronizado = true;
                    _repositorioSqlit.Subcategoria.Actualizar(Subcategoria);
                }
                catch (Exception)
                {
                    throw;
                }
            });
        }

        public void Borrar(SubcategoriaModel Subcategoria)
        {
            _repositorioSqlit.Subcategoria.Borrar(Subcategoria.Guid);
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
    }
}
