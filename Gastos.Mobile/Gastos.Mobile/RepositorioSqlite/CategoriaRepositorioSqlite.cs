using Gastos.Mobile.Modelos;
using SQLite;
using System;
using System.Collections.Generic;
using System.Text;

namespace Gastos.Mobile.RepositorioSqlite
{
    public class CategoriaRepositorioSqlite
    {
        public SQLiteConnection _connection { get; set; }

        public CategoriaRepositorioSqlite(string path)
        {
            _connection = new SQLiteConnection(path);
            _connection.CreateTable<CategoriaModel>();
        }

        public int Agregar(CategoriaModel item)
        {
            return _connection.Insert(item);
        }


        public List<CategoriaModel> ObtenerTodos()
        {
            List<CategoriaModel> lista;

            lista = _connection.Table<CategoriaModel>().ToList();

            return lista;
        }

        internal void BorrarTodos()
        {
            List<CategoriaModel> lista;

            lista = ObtenerTodos();
            lista.ForEach(item =>
            {
                _connection.Delete(item);
            });

        }
    }
}
