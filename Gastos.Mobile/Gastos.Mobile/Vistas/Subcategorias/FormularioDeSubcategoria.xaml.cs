using Gastos.Mobile.Modelos;
using System;
using System.Collections.Generic;
using System.Linq;
using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace Gastos.Mobile.Vistas.Subcategorias
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class FormularioDeSubcategoria : ContentPage
    {
        CategoriaModel Categoria;
        List<CategoriaModel> categorias;

        private SubcategoriaModel subcategoria;

        public FormularioDeSubcategoria()
        {
            InitializeComponent();
            this.Categoria = null;
            this.subcategoria = new SubcategoriaModel
            {
                EstaSincronizado = true,
                EstaActivo = true,
                Guid = Guid.NewGuid(),                
            };
            categorias = App.UnitOfWork.Categoria.ObtenerTodos();
            ListViewCategorias.ItemsSource = categorias;
        }

        public FormularioDeSubcategoria(SubcategoriaModel subcategoria)
        {
            InitializeComponent();
            this.subcategoria = subcategoria;
            this.subcategoria.EstaSincronizado = false;
            EntryNombre.Text = subcategoria.Nombre;
            EntryCantidad.Text = subcategoria.Cantidad.ToString();
            categorias = App.UnitOfWork.Categoria.ObtenerTodos();
            ListViewCategorias.ItemsSource = categorias;
            ListViewCategorias.SelectedItem = categorias.Where(x => x.Id == subcategoria.CategoriaId).FirstOrDefault();
            this.Categoria = categorias.Where(x => x.Id == subcategoria.CategoriaId).FirstOrDefault();
        }

        protected override void OnAppearing()
        {
            base.OnAppearing();

        }

        private void ListViewCategorias_ItemTapped(object sender, ItemTappedEventArgs e)
        {
            Categoria = (sender as ListView).SelectedItem as CategoriaModel;
        }

        private async void BtnGuardar_Clicked(object sender, System.EventArgs e)
        {
            subcategoria.Nombre = EntryNombre.Text;
            subcategoria.Cantidad = Convert.ToDecimal(EntryCantidad.Text);
            subcategoria.CategoriaId = Categoria.Id;
            subcategoria.CategoriaNombre = Categoria.Nombre;

            App.UnitOfWork.Subcategoria.Guardar(subcategoria);

            await Navigation.PopAsync();
        }
    }
}