using Gastos.Core.Dtos;
using Gastos.Mobile.Modelos;
using Gastos.Mobile.Vistas.Gastos;
using System;
using System.Linq;
using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace Gastos.Mobile.Vistas.Periodos
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class DetalleDelPeriodo : ContentPage
    {
        private readonly Guid periodoId;
        public DetalleDelPeriodo(Guid periodoId)
        {
            InitializeComponent();
            this.periodoId = periodoId;
        }

        protected override void OnAppearing()
        {
            base.OnAppearing();
            ObtenerDetalleDelPeriodo(periodoId);            
        }

        private async void ObtenerDetalleDelPeriodo(Guid periodoId)
        {
            try
            {
                PeriodoConDetallesModel periodo;

                periodo = App.UnitOfWork.Periodo.Obtener(periodoId);

                ListViewApartados.ItemsSource = periodo.ListaDeApartados;
                ListViewGastos.ItemsSource = periodo.ListaDeGastos;
                ListViewEntradas.ItemsSource = periodo.ListaDeEntradas;
                LabelTitulo.Text = $"{periodo.FechaInicial.ToShortDateString()}-{periodo.FechaFinal.ToShortDateString()}";
                this.Title = "Periodo " + periodo.Nombre;
                LabelGastos.Text = $"Gastos: {periodo.ListaDeGastos.Sum(x=> x.Cantidad).ToString("c")} Presupuesto: {periodo.ListaDeGastos.Sum(x => x.Presupuesto).ToString("c")}";
            }
            catch (Exception ex)
            {
                await DisplayAlert("Ocurrio un error", "Nacio pobre. " + ex.Message, ":(");
            }

        }

        private async void ListViewGastos_ItemTapped(object sender, ItemTappedEventArgs e)
        {
            GastoModel gastoModel;

            gastoModel = (sender as ListView).SelectedItem as GastoModel;
            if(gastoModel.CategoriaId == Categoria.Gastos)
            {
                await Navigation.PushAsync(new FormularioDeGasto(gastoModel));
            }
            else
            {
                await DisplayAlert("Ocurrio un error", "Nacio pobre. Aun no ha sido implementado el proceso", ":(");
            }
        }
    }
}