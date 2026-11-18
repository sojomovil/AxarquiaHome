using System.ComponentModel.DataAnnotations;

namespace TerraParadise.Application.Agencies;

/// <summary>Datos editables al crear o actualizar una agencia.</summary>
public sealed record SaveAgencyRequest
{
    [Required, MaxLength(180)]
    public string Name { get; init; } = "";

    [MaxLength(30)]
    public string? TaxIdentifier { get; init; }

    [EmailAddress, MaxLength(256)]
    public string? Email { get; init; }

    [MaxLength(30)]
    public string? PhoneNumber { get; init; }

    [Url, MaxLength(500)]
    public string? Website { get; init; }

    [MaxLength(300)]
    public string? Address { get; init; }

    [MaxLength(2000)]
    public string? Description { get; init; }

    public bool IsActive { get; init; } = true;
}

/// <summary>Datos de una agencia para el directorio de gestión.</summary>
public sealed record AgencyResponse(int Id, string Name, string? TaxIdentifier, string? Email,
    string? PhoneNumber, string? Website, string? Address, string? Description, bool IsActive);

public enum DeleteAgencyResult { Deleted, NotFound, InUse }

public interface IAgencyService
{
    Task<AgencyResponse[]> ListAsync(CancellationToken cancellationToken);
    Task<AgencyResponse?> FindAsync(int id, CancellationToken cancellationToken);
    Task<AgencyResponse> CreateAsync(SaveAgencyRequest request, CancellationToken cancellationToken);
    Task<AgencyResponse?> UpdateAsync(int id, SaveAgencyRequest request, CancellationToken cancellationToken);
    Task<DeleteAgencyResult> DeleteAsync(int id, CancellationToken cancellationToken);
}
