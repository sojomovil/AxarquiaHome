using System;
using System.Collections.Generic;

namespace TerraParadise.Data.Generated.Models;

public partial class Municipality
{
    public int MunicipalityId { get; set; }

    public string Name { get; set; } = null!;

    public bool IsActive { get; set; }

    public DateTime CreatedAtUtc { get; set; }

    public DateTime? UpdatedAtUtc { get; set; }

    public int? ComarcaId { get; set; }

    public int ProvinceId { get; set; }

    public virtual ICollection<Agency> Agencies { get; set; } = new List<Agency>();

    public virtual Comarca? Comarca { get; set; }

    public virtual ICollection<Locality> Localities { get; set; } = new List<Locality>();

    public virtual ICollection<Property> Properties { get; set; } = new List<Property>();

    public virtual Province Province { get; set; } = null!;
}
