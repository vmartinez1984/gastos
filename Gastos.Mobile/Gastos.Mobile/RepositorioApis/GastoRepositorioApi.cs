using Gastos.Core.Dtos;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

namespace Gastos.Mobile.RepositorioApis
{
    public class GastoRepositorioApi : RepositorioBase
    {
        string _url;

        public GastoRepositorioApi()
        {
            _url = urlBase + "/Gastos";
        }

        public async Task BorrarAsync(Guid periodoId)
        {
            new NotImplementedException();
            HttpRequestMessage request;
            HttpResponseMessage response;
            HttpClient client;

            client = new HttpClient(new HttpClientHandler
            {
                ServerCertificateCustomValidationCallback = (sender, cert, chain, sslPolicyErrors) => { return true; }
            });
            request = new HttpRequestMessage(HttpMethod.Delete, _url + $"/{periodoId}");
            response = await client.SendAsync(request);
            if (!response.IsSuccessStatusCode)
                throw new Exception(await response.Content.ReadAsStringAsync());
        }

        internal async Task<IdDto> AgregarAsync(GastoDtoIn gastoDtoIn)
        {
            HttpRequestMessage request;
            HttpResponseMessage response;
            HttpClient client;
            IdDto idDto;

            client = new HttpClient(new HttpClientHandler
            {
                ServerCertificateCustomValidationCallback = (sender, cert, chain, sslPolicyErrors) => { return true; }
            });
            request = new HttpRequestMessage(HttpMethod.Post, _url);
            request.Content = new StringContent(JsonConvert.SerializeObject(gastoDtoIn), null, "application/json");
            response = await client.SendAsync(request);
            if (response.IsSuccessStatusCode)
                idDto = JsonConvert.DeserializeObject<IdDto>(await response.Content.ReadAsStringAsync());
            else
                throw new Exception(await response.Content.ReadAsStringAsync());

            return idDto;
        }
    }
}
