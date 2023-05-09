using System.Linq;
using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace Gastos.Mobile.Vistas.Apartados
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class ListaDeApartados : ContentPage
    {
        public ListaDeApartados()
        {
            InitializeComponent();                        
        }

        protected override void OnAppearing()
        {
            base.OnAppearing();
            CargarApartadosAsync();
        }

        private void CargarApartadosAsync()
        {
            var lista =  App.UnitOfWork.Apartado.ObtenerTodos();
            ListView.ItemsSource = lista;
            Label.Text = lista.Sum(x => x.CantidadInicial).ToString("c") + "/" + lista.Sum(x => x.CantidadFinal).ToString("c");
        }
    }
}