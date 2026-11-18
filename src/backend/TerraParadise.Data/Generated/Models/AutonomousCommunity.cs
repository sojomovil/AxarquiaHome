using System;
using System.Collections.Generic;

namespace TerraParadise.Data.Generated.Models;

public partial class AutonomousCommunity
{
    public int AutonomousCommunityId { get; set; }

    public string? IneCode { get; set; }

    public string Name { get; set; } = null!;

    public string Country { get; set; } = null!;

    public bool IsActive { get; set; }

    public DateTime CreatedAtUtc { get; set; }

    public DateTime? UpdatedAtUtc { get; set; }

    public virtual ICollection<Province> Provinces { get; set; } = new List<Province>();
}
