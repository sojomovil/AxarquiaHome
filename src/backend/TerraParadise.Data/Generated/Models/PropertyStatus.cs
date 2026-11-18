using System;
using System.Collections.Generic;

namespace TerraParadise.Data.Generated.Models;

public partial class PropertyStatus
{
    public short PropertyStatusId { get; set; }

    public string Name { get; set; } = null!;

    public string? Description { get; set; }

    public bool IsActive { get; set; }

    public virtual ICollection<Property> Properties { get; set; } = new List<Property>();
}
