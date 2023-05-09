using Gastos.Core.Dtos;
using System;
using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace Gastos.Mobile.Vistas.Periodos
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class DetalleDelPeriodo : ContentPage
    {
        public DetalleDelPeriodo(Guid periodoId)
        {
            InitializeComponent();
            ObtenerDetalleDelPeriodo(periodoId);
        }

        private async void ObtenerDetalleDelPeriodo(Guid periodoId)
        {
            try
            {
                PeriodoConDetallesDto periodo;

                periodo = await App.UnitOfWork.Periodo.ObtenerAsync(periodoId);

                ListViewApartados.ItemsSource = periodo.ListaDeApartados;
                ListViewGastos.ItemsSource = periodo.ListaDeGastos;
                ListViewEntradas.ItemsSource = periodo.ListaDeEntradas;
                LabelTitulo.Text = $"Perido {periodo.Nombre} {periodo.FechaInicial.ToShortDateString()}-{periodo.FechaFinal.ToShortDateString()}";
            }
            catch (Exception ex)
            {
                await DisplayAlert("Ocurrio un error", "Nacio pobre. " + ex.Message, ":(");
            }

        }

        private void ListViewGastos_ItemTapped(object sender, ItemTappedEventArgs e)
        {
            
        }
    }
}