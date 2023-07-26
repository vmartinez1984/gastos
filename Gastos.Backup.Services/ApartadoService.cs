using Gastos.Backup.Core.Interfaces.IServices;
using Gastos.Core.Dtos;
using Newtonsoft.Json;

namespace Gastos.Backup.Services
{
    public class ApartadoService :  BaseService, IApartadoService
    {
        string _url;
        public ApartadoService(IHttpClientFactory httpClientFactory) : base(httpClientFactory)
        {
            _url = _urlBase + "Apartados";
        }

        public async Task<List<ApartadoDto>> ObtenerTodos()
        {
            List<ApartadoDto> dtos;
            HttpResponseMessage response;
            HttpRequestMessage request;
            HttpClient httpClient;
            HttpClientHandler handler = new HttpClientHandler();
            handler.SslProtocols = System.Security.Authentication.SslProtocols.Tls12;
            httpClient = _httpClientFactory.CreateClient();

            request = new HttpRequestMessage(HttpMethod.Get, _url);
            response = await httpClient.SendAsync(request);
            if (response.IsSuccessStatusCode)
            {
                dtos = JsonConvert.DeserializeObject<List<ApartadoDto>>(await response.Content.ReadAsStringAsync());
            }
            else
            {
                throw new Exception(await response.Content.ReadAsStringAsync());
            }

            return dtos;
        }


        //public void Test()
        //{
        //    HttpClient httpClient = _httpClientFactory.CreateClient();
        //    HttpResponseMessage response;
        //    HttpClientHandler handler = new HttpClientHandler();
        //    handler.SslProtocols = System.Security.Authentication.SslProtocols.Tls12;

        //    HttpRequestMessage requestMessage = new HttpRequestMessage(HttpMethod.Post, ObtenerUrlDeLogin());

        //    requestMessage.Content = ObtenerCuerpoPeticionPts();
        //    requestMessage.Headers.Authorization = new AuthenticationHeaderValue("Basic", ObtenerCredencialesPts());
        //    requestMessage.Headers.Add("pCHANNEL", "BACKOFFICE");
        //    httpClient.DefaultRequestHeaders.Add("User-Agent", "TeCreemos");
        //    response = await httpClient.SendAsync(requestMessage);
        //}
    }

    public class BaseService
    {
        public readonly string _urlBase;
        public readonly IHttpClientFactory _httpClientFactory;

        public BaseService(IHttpClientFactory httpClientFactory)
        {
            _urlBase = "http://localhost:85/api/";
            _httpClientFactory = httpClientFactory;
        }
    }
}