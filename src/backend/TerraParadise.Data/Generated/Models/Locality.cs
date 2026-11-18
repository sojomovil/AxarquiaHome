using System;
using System.Collections.Generic;

namespace TerraParadise.Data.Generated.Models;

public partial class Locality
{
    public int LocalityId { get; set; }

    public int MunicipalityId { get; set; }

    public string Name { get; set; } = null!;

    public string? PostalCode { get; set; }

    public bool IsActive { get; set; }

    public DateTime CreatedAtUtc { get; set; }

    public DateTime? UpdatedAtUtc { get; set; }

    public virtual ICollection<Agency> Agencies { get; set; } = new List<Agency>();

    public virtual Municipality Municipality { get; set; } = null!;

    public virtual ICollection<Property> Properties { get; set; } = new List<Property>();
}
