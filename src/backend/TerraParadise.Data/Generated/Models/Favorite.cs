using System;
using System.Collections.Generic;

namespace TerraParadise.Data.Generated.Models;

public partial class Favorite
{
    public Guid AppUserId { get; set; }

    public long PropertyId { get; set; }

    public DateTime CreatedAtUtc { get; set; }

    public virtual AppUser AppUser { get; set; } = null!;

    public virtual Property Property { get; set; } = null!;
}
