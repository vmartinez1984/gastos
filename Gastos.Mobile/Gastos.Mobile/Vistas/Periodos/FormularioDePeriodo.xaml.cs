using Gastos.Mobile.Modelos;
using System;
using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace Gastos.Mobile.Vistas.Periodos
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class FormularioDePeriodo : ContentPage
    {
        PeriodoModel Periodo;

        public FormularioDePeriodo()
        {
            InitializeComponent();
            this.Periodo = new PeriodoModel
            {
                Guid = Guid.NewGuid()
            };
        }

        public FormularioDePeriodo(PeriodoModel periodo)
        {
            InitializeComponent();
            Periodo = periodo;
            DatePickerFinal.Date = Periodo.FechaFinal;
            DatePickerInicial.Date = Periodo.FechaInicial;
            EntryNombre.Text = Periodo.Nombre;
        }

        private async void BtnGuardar_Clicked(object sender, EventArgs e)
        {
            //Asignar los datos
            try
            {
                Periodo.EstaSincronizado = false;
                Periodo.FechaFinal = DatePickerFinal.Date;
                Periodo.FechaInicial = DatePickerInicial.Date;
                Periodo.Nombre = EntryNombre.Text;

                App.UnitOfWork.Periodo.Guardar(Periodo);
            }
            catch (Exception ex)
            {
                await DisplayAlert("Error", "Nacio pobre, \n " + ex.Message, "Ok");
            }

            await Navigation.PopAsync();
        }
    }
}