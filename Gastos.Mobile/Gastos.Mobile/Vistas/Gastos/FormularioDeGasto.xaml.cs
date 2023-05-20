using Gastos.Mobile.Modelos;
using System;
using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace Gastos.Mobile.Vistas.Gastos
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class FormularioDeGasto : ContentPage
    {
        private GastoModel gastoModel;

        public FormularioDeGasto(GastoModel gastoModel)
        {
            InitializeComponent();
            this.gastoModel = gastoModel;
            LabelCategoriaNombre.Text = gastoModel.SubcategoriaNombre;
            LabelPresupuesto.Text = gastoModel.Presupuesto.ToString("c");
        }

        private async void BtnGuardar_Clicked(object sender, EventArgs e)
        {
            gastoModel.Cantidad = Convert.ToDecimal(EntryCantidad.Text);
            gastoModel.Nombre = EntryNombre.Text;
            gastoModel.EstaSincronizado = false;
            App.UnitOfWork.Gasto.Agregar(gastoModel);

            await Navigation.PopAsync();
        }
    }
}