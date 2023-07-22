// See https://aka.ms/new-console-template for more information
using Gastos.Core.Dtos;
using Newtonsoft.Json;
using Newtonsoft.Json.Serialization;

Console.WriteLine("Hello, World!");


//using (var client = new HttpClient())
//{
//List<SubcategoriaDto> lista;
//    HttpRequestMessage request;
//    HttpResponseMessage response;

//    request = new HttpRequestMessage(HttpMethod.Get, "http://localhost:85/api/Subcategorias");
//    response = client.SendAsync(request).Result;
//    lista = new List<SubcategoriaDto>();
//    if (response.IsSuccessStatusCode)
//    {
//        lista = JsonConvert.DeserializeObject<List<SubcategoriaDto>>(response.Content.ReadAsStringAsync().Result);
//    }
//}

//foreach (var item in lista)
//{
//    using (var client = new HttpClient())
//    {
//        HttpRequestMessage request;
//        HttpResponseMessage response;
//        SubcategoriaDtoIn subcategoriaDtoIn;

//        subcategoriaDtoIn = new SubcategoriaDtoIn
//        {
//            Cantidad = item.Cantidad,
//            CategoriaId = item.Categoria.Id,
//            Guid = item.Guid,
//            Nombre = item.Nombre
//        };
//        request = new HttpRequestMessage(HttpMethod.Post, "http://localhost:8000/api/Subcategorias");
//        var serializerSettings = new JsonSerializerSettings();
//        serializerSettings.ContractResolver = new CamelCasePropertyNamesContractResolver();
//        var content = new StringContent(JsonConvert.SerializeObject(subcategoriaDtoIn, serializerSettings), null, "application/json");
//        request.Content = content;
//        response = client.SendAsync(request).Result;
//        if (response.IsSuccessStatusCode)
//        {
//            Console.WriteLine(response.Content.ReadAsStringAsync().Result);
//        }
//    }
//}

List<PeriodoDto> periodos;
using (var client = new HttpClient())
{
    HttpRequestMessage request;
    HttpResponseMessage response;

    request = new HttpRequestMessage(HttpMethod.Get, "http://localhost:85/api/Periodos");
    response = client.SendAsync(request).Result;
    periodos = new List<PeriodoDto>();
    if (response.IsSuccessStatusCode)
    {
        periodos = JsonConvert.DeserializeObject<List<PeriodoDto>>(response.Content.ReadAsStringAsync().Result);
    }
}

//foreach (var item in lista)
//{
//    using (var client = new HttpClient())
//    {
//        HttpRequestMessage request;
//        HttpResponseMessage response;
//        PeriodoDtoIn dtoIn;

//        dtoIn = new PeriodoDtoIn
//        {
//            FechaFinal = item.FechaFinal,
//            FechaInicial = item.FechaInicial,
//            Guid = item.Guid,
//            Nombre = item.Nombre
//        };
//        request = new HttpRequestMessage(HttpMethod.Post, "http://localhost:8000/api/Periodos");
//        var serializerSettings = new JsonSerializerSettings();
//        serializerSettings.ContractResolver = new CamelCasePropertyNamesContractResolver();
//        var content = new StringContent(JsonConvert.SerializeObject(dtoIn, serializerSettings), null, "application/json");
//        request.Content = content;
//        response = client.SendAsync(request).Result;
//        if (response.IsSuccessStatusCode)
//        {
//            Console.WriteLine(response.Content.ReadAsStringAsync().Result);
//        }
//    }
//}

foreach (var periodo in periodos)
{

    List<GastoDto> lista;
    using (var client = new HttpClient())
    {
        HttpRequestMessage request;
        HttpResponseMessage response;

        request = new HttpRequestMessage(HttpMethod.Get, "http://localhost:85/api/Gastos/Periodos/" + periodo.Id);
        response = client.SendAsync(request).Result;
        lista = new List<GastoDto>();
        if (response.IsSuccessStatusCode)
        {
            lista = JsonConvert.DeserializeObject<List<GastoDto>>(response.Content.ReadAsStringAsync().Result);
        }
    }

    foreach (var item in lista)
    {
        if (item.Cantidad > 0)
            using (var client = new HttpClient())
            {
                HttpRequestMessage request;
                HttpResponseMessage response;
                // GastoDtoIn dtoIn;

                var dtoIn = new
                {
                    Guid = item.IdemPotency,
                    Nombre = item.Nombre,
                    Cantidad = item.Cantidad,
                    PeriodoGuidId = periodo.Guid.ToString(),
                    SubcategoriaGuidId = item.Subcategoria.Guid.ToString(),
                    FechaDeRegistro = item.FechaDeRegistro
                };
                request = new HttpRequestMessage(HttpMethod.Post, "http://localhost:8000/api/Gastos");
                var serializerSettings = new JsonSerializerSettings();
                serializerSettings.ContractResolver = new CamelCasePropertyNamesContractResolver();
                var content = new StringContent(JsonConvert.SerializeObject(dtoIn, serializerSettings), null, "application/json");
                request.Content = content;
                response = client.SendAsync(request).Result;
                if (response.IsSuccessStatusCode)
                {
                    Console.WriteLine(response.Content.ReadAsStringAsync().Result);
                }
            }
    }
}