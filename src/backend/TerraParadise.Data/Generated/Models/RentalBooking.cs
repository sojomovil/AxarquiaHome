using System;
using System.Collections.Generic;

namespace TerraParadise.Data.Generated.Models;

public partial class RentalBooking
{
    public long RentalBookingId { get; set; }

    public long PropertyListingId { get; set; }

    public Guid TenantUserId { get; set; }

    public DateOnly StartDate { get; set; }

    public DateOnly EndDate { get; set; }

    public string BillingUnit { get; set; } = null!;

    public int QuantityUnits { get; set; }

    public decimal UnitPriceSnapshot { get; set; }

    public decimal TotalAmount { get; set; }

    public decimal? DepositAmount { get; set; }

    public string CurrencyCode { get; set; } = null!;

    public string Status { get; set; } = null!;

    public string? Notes { get; set; }

    public DateTime CreatedAtUtc { get; set; }

    public DateTime? UpdatedAtUtc { get; set; }

    public virtual PropertyListing PropertyListing { get; set; } = null!;

    public virtual AppUser TenantUser { get; set; } = null!;
}
