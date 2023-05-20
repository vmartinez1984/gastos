using Gastos.Mobile.Modelos;
using SQLite;
using System;
using System.Collections.Generic;
using Xamarin.Forms;

namespace Gastos.Mobile.RepositorioSqlite
{
    public class GastoRepositorySqlite
    {
        public SQLiteConnection _connection { get; set; }

        public GastoRepositorySqlite(string path)
        {
            _connection = new SQLiteConnection(path);
            _connection.CreateTable<GastoModel>();
        }

        public int Agregar(GastoModel item)
        {
            return _connection.Insert(item);
        }

        public int Actualizar(GastoModel item)
        {
            return _connection.Update(item);
        }

        public List<GastoModel> ObtenerTodos(Guid periodoGuid, bool estaActivo = true)
        {
            try
            {
                List<GastoModel> lista;

                lista = _connection.Table<GastoModel>().Where(x => x.PeriodoGuid == periodoGuid & x.EstaActivo == estaActivo).ToList();

                return lista;
            }
            catch (Exception ex)
            {
                var data = ex.Message;
                throw;
            }
        }

        public void Borrar(Guid guid, bool borradoSuave = true)
        {
            GastoModel periodo;

            periodo = _connection.Table<GastoModel>().Where(x => x.IdemPotency == guid).FirstOrDefault();
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

        internal GastoModel Obtener(Guid idemPotency)
        {
            GastoModel periodo;

            periodo = _connection.Table<GastoModel>().Where(x => x.IdemPotency == idemPotency).FirstOrDefault();

            return periodo;
        }
    }
}
