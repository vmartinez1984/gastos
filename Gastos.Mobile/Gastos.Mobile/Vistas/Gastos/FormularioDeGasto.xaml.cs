using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace Gastos.Mobile.Vistas.Gastos
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class FormularioDeGasto : ContentPage
    {
        public FormularioDeGasto(int periodoId,int subcategoriaId )
        {
            InitializeComponent();
        }
    }
}