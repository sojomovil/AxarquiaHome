using System;
using System.Collections.Generic;

namespace TerraParadise.Data.Generated.Models;

public partial class UserSubscription
{
    public long UserSubscriptionId { get; set; }

    public Guid AppUserId { get; set; }

    public int SubscriptionPlanId { get; set; }

    public string Status { get; set; } = null!;

    public DateTime? StartAtUtc { get; set; }

    public DateTime? EndAtUtc { get; set; }

    public string? ExternalPaymentId { get; set; }

    public DateTime CreatedAtUtc { get; set; }

    public DateTime? UpdatedAtUtc { get; set; }

    public virtual AppUser AppUser { get; set; } = null!;

    public virtual SubscriptionPlan SubscriptionPlan { get; set; } = null!;
}
