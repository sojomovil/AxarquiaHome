using System;
using System.Collections.Generic;

namespace TerraParadise.Data.Generated.Models;

public partial class Agency
{
    public int AgencyId { get; set; }

    public Guid? AppUserId { get; set; }

    public string Name { get; set; } = null!;

    public string? TaxIdentifier { get; set; }

    public string? Email { get; set; }

    public string? PhoneNumber { get; set; }

    public string? Website { get; set; }

    public string? Address { get; set; }

    public int? MunicipalityId { get; set; }

    public int? LocalityId { get; set; }

    public string? Description { get; set; }

    public bool IsVerified { get; set; }

    public bool IsActive { get; set; }

    public DateTime CreatedAtUtc { get; set; }

    public DateTime? UpdatedAtUtc { get; set; }

    public virtual AppUser? AppUser { get; set; }

    public virtual Locality? Locality { get; set; }

    public virtual Municipality? Municipality { get; set; }

    public virtual ICollection<Property> Properties { get; set; } = new List<Property>();
}
