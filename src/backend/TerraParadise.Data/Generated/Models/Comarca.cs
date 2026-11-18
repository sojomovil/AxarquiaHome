using System;
using System.Collections.Generic;

namespace TerraParadise.Data.Generated.Models;

public partial class Comarca
{
    public int ComarcaId { get; set; }

    public string Name { get; set; } = null!;

    public bool IsActive { get; set; }

    public DateTime CreatedAtUtc { get; set; }

    public DateTime? UpdatedAtUtc { get; set; }

    public int ProvinceId { get; set; }

    public virtual ICollection<Municipality> Municipalities { get; set; } = new List<Municipality>();

    public virtual Province Province { get; set; } = null!;
}
