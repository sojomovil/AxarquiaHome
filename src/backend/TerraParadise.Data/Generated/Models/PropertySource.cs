using System;
using System.Collections.Generic;

namespace TerraParadise.Data.Generated.Models;

public partial class PropertySource
{
    public long PropertySourceId { get; set; }

    public long PropertyId { get; set; }

    public int SourceId { get; set; }

    public string? ExternalId { get; set; }

    public string OriginalUrl { get; set; } = null!;

    public string? OriginalTitle { get; set; }

    public string? OriginalDescription { get; set; }

    public DateTime FirstSeenAtUtc { get; set; }

    public DateTime LastSeenAtUtc { get; set; }

    public DateTime? LastVerifiedAtUtc { get; set; }

    public bool IsActive { get; set; }

    public string VerificationStatus { get; set; } = null!;

    public string? ImportNotes { get; set; }

    public virtual Property Property { get; set; } = null!;

    public virtual Source Source { get; set; } = null!;
}
