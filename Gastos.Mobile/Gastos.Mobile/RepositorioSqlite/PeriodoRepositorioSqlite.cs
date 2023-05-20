using Gastos.Mobile.Modelos;
using SQLite;
using System;
using System.Collections.Generic;
using System.Text;

namespace Gastos.Mobile.RepositorioSqlite
{
    public class PeriodoRepositorioSqlite
    {
        public SQLiteConnection _connection { get; set; }

        public PeriodoRepositorioSqlite(string path)
        {
            _connection = new SQLiteConnection(path);
            _connection.CreateTable<PeriodoModel>();
        }

        public int Agregar(PeriodoModel item)
        {
            return _connection.Insert(item);
        }

        public int Actualizar(PeriodoModel item)
        {
            return _connection.Update(item);
        }

        public List<PeriodoModel> ObtenerTodos(bool estaActivo = true)
        {
            List<PeriodoModel> lista;

            lista = _connection.Table<PeriodoModel>().Where(x => x.EstaActivo == estaActivo).ToList();

            return lista;
        }

        internal void Borrar(Guid guid, bool borradoSuave = true)
        {
            PeriodoModel periodo;

            periodo = _connection.Table<PeriodoModel>().Where(x => x.Guid == guid).FirstOrDefault();
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

        public PeriodoModel Obtener(Guid guid)
        {
            PeriodoModel periodo;

            periodo = _connection.Table<PeriodoModel>().Where(x => x.Guid == guid).FirstOrDefault();

            return periodo;
        }
    }
}
