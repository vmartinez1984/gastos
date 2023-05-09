using System;
using System.Threading.Tasks;
using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace Gastos.Mobile.Vistas
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class Detail : ContentPage
    {
        public Detail()
        {
            InitializeComponent();
        }

        protected override void OnAppearing()
        {
            base.OnAppearing();
        }

        private bool SincronizarPeriodos()
        {
            try
            {
                LabelDePeriodos.Text = "Sincronizando Periodos";
                _ = App.UnitOfWork.Periodo.Sincronizar().Result;
                LabelDePeriodos.Text = "Periodos sincronizados";
                return true;
            }
            catch (Exception ex)
            {
                LabelDePeriodos.Text = "Servidor no disponible" + ex.Message;
                return false;
            }

        }

        private async void SincronizarSubcategorias()
        {
            try
            {
                LabelDeSubcategorias.Text = "Sincronizando subcategorias";
                await App.UnitOfWork.Periodo.Sincronizar();
                LabelDeSubcategorias.Text = "Subcategorias sincronizados";
            }
            catch (Exception)
            {
                LabelDeSubcategorias.Text = "Servidor no disponible";
            }

        }

        private void BtnSincPeriodos_Clicked(object sender, EventArgs e)
        {
            if (SincronizarPeriodos())
            {
                SincronizarSubcategorias();
            }
        }

        private async void BtnSincCategorias_Clicked(object sender, EventArgs e)
        {
            await App.UnitOfWork.Categoria.Sincronizar();
        }

        private async void BtnSincSubategorias_Clicked(object sender, EventArgs e)
        {
            await App.UnitOfWork.Subcategoria.Sincronizar();
        }

        private async void BtnSincApartados_Clicked(object sender, EventArgs e)
        {
            await App.UnitOfWork.Apartado.Sincronizar();
        }
    }
}