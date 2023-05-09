using Gastos.Core.Dtos;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Threading.Tasks;

namespace Gastos.Mobile.RepositorioApis
{
    public class ApartadoRepositoryApi: RepositorioBase
    {
        string _url;
        public ApartadoRepositoryApi()
        {
            _url = urlBase + "/Apartados";
        }

        public async Task<List<ApartadoDto>> ObtenerTodosAsync()
        {
            List<ApartadoDto> lista;
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
                lista = JsonConvert.DeserializeObject<List<ApartadoDto>>(await response.Content.ReadAsStringAsync());
            else
                throw new Exception(await response.Content.ReadAsStringAsync());


            return lista;
        }

        internal async Task<Guid> AgregarAsync(ApartadoDtoIn itemWs)
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
            request.Content = new StringContent(JsonConvert.SerializeObject(itemWs), null, "application/json");
            response = await client.SendAsync(request);
            if (response.IsSuccessStatusCode)
                idDto = JsonConvert.DeserializeObject<IdDto>(await response.Content.ReadAsStringAsync());
            else
                throw new Exception(await response.Content.ReadAsStringAsync());

            return idDto.Guid;
        }

        internal Task BorrarAsync(Guid guid)
        {
            throw new NotImplementedException();
        }
    }
}
