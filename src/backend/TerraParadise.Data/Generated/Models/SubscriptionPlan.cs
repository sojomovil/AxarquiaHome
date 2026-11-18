using System;
using System.Collections.Generic;

namespace TerraParadise.Data.Generated.Models;

public partial class SubscriptionPlan
{
    public int SubscriptionPlanId { get; set; }

    public string Code { get; set; } = null!;

    public string Name { get; set; } = null!;

    public string? Description { get; set; }

    public decimal Price { get; set; }

    public string CurrencyCode { get; set; } = null!;

    public string BillingPeriod { get; set; } = null!;

    public bool IsActive { get; set; }

    public DateTime CreatedAtUtc { get; set; }

    public virtual ICollection<UserSubscription> UserSubscriptions { get; set; } = new List<UserSubscription>();
}
