using System;
using System.Collections.Generic;

namespace TerraParadise.Data.Generated.Models;

public partial class SavedSearch
{
    public long SavedSearchId { get; set; }

    public Guid AppUserId { get; set; }

    public string Name { get; set; } = null!;

    public string SearchCriteriaJson { get; set; } = null!;

    public bool IsActive { get; set; }

    public DateTime CreatedAtUtc { get; set; }

    public DateTime? UpdatedAtUtc { get; set; }

    public virtual ICollection<Alert> Alerts { get; set; } = new List<Alert>();

    public virtual AppUser AppUser { get; set; } = null!;
}
