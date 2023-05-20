using Gastos.Core.Dtos;
using Gastos.Mobile.Modelos;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Threading.Tasks;

namespace Gastos.Mobile.RepositorioApis
{
    public class PeriodoRepositorioApi : RepositorioBase
    {

        string _url;

        public PeriodoRepositorioApi()
        {
            _url = urlBase + "/Periodos";
        }

        public async Task<IdDto> AgregarAsync(PeriodoDtoIn periodo)
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
            request.Content = new StringContent(JsonConvert.SerializeObject(periodo), null, "application/json");
            response = await client.SendAsync(request);
            if (response.IsSuccessStatusCode)
                idDto = JsonConvert.DeserializeObject<IdDto>(await response.Content.ReadAsStringAsync());
            else
                throw new Exception(await response.Content.ReadAsStringAsync());

            return idDto;
        }

        public async Task<List<PeriodoDto>> ObtenerTodosAsync()
        {
            try
            {
                List<PeriodoDto> periodos;
                HttpRequestMessage request;
                HttpResponseMessage response;
                HttpClient client;

                client = new HttpClient(new HttpClientHandler
                {
                    ServerCertificateCustomValidationCallback = (sender, cert, chain, sslPolicyErrors) => { return true; }
                });
                request = new HttpRequestMessage(HttpMethod.Get, _url);
                //response = await client.SendAsync(request);
                response = client.SendAsync(request).Result;
                if (response.IsSuccessStatusCode)
                    periodos = JsonConvert.DeserializeObject<List<PeriodoDto>>(await response.Content.ReadAsStringAsync());
                else
                    throw new Exception(await response.Content.ReadAsStringAsync());

                return periodos;
            }
            catch (Exception)
            {

                throw;
            }
        }

        public async Task<PeriodoConDetallesDto> ObtenerAsync(Guid periodoId)
        {
            PeriodoConDetallesDto item;
            HttpRequestMessage request;
            HttpResponseMessage response;
            HttpClient client;

            client = new HttpClient(new HttpClientHandler
            {
                ServerCertificateCustomValidationCallback = (sender, cert, chain, sslPolicyErrors) => { return true; }
            });
            request = new HttpRequestMessage(HttpMethod.Get, _url + $"/{periodoId}/Gastos");
            response = await client.SendAsync(request);
            if (response.IsSuccessStatusCode)
                item = JsonConvert.DeserializeObject<PeriodoConDetallesDto>(await response.Content.ReadAsStringAsync());
            else
                throw new Exception(await response.Content.ReadAsStringAsync());


            return item;
        }

        internal async Task BorrarAsync(Guid periodoId)
        {
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

        internal Task ActualizarAsync(PeriodoModel periodo)
        {
            throw new NotImplementedException();
        }
    }//end class
}
