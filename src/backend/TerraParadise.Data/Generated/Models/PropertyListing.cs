using System;
using System.Collections.Generic;

namespace TerraParadise.Data.Generated.Models;

public partial class PropertyListing
{
    public long PropertyListingId { get; set; }

    public long PropertyId { get; set; }

    public string OperationType { get; set; } = null!;

    public string PricePeriod { get; set; } = null!;

    public decimal Price { get; set; }

    public string CurrencyCode { get; set; } = null!;

    public decimal? DepositAmount { get; set; }

    public int? MinStayUnits { get; set; }

    public int? MaxStayUnits { get; set; }

    public bool? UtilitiesIncluded { get; set; }

    public DateOnly? AvailableFromDate { get; set; }

    public bool IsActive { get; set; }

    public DateTime CreatedAtUtc { get; set; }

    public DateTime? UpdatedAtUtc { get; set; }

    public virtual ICollection<PriceHistory> PriceHistories { get; set; } = new List<PriceHistory>();

    public virtual Property Property { get; set; } = null!;

    public virtual ICollection<RentalBooking> RentalBookings { get; set; } = new List<RentalBooking>();
}
