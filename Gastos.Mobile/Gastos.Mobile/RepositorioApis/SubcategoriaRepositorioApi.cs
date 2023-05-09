using Gastos.Core.Dtos;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Threading.Tasks;

namespace Gastos.Mobile.RepositorioApis
{
    public class SubcategoriaRepositorioApi : RepositorioBase
    {
        string _url;

        public SubcategoriaRepositorioApi()
        {
            _url = urlBase + "/Subcategorias";
        }

        public async Task<IdDto> AgregarAsync(SubcategoriaDtoIn dtonIn)
        {
            HttpClient client;
            HttpRequestMessage request;
            HttpResponseMessage response;
            IdDto idDto;

            client = new HttpClient(new HttpClientHandler
            {
                ServerCertificateCustomValidationCallback = (sender, cert, chain, sslPolicyErrors) => { return true; }
            });
            request = new HttpRequestMessage(HttpMethod.Post, _url);
            request.Content = new StringContent(JsonConvert.SerializeObject(dtonIn), null, "application/json");
            response = await client.SendAsync(request);
            if (response.IsSuccessStatusCode)
                idDto = JsonConvert.DeserializeObject<IdDto>(await response.Content.ReadAsStringAsync());
            else
                throw new Exception(await response.Content.ReadAsStringAsync());

            return idDto;
        }

        public async Task<List<SubcategoriaDto>> ObtenerTodosAsync()
        {
            List<SubcategoriaDto> lista;
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
                lista = JsonConvert.DeserializeObject<List<SubcategoriaDto>>(await response.Content.ReadAsStringAsync());
            else
                throw new Exception(await response.Content.ReadAsStringAsync());


            return lista;
        }

        public async Task BorrarAsync(Guid guid)
        {
            HttpRequestMessage request;
            HttpResponseMessage response;
            HttpClient client;

            client = new HttpClient(new HttpClientHandler
            {
                ServerCertificateCustomValidationCallback = (sender, cert, chain, sslPolicyErrors) => { return true; }
            });
            request = new HttpRequestMessage(HttpMethod.Delete, _url + $"/{guid}");
            response = await client.SendAsync(request);
            if (!response.IsSuccessStatusCode)
                throw new Exception(await response.Content.ReadAsStringAsync());
        }
    }//end class
}
