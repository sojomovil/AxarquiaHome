using System;
using System.Collections.Generic;

namespace TerraParadise.Data.Generated.Models;

public partial class Source
{
    public int SourceId { get; set; }

    public string Name { get; set; } = null!;

    public string? BaseUrl { get; set; }

    public string SourceType { get; set; } = null!;

    public bool IsAuthorized { get; set; }

    public bool IsActive { get; set; }

    public string? AccessNotes { get; set; }

    public DateTime CreatedAtUtc { get; set; }

    public DateTime? UpdatedAtUtc { get; set; }

    public virtual ICollection<PriceHistory> PriceHistories { get; set; } = new List<PriceHistory>();

    public virtual ICollection<PropertySource> PropertySources { get; set; } = new List<PropertySource>();
}
