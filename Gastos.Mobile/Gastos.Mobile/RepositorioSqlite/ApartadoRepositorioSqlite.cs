using Gastos.Mobile.Modelos;
using Gastos.Mobile.RepositorioApis;
using SQLite;
using System;
using System.Collections.Generic;

namespace Gastos.Mobile.RepositorioSqlite
{
    public class ApartadoRepositorioSqlite
    {     
        public SQLiteConnection _connection { get; set; }

        public ApartadoRepositorioSqlite(string path)
        {
            _connection = new SQLiteConnection(path);
            _connection.CreateTable<ApartadoModel>();
        }

        public int Agregar(ApartadoModel item)
        {
            return _connection.Insert(item);
        }

        public int Actualizar(ApartadoModel item)
        {
            return _connection.Update(item);
        }

        public List<ApartadoModel> ObtenerTodos(bool estaActivo = true)
        {
            List<ApartadoModel> lista;

            lista = _connection.Table<ApartadoModel>().Where(x => x.EstaActivo == estaActivo).ToList();

            return lista;
        }

        internal void Borrar(Guid guid, bool borradoSuave = true)
        {
            ApartadoModel periodo;

            periodo = _connection.Table<ApartadoModel>().Where(x => x.Guid == guid).FirstOrDefault();
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
