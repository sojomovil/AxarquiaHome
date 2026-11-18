using System;
using System.Collections.Generic;

namespace TerraParadise.Data.Generated.Models;

public partial class Feature
{
    public int FeatureId { get; set; }

    public string Name { get; set; } = null!;

    public string? Category { get; set; }

    public string DataType { get; set; } = null!;

    public string? Unit { get; set; }

    public bool IsActive { get; set; }

    public virtual ICollection<PropertyFeature> PropertyFeatures { get; set; } = new List<PropertyFeature>();
}
