using Gastos.Mobile.Modelos;
using System;
using System.Collections.Generic;
using System.Linq;
using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace Gastos.Mobile.Vistas.Subcategorias
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class ListaDeSubcategorias : ContentPage
    {
        private decimal _total;

        public ListaDeSubcategorias()
        {
            InitializeComponent();
        }

        protected override void OnAppearing()
        {
            base.OnAppearing();
            CargarAsync();
        }

        private void CargarAsync()
        {
            List<SubcategoriaModel> lista;
            
            lista = App.UnitOfWork.Subcategoria.ObtenerTodos();
            ListView.ItemsSource = lista;
            lista = lista.Where(x => x.CategoriaId != 1).ToList();
            _total = lista.Sum(x => x.Cantidad);
            LabelSubcategorias.Text = "Subcategorias " + _total.ToString("c");
        }
        
        private async void ToolBarItemAgregar_Clicked(object sender, EventArgs e)
        {           
            await Navigation.PushAsync(new FormularioDeSubcategoria());
        }

        private async void MenuItemBorrar_Clicked(object sender, EventArgs e)
        {
            SubcategoriaModel subcategoria;

            subcategoria = (sender as MenuItem).CommandParameter as SubcategoriaModel;
            if ( await DisplayAlert("Borrar", $"¿Desea borrar {subcategoria.Nombre} {subcategoria.Cantidad}?", "Simón", "Nel"))
            {
                App.UnitOfWork.Subcategoria.Borrar(subcategoria);
                CargarAsync();
            }
        }

        private async void MenuItemEditar_Clicked(object sender, EventArgs e)
        {
            SubcategoriaModel subcategoria;

            subcategoria = (sender as MenuItem).CommandParameter as SubcategoriaModel;

            await Navigation.PushAsync(new FormularioDeSubcategoria(subcategoria));
        }
    }
}