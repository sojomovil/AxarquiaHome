using Microsoft.AspNetCore.Http.HttpResults;
using TerraParadise.Application.Agencies;

namespace TerraParadise.Api.Agencies;

internal static class AgencyEndpoints
{
    public static void MapAgencies(this WebApplication app)
    {
        var group = app.MapGroup("/api/agencies").WithTags("Agencias");
        group.MapGet("", async (IAgencyService service, CancellationToken ct) =>
            TypedResults.Ok(await service.ListAsync(ct))).WithSummary("Lista las agencias por nombre.");

        group.MapGet("/{id:int}", async Task<Results<Ok<AgencyResponse>, ProblemHttpResult>> (
            int id, IAgencyService service, CancellationToken ct) =>
            await service.FindAsync(id, ct) is { } agency ? TypedResults.Ok(agency) : Missing())
            .WithSummary("Obtiene una agencia por identificador.").ProducesProblem(404);

        group.MapPost("", async (SaveAgencyRequest request, IAgencyService service, CancellationToken ct) =>
        {
            var agency = await service.CreateAsync(request, ct);
            return TypedResults.Created($"/api/agencies/{agency.Id}", agency);
        }).WithSummary("Crea una agencia.").ProducesValidationProblem();

        group.MapPut("/{id:int}", async Task<Results<Ok<AgencyResponse>, ProblemHttpResult>> (
            int id, SaveAgencyRequest request, IAgencyService service, CancellationToken ct) =>
            await service.UpdateAsync(id, request, ct) is { } agency ? TypedResults.Ok(agency) : Missing())
            .WithSummary("Actualiza los datos editables de una agencia.")
            .ProducesValidationProblem().ProducesProblem(404);

        group.MapDelete("/{id:int}", async Task<Results<NoContent, ProblemHttpResult>> (
            int id, IAgencyService service, CancellationToken ct) =>
            await service.DeleteAsync(id, ct) switch
            {
                DeleteAgencyResult.Deleted => TypedResults.NoContent(),
                DeleteAgencyResult.NotFound => Missing(),
                _ => TypedResults.Problem(statusCode: 409, title: "La agencia tiene inmuebles asociados.",
                    detail: "Puedes desactivarla sin eliminar esos inmuebles.")
            }).WithSummary("Elimina una agencia sin inmuebles asociados.")
            .ProducesProblem(404).ProducesProblem(409);
    }

    private static ProblemHttpResult Missing() =>
        TypedResults.Problem(statusCode: 404, title: "No se encontró la agencia.");
}
