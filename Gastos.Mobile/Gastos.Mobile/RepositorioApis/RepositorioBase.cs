using System;
using System.Collections.Generic;
using System.Text;

namespace Gastos.Mobile.RepositorioApis
{
    public class RepositorioBase
    {
        public string urlBase
        {
            get { return "http://192.168.1.86:8081/v1/api"; }
        }
    }
}
