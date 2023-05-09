using Gastos.Mobile.Modelos;
using SQLite;
using System;
using System.Collections.Generic;

namespace Gastos.Mobile.RepositorioSqlite
{
    public class SubcategoriaRepositorioSqlite
    {
        public SQLiteConnection _connection { get; set; }

        public SubcategoriaRepositorioSqlite(string path)
        {
            _connection = new SQLiteConnection(path);
            _connection.CreateTable<SubcategoriaModel>();
        }

        public int Agregar(SubcategoriaModel item)
        {
            return _connection.Insert(item);
        }

        public int Actualizar(SubcategoriaModel item)
        {
            return _connection.Update(item);
        }

        public List<SubcategoriaModel> ObtenerTodos(bool estaActivo = true)
        {
            try
            {
                List<SubcategoriaModel> lista;

                lista = _connection.Table<SubcategoriaModel>().Where(x => x.EstaActivo == estaActivo).ToList();

                return lista;
            }
            catch (Exception ex)
            {
                var data = ex.Message;
                throw;
            }
        }

        internal void Borrar(Guid guid, bool borradoSuave = true)
        {
            SubcategoriaModel periodo;

            periodo = _connection.Table<SubcategoriaModel>().Where(x => x.Guid == guid).FirstOrDefault();
            if (borradoSuave)
            {
                periodo.EstaActivo = false;
                _connection.Update(periodo);
            }
            else
            {
                _connection.Delete(periodo);
            }
        }
    }
}
