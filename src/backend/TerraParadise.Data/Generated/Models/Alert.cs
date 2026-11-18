using System;
using System.Collections.Generic;

namespace TerraParadise.Data.Generated.Models;

public partial class Alert
{
    public long AlertId { get; set; }

    public long SavedSearchId { get; set; }

    public string AlertType { get; set; } = null!;

    public string DeliveryChannel { get; set; } = null!;

    public bool IsEnabled { get; set; }

    public string Frequency { get; set; } = null!;

    public DateTime? LastSentAtUtc { get; set; }

    public DateTime CreatedAtUtc { get; set; }

    public virtual SavedSearch SavedSearch { get; set; } = null!;
}
