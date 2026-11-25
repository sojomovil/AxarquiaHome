using System;
using System.Collections.Generic;

namespace TerraParadise.Data.Generated.Models;

public partial class PriceHistory
{
    public long PriceHistoryId { get; set; }

    public long PropertyId { get; set; }

    public decimal Price { get; set; }

    public decimal? PreviousPrice { get; set; }

    public string CurrencyCode { get; set; } = null!;

    public string ChangeType { get; set; } = null!;

    public DateTime RecordedAtUtc { get; set; }

    public int? SourceId { get; set; }

    public string? Notes { get; set; }

    public long? PropertyListingId { get; set; }

    public virtual Property Property { get; set; } = null!;

    public virtual PropertyListing? PropertyListing { get; set; }

    public virtual Source? Source { get; set; }
}
