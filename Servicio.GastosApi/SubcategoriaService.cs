using System.Net.Http;

namespace Servicio.GastosApi
{
    public class SubcategoriaService
    {
        private readonly IHttpClientFactory _httpClientFactory;

        public SubcategoriaService(IHttpClientFactory httpClientFactory)
        {
            _httpClientFactory = httpClientFactory;
        }

        public async Task Agregar()
        {
            HttpClient client;

            client = _httpClientFactory.CreateClient();
        }
    }
}