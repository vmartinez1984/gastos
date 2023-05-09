using Gastos.Mobile.Vistas;
using Xamarin.Forms;

namespace Gastos.Mobile
{
    public partial class MainPage : MasterDetailPage
    {
        public MainPage()
        {
            InitializeComponent();
            this.Master = new Master();
            this.Detail = new NavigationPage(new Detail());
            App.MasterDetailPage = this;
        }
    }
}
