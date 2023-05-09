using Gastos.Mobile.Vistas.Apartados;
using Gastos.Mobile.Vistas.Periodos;
using Gastos.Mobile.Vistas.Subcategorias;
using System;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace Gastos.Mobile.Vistas
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class Master : ContentPage
    {
        public Master()
        {
            InitializeComponent();
        }

        private async void BtnPeriodos_Clicked(object sender, EventArgs e)
        {
            App.MasterDetailPage.IsPresented = false;
            await App.MasterDetailPage.Detail.Navigation.PushAsync(new ListaDePeriodos());
        }

        private async void BtnSubcategorias_Clicked(object sender, EventArgs e)
        {
            App.MasterDetailPage.IsPresented = false;
            await App.MasterDetailPage.Detail.Navigation.PushAsync(new ListaDeSubcategorias());

        }

        private async void BtnApartados_Clicked(object sender, EventArgs e)
        {
            App.MasterDetailPage.IsPresented = false;
            await App.MasterDetailPage.Detail.Navigation.PushAsync(new ListaDeApartados());
        }        
    }
}