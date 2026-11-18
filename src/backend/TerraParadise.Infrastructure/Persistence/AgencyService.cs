using System.Linq.Expressions;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using TerraParadise.Application.Agencies;
using TerraParadise.Data.Generated;
using TerraParadise.Data.Generated.Models;

namespace TerraParadise.Infrastructure.Persistence;

internal sealed class AgencyService(TerraParadiseDataDbContext database) : IAgencyService
{
    private static readonly Expression<Func<Agency, AgencyResponse>> Projection = agency => new(
        agency.AgencyId, agency.Name, agency.TaxIdentifier, agency.Email, agency.PhoneNumber,
        agency.Website, agency.Address, agency.Description, agency.IsActive);

    private static readonly Func<Agency, AgencyResponse> Map = Projection.Compile();

    public Task<AgencyResponse[]> ListAsync(CancellationToken cancellationToken) =>
        database.Agencies.OrderBy(agency => agency.Name).ThenBy(agency => agency.AgencyId)
            .Select(Projection).ToArrayAsync(cancellationToken);

    public Task<AgencyResponse?> FindAsync(int id, CancellationToken cancellationToken) =>
        database.Agencies.Where(agency => agency.AgencyId == id)
            .Select(Projection).SingleOrDefaultAsync(cancellationToken);

    public async Task<AgencyResponse> CreateAsync(SaveAgencyRequest request, CancellationToken cancellationToken)
    {
        var agency = new Agency();
        Apply(agency, request);
        database.Agencies.Add(agency);
        await database.SaveChangesAsync(cancellationToken);
        return Map(agency);
    }

    public async Task<AgencyResponse?> UpdateAsync(int id, SaveAgencyRequest request, CancellationToken cancellationToken)
    {
        var agency = await database.Agencies.SingleOrDefaultAsync(item => item.AgencyId == id, cancellationToken);
        if (agency is null)
            return null;

        Apply(agency, request);
        agency.UpdatedAtUtc = DateTime.UtcNow;
        try
        {
            await database.SaveChangesAsync(cancellationToken);
            return Map(agency);
        }
        catch (DbUpdateConcurrencyException)
        {
            return null;
        }
    }

    public async Task<DeleteAgencyResult> DeleteAsync(int id, CancellationToken cancellationToken)
    {
        try
        {
            var affected = await database.Agencies.Where(agency => agency.AgencyId == id)
                .ExecuteDeleteAsync(cancellationToken);
            return affected == 0 ? DeleteAgencyResult.NotFound : DeleteAgencyResult.Deleted;
        }
        catch (SqlException exception) when (exception.Number == 547)
        {
            return DeleteAgencyResult.InUse;
        }
    }

    private static void Apply(Agency agency, SaveAgencyRequest request)
    {
        agency.Name = request.Name.Trim();
        agency.TaxIdentifier = Optional(request.TaxIdentifier);
        agency.Email = Optional(request.Email);
        agency.PhoneNumber = Optional(request.PhoneNumber);
        agency.Website = Optional(request.Website);
        agency.Address = Optional(request.Address);
        agency.Description = Optional(request.Description);
        agency.IsActive = request.IsActive;
    }

    private static string? Optional(string? value) => string.IsNullOrWhiteSpace(value) ? null : value.Trim();
}
