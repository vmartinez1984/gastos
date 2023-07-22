using Gastos.Repositories.Helpers;
using Gastos.BusinessLayer.Helpers;
using Gastos.Core.Mappers;
using VMtz.RequestInspector;
using Vmartinez.RequestInspector.Extensores;
using System.Globalization;
using Microsoft.AspNetCore.Localization;
using Microsoft.Extensions.Options;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AgregarRepository();
builder.Services.AgregarBl();
builder.Services.AgregarMappers();
builder.Services.AddControllersWithViews();
builder.Services.AddRequestInpector();
//Lenguaje
builder.Services.Configure<RequestLocalizationOptions>(options =>
{
    var supportedCultures = new List<CultureInfo> { 
        //new CultureInfo("en-US") 
        new CultureInfo("es-MX")
    };
    options.DefaultRequestCulture = new RequestCulture(culture: "es-MX", uiCulture: "es-MX");
    options.SupportedCultures = supportedCultures;
    options.SupportedUICultures = supportedCultures;
    options.RequestCultureProviders.Insert(0, new QueryStringRequestCultureProvider());
});

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseMiddleware<RequestInspectorMiddleware>();
app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();

app.UseAuthorization();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

app.Run();
