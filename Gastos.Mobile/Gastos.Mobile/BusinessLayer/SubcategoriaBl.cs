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
                IdDto idDto;

                idDto = await _repositorioApi.Subcategoria.AgregarAsync(SubcategoriaDtoIn);
                item.Guid = idDto.Guid;
                item.EstaSincronizado = true;
                _repositorioSqlit.Subcategoria.Actualizar(item);
            }
        }

        public List<SubcategoriaModel> ObtenerTodos()
        {
            List<SubcategoriaModel> listaLocal;

            listaLocal = _repositorioSqlit.Subcategoria.ObtenerTodos();

            return listaLocal;
        }

        public void Guardar(SubcategoriaModel Subcategoria)
        {
            SubcategoriaModel subcategoria;

            subcategoria = _repositorioSqlit.Subcategoria.Obtener(Subcategoria.Guid);
            if (subcategoria == null)
                _repositorioSqlit.Subcategoria.Agregar(Subcategoria);
            else
            _repositorioSqlit.Subcategoria.Actualizar(Subcategoria);
        }        

        public void Borrar(SubcategoriaModel Subcategoria)
        {
            _repositorioSqlit.Subcategoria.Borrar(Subcategoria.Guid);
        }
    }
}
