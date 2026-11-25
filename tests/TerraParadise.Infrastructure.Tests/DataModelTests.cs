using Microsoft.EntityFrameworkCore;
using TerraParadise.Data.Generated;
using TerraParadise.Data.Generated.Models;

namespace TerraParadise.Infrastructure.Tests;

public sealed class DataModelTests
{
    [Fact]
    public void Existing_tables_remain_mapped_alongside_listings_and_bookings()
    {
        using var context = CreateContext();
        string[] expectedTables =
        [
            "Agency", "Alert", "AppUser", "AutonomousCommunity", "Comarca", "Favorite",
            "Feature", "Locality", "Municipality", "PriceHistory", "Property", "PropertyFeature",
            "PropertyImage", "PropertyListing", "PropertySource", "PropertyStatus", "PropertyType",
            "Province", "RentalBooking", "SavedSearch", "Source", "SubscriptionPlan", "UserSubscription"
        ];

        Assert.Equal(expectedTables.OrderBy(name => name),
            context.Model.GetEntityTypes().Select(entity => entity.GetTableName()).OrderBy(name => name));

        var property = context.Model.FindEntityType(typeof(Property))!;
        Assert.Equal(new[] { "AgencyId", "LocalityId", "MunicipalityId", "OwnerUserId", "PropertyStatusId", "PropertyTypeId" },
            property.GetForeignKeys().Select(key => key.Properties.Single().Name).OrderBy(name => name));
        Assert.True(property.FindProperty(nameof(Property.RowVersion))!.IsConcurrencyToken);
        Assert.Equal("decimal(18,2)", property.FindProperty(nameof(Property.Price))!.GetColumnType());
    }

    [Theory]
    [InlineData(typeof(PropertyListing), nameof(PropertyListing.PropertyId), typeof(Property), true, DeleteBehavior.Cascade, "FK_PropertyListing_Property")]
    [InlineData(typeof(RentalBooking), nameof(RentalBooking.PropertyListingId), typeof(PropertyListing), true, DeleteBehavior.ClientSetNull, "FK_RentalBooking_PropertyListing")]
    [InlineData(typeof(RentalBooking), nameof(RentalBooking.TenantUserId), typeof(AppUser), true, DeleteBehavior.ClientSetNull, "FK_RentalBooking_TenantUser")]
    [InlineData(typeof(PriceHistory), nameof(PriceHistory.PropertyListingId), typeof(PropertyListing), false, DeleteBehavior.ClientSetNull, "FK_PriceHistory_PropertyListing")]
    [InlineData(typeof(PriceHistory), nameof(PriceHistory.PropertyId), typeof(Property), true, DeleteBehavior.Cascade, "FK_PriceHistory_Property")]
    [InlineData(typeof(PriceHistory), nameof(PriceHistory.SourceId), typeof(Source), false, DeleteBehavior.ClientSetNull, "FK_PriceHistory_Source")]
    public void Relationships_preserve_database_requiredness_and_delete_behavior(
        Type dependentType, string foreignKeyProperty, Type principalType, bool required,
        DeleteBehavior deleteBehavior, string constraintName)
    {
        using var context = CreateContext();
        var entity = context.Model.FindEntityType(dependentType)!;
        var foreignKey = Assert.Single(entity.GetForeignKeys(),
            key => key.Properties.Single().Name == foreignKeyProperty);

        Assert.Equal(principalType, foreignKey.PrincipalEntityType.ClrType);
        Assert.Equal(required, foreignKey.IsRequired);
        Assert.Equal(!required, foreignKey.Properties.Single().IsNullable);
        Assert.Equal(deleteBehavior, foreignKey.DeleteBehavior);
        Assert.Equal(constraintName, foreignKey.GetConstraintName());
        Assert.NotNull(foreignKey.DependentToPrincipal);
        Assert.NotNull(foreignKey.PrincipalToDependent);
    }

    [Fact]
    public void Listing_and_booking_mapping_preserves_sql_types_defaults_and_indexes()
    {
        using var context = CreateContext();
        var listing = context.Model.FindEntityType(typeof(PropertyListing))!;
        var booking = context.Model.FindEntityType(typeof(RentalBooking))!;
        var activeMode = Assert.Single(listing.GetIndexes(),
            index => index.GetDatabaseName() == "UX_PropertyListing_Active_Mode");

        Assert.True(activeMode.IsUnique);
        Assert.Equal("([IsActive]=(1))", activeMode.GetFilter());
        Assert.Equal(new[] { "PropertyId", "OperationType", "PricePeriod" },
            activeMode.Properties.Select(property => property.Name));
        var dates = Assert.Single(booking.GetIndexes(),
            index => index.GetDatabaseName() == "IX_RentalBooking_Listing_Dates");
        Assert.Equal(new[] { "PropertyListingId", "StartDate", "EndDate" },
            dates.Properties.Select(property => property.Name));
        Assert.Equal("date", listing.FindProperty(nameof(PropertyListing.AvailableFromDate))!.GetColumnType());
        Assert.Equal("date", booking.FindProperty(nameof(RentalBooking.StartDate))!.GetColumnType());
        Assert.Equal("date", booking.FindProperty(nameof(RentalBooking.EndDate))!.GetColumnType());
        Assert.Equal("decimal(18,2)", listing.FindProperty(nameof(PropertyListing.Price))!.GetColumnType());
        Assert.Equal("decimal(18,2)", booking.FindProperty(nameof(RentalBooking.TotalAmount))!.GetColumnType());
        Assert.Equal("decimal(18,2)", booking.FindProperty(nameof(RentalBooking.UnitPriceSnapshot))!.GetColumnType());
        Assert.Equal(true, listing.FindProperty(nameof(PropertyListing.IsActive))!.GetDefaultValue());
        Assert.Equal("EUR", listing.FindProperty(nameof(PropertyListing.CurrencyCode))!.GetDefaultValue());
        Assert.Equal("Pending", booking.FindProperty(nameof(RentalBooking.Status))!.GetDefaultValue());
        Assert.Equal(1000, booking.FindProperty(nameof(RentalBooking.Notes))!.GetMaxLength());
    }

    private static TerraParadiseDataDbContext CreateContext()
    {
        var options = new DbContextOptionsBuilder<TerraParadiseDataDbContext>()
            .UseSqlServer("Server=(localdb)\\MSSQLLocalDB;Database=TerraParadiseDb;Integrated Security=True")
            .Options;

        return new TerraParadiseDataDbContext(options);
    }
}
