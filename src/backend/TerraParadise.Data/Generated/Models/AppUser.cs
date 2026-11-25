using System;
using System.Collections.Generic;

namespace TerraParadise.Data.Generated.Models;

public partial class AppUser
{
    public Guid AppUserId { get; set; }

    public string Email { get; set; } = null!;

    public string NormalizedEmail { get; set; } = null!;

    public string DisplayName { get; set; } = null!;

    public string? PhoneNumber { get; set; }

    public string? PasswordHash { get; set; }

    public string UserRole { get; set; } = null!;

    public bool IsEmailVerified { get; set; }

    public bool IsActive { get; set; }

    public DateTime CreatedAtUtc { get; set; }

    public DateTime? UpdatedAtUtc { get; set; }

    public DateTime? LastLoginAtUtc { get; set; }

    public virtual ICollection<Agency> Agencies { get; set; } = new List<Agency>();

    public virtual ICollection<Favorite> Favorites { get; set; } = new List<Favorite>();

    public virtual ICollection<Property> Properties { get; set; } = new List<Property>();

    public virtual ICollection<RentalBooking> RentalBookings { get; set; } = new List<RentalBooking>();

    public virtual ICollection<SavedSearch> SavedSearches { get; set; } = new List<SavedSearch>();

    public virtual ICollection<UserSubscription> UserSubscriptions { get; set; } = new List<UserSubscription>();
}
