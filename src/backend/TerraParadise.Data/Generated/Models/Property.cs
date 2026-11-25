using System;
using System.Collections.Generic;

namespace TerraParadise.Data.Generated.Models;

public partial class Property
{
    public long PropertyId { get; set; }

    public short PropertyTypeId { get; set; }

    public short PropertyStatusId { get; set; }

    public int MunicipalityId { get; set; }

    public int? LocalityId { get; set; }

    public int? AgencyId { get; set; }

    public Guid? OwnerUserId { get; set; }

    public string Title { get; set; } = null!;

    public string? Description { get; set; }

    public string OperationType { get; set; } = null!;

    public decimal Price { get; set; }

    public string CurrencyCode { get; set; } = null!;

    public decimal? BuiltAreaM2 { get; set; }

    public decimal? UsableAreaM2 { get; set; }

    public decimal? PlotAreaM2 { get; set; }

    public byte? Bedrooms { get; set; }

    public byte? Bathrooms { get; set; }

    public short? FloorNumber { get; set; }

    public short? TotalFloors { get; set; }

    public short? YearBuilt { get; set; }

    public string? Address { get; set; }

    public string? PostalCode { get; set; }

    public decimal? Latitude { get; set; }

    public decimal? Longitude { get; set; }

    public int? DistanceToBeachM { get; set; }

    public bool? HasLift { get; set; }

    public bool? HasTerrace { get; set; }

    public bool? HasBalcony { get; set; }

    public bool? HasPool { get; set; }

    public bool? HasGarden { get; set; }

    public bool? HasParking { get; set; }

    public bool? HasAirConditioning { get; set; }

    public bool? IsFurnished { get; set; }

    public string? EnergyRating { get; set; }

    public string? ConditionDescription { get; set; }

    public bool IsPublished { get; set; }

    public bool IsFeatured { get; set; }

    public bool IsVerified { get; set; }

    public DateTime? PublishedAtUtc { get; set; }

    public DateTime? FirstDetectedAtUtc { get; set; }

    public DateTime? LastCheckedAtUtc { get; set; }

    public DateTime CreatedAtUtc { get; set; }

    public DateTime? UpdatedAtUtc { get; set; }

    public byte[] RowVersion { get; set; } = null!;

    public virtual Agency? Agency { get; set; }

    public virtual ICollection<Favorite> Favorites { get; set; } = new List<Favorite>();

    public virtual Locality? Locality { get; set; }

    public virtual Municipality Municipality { get; set; } = null!;

    public virtual AppUser? OwnerUser { get; set; }

    public virtual ICollection<PriceHistory> PriceHistories { get; set; } = new List<PriceHistory>();

    public virtual ICollection<PropertyFeature> PropertyFeatures { get; set; } = new List<PropertyFeature>();

    public virtual ICollection<PropertyImage> PropertyImages { get; set; } = new List<PropertyImage>();

    public virtual ICollection<PropertyListing> PropertyListings { get; set; } = new List<PropertyListing>();

    public virtual ICollection<PropertySource> PropertySources { get; set; } = new List<PropertySource>();

    public virtual PropertyStatus PropertyStatus { get; set; } = null!;

    public virtual PropertyType PropertyType { get; set; } = null!;
}
