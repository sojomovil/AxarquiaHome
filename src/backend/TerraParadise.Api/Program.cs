using TerraParadise.Api;
using TerraParadise.Api.Agencies;
using TerraParadise.Application;
using TerraParadise.Infrastructure;

var builder = WebApplication.CreateBuilder(args);

builder.Services
    .AddApplication()
    .AddInfrastructure(builder.Configuration)
    .AddApiServices(builder.Configuration);

var app = builder.Build();

app.UseExceptionHandler();
if (app.Configuration.GetValue<bool>("Https:Redirect"))
{
    app.UseHttpsRedirection();
}

app.UseCors();
app.UseAuthorization();

if (app.Environment.IsDevelopment())
{
    app.MapOpenApi();
    app.MapAgencies();
}

app.MapHealthChecks("/health");
app.MapGet("/", () => Results.Ok(new { service = "TerraParadise.Api", status = "ready" }));

app.Run();

public partial class Program
{
}
