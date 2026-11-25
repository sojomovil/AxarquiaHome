using System.Linq.Expressions;
using Microsoft.EntityFrameworkCore;
using TerraParadise.Application.Properties;
using TerraParadise.Data.Generated;
using TerraParadise.Data.Generated.Models;

namespace TerraParadise.Infrastructure.Persistence;

internal sealed class PropertyService(TerraParadiseDataDbContext database) : IPropertyService
{
    private static readonly Expression<Func<Property, PropertyListItemResponse>> Projection = property => new(
        property.PropertyId,
        property.Title,
        property.Price,
        property.CurrencyCode,
        property.PropertyType.Name,
        property.Municipality.Name,
        property.Locality != null ? property.Locality.Name : null,
        property.Bedrooms,
        property.Bathrooms,
        property.BuiltAreaM2,
        property.IsFeatured);

    public Task<PropertyListItemResponse[]> ListForSaleAsync(CancellationToken cancellationToken) =>
        database.Properties
            .AsNoTracking()
            .Where(property =>
                property.IsPublished
                && (property.OperationType == "Venta"
                    || property.OperationType == "venta"
                    || property.OperationType == "Sale"
                    || property.OperationType == "sale"))
            .OrderByDescending(property => property.IsFeatured)
            .ThenByDescending(property => property.PublishedAtUtc)
            .ThenByDescending(property => property.PropertyId)
            .Select(Projection)
            .ToArrayAsync(cancellationToken);
}
