using Gastos.Core.Dtos;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Threading.Tasks;

namespace Gastos.Mobile.RepositorioApis
{
    public class CategoriaRepositorioApi : RepositorioBase
    {
        string _url;

        public CategoriaRepositorioApi()
        {
            _url = urlBase + "/Categorias";
        }       

        public async Task<List<CategoriaDto>> ObtenerTodosAsync()
        {
            List<CategoriaDto> lista;
            HttpRequestMessage request;
            HttpResponseMessage response;
            HttpClient client;

            client = new HttpClient(new HttpClientHandler
            {
                ServerCertificateCustomValidationCallback = (sender, cert, chain, sslPolicyErrors) => { return true; }
            });
            request = new HttpRequestMessage(HttpMethod.Get, _url);
            response = await client.SendAsync(request);
            if (response.IsSuccessStatusCode)
                lista = JsonConvert.DeserializeObject<List<CategoriaDto>>(await response.Content.ReadAsStringAsync());
            else
                throw new Exception(await response.Content.ReadAsStringAsync());


            return lista;
        }        
    }//end class
}
