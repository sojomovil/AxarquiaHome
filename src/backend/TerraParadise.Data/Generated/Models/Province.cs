using System;
using System.Collections.Generic;

namespace TerraParadise.Data.Generated.Models;

public partial class Province
{
    public int ProvinceId { get; set; }

    public int AutonomousCommunityId { get; set; }

    public string? IneCode { get; set; }

    public string Name { get; set; } = null!;

    public bool IsActive { get; set; }

    public DateTime CreatedAtUtc { get; set; }

    public DateTime? UpdatedAtUtc { get; set; }

    public virtual AutonomousCommunity AutonomousCommunity { get; set; } = null!;

    public virtual ICollection<Comarca> Comarcas { get; set; } = new List<Comarca>();

    public virtual ICollection<Municipality> Municipalities { get; set; } = new List<Municipality>();
}
