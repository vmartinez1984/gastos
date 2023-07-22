using Gastos.Mobile.BusinessLayer;
using System;
using Xamarin.Forms;

namespace Gastos.Mobile
{
    public partial class App : Application
    {
        public static UnitOfWork UnitOfWork { get; set; }

        public static MasterDetailPage MasterDetailPage { get; set; }

        public App()
        {
            InitializeComponent();
            IniciarBaseDeDatos();                 
            MainPage = new MainPage();
        }

        private void IniciarBaseDeDatos()
        {
            string path;
            string dbPath;

            path = Environment.GetFolderPath(Environment.SpecialFolder.LocalApplicationData);
            dbPath = System.IO.Path.Combine(path, "ToDo.db3");            
            UnitOfWork = new UnitOfWork(dbPath);
        }

        protected override void OnStart()
        {
        }

        protected override void OnSleep()
        {
        }

        protected override void OnResume()
        {
        }
    }
}
