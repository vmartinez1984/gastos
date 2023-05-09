using Gastos.Core.Dtos;
using Gastos.Mobile.Modelos;
using Gastos.Mobile.RepositorioApis;
using Gastos.Mobile.RepositorioSqlite;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Gastos.Mobile.BusinessLayer
{
    public class CategoriaBl
    {
        private RepositorioApi _repositorioApi;
        private RepositorioSqlit _repositorioSqlit;

        public CategoriaBl(RepositorioApi repositorioApi, RepositorioSqlit repositorioSqlite)
        {
            this._repositorioApi = repositorioApi;
            this._repositorioSqlit = repositorioSqlite;
        }

        public async Task<List<CategoriaModel>> Sincronizar()
        {
            List<CategoriaModel> listaLocal;

            //borramos los locales
            _repositorioSqlit.Categoria.BorrarTodos();
            //Recorremos la lista ws y comparamos con los locales
            await SincronizarWsConLocal();
            listaLocal = _repositorioSqlit.Categoria.ObtenerTodos();

            return listaLocal;
        }

        private async Task SincronizarWsConLocal()
        {
            List<CategoriaDto> lista;

            //sincronizar los de la ws a la dblocal
            lista = await _repositorioApi.Categoria.ObtenerTodosAsync();
            lista.ForEach(itemDto =>
            {
                CategoriaModel itemModel;

                //insertamos el ws en el local
                itemModel = new CategoriaModel
                {
                    Nombre = itemDto.Nombre,
                    Id = itemDto.Id
                };
                _repositorioSqlit.Categoria.Agregar(itemModel);

            });
        }

        public List<CategoriaModel> ObtenerTodos()
        {
            List<CategoriaModel> listaLocal;

            listaLocal = _repositorioSqlit.Categoria.ObtenerTodos();

            return listaLocal;
        }

    }//end class
}
