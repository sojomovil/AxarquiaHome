using TerraParadise.Application.Properties;

namespace TerraParadise.Api.Properties;

internal static class PropertyEndpoints
{
    public static void MapProperties(this WebApplication app)
    {
        var group = app.MapGroup("/api/properties").WithTags("Propiedades");

        group.MapGet("", async (IPropertyService service, CancellationToken ct) =>
            TypedResults.Ok(await service.ListForSaleAsync(ct)))
            .WithSummary("Lista las propiedades publicadas en venta.");
    }
}
