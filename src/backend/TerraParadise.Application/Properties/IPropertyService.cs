namespace TerraParadise.Application.Properties;

/// <summary>Propiedad publicada para el listado de venta.</summary>
public sealed record PropertyListItemResponse(
    long Id,
    string Title,
    decimal Price,
    string CurrencyCode,
    string PropertyType,
    string Municipality,
    string? Locality,
    byte? Bedrooms,
    byte? Bathrooms,
    decimal? BuiltAreaM2,
    bool IsFeatured);

public interface IPropertyService
{
    Task<PropertyListItemResponse[]> ListForSaleAsync(CancellationToken cancellationToken);
}
