using Gastos.Mobile.Modelos;
using System;
using System.Collections.Generic;
using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace Gastos.Mobile.Vistas.Periodos
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class ListaDePeriodos : ContentPage
    {
        public ListaDePeriodos()
        {
            InitializeComponent();
        }

        protected override void OnAppearing()
        {
            base.OnAppearing();
            CargarDeDb();
        }

        private void CargarDeDb()
        {
            List<PeriodoModel> listaLocal;

            listaLocal = App.UnitOfWork.Periodo.ObtenerTodos();

            ListViewPeriodos.ItemsSource = listaLocal;
            LabelCargando.IsVisible = false;
        }


        private async void ToolbarItem_Clicked(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new FormularioDePeriodo());
        }

        private async void ListViewPeriodos_ItemTapped(object sender, ItemTappedEventArgs e)
        {
            PeriodoModel periodo;

            periodo = (sender as ListView).SelectedItem as PeriodoModel;
            
            await Navigation.PushAsync(new DetalleDelPeriodo(periodo.Guid));
        }

        private async void MenuItemBorrar_Clicked(object sender, EventArgs e)
        {
            PeriodoModel periodoDto;

            periodoDto = (sender as MenuItem).CommandParameter as PeriodoModel;

            if (await DisplayAlert("Borrar", $"¿Dese borrar el periodo {periodoDto.Nombre}?", "Simón", "Nel"))
            {
                App.UnitOfWork.Periodo.Borrar(periodoDto);
                ListViewPeriodos.ItemsSource = App.UnitOfWork.Periodo.ObtenerTodos();
            }
        }

        private async void MenuItemEditar_Clicked(object sender, EventArgs e)
        {
            PeriodoModel periodo;

            periodo = (sender as MenuItem).CommandParameter as PeriodoModel;

            await Navigation.PushAsync(new FormularioDePeriodo(periodo));
        }
    }
}