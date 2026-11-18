using System;
using System.Collections.Generic;

namespace TerraParadise.Data.Generated.Models;

public partial class PropertyImage
{
    public long PropertyImageId { get; set; }

    public long PropertyId { get; set; }

    public string ImageUrl { get; set; } = null!;

    public string? ThumbnailUrl { get; set; }

    public string? Caption { get; set; }

    public int DisplayOrder { get; set; }

    public bool IsPrimary { get; set; }

    public string? SourceImageUrl { get; set; }

    public DateTime CreatedAtUtc { get; set; }

    public virtual Property Property { get; set; } = null!;
}
