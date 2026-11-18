using System;
using System.Collections.Generic;

namespace TerraParadise.Data.Generated.Models;

public partial class PropertyFeature
{
    public long PropertyId { get; set; }

    public int FeatureId { get; set; }

    public bool? BooleanValue { get; set; }

    public decimal? NumberValue { get; set; }

    public string? TextValue { get; set; }

    public virtual Feature Feature { get; set; } = null!;

    public virtual Property Property { get; set; } = null!;
}
