using System.Net;
using System.Net.Http.Json;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc.Testing;

namespace TerraParadise.Api.Tests;

public sealed class AgencyEndpointTests
{
    [Fact]
    public async Task Creating_an_agency_without_a_name_returns_a_validation_problem()
    {
        using var application = new WebApplicationFactory<Program>();
        using var client = application.CreateClient();

        using var response = await client.PostAsJsonAsync("/api/agencies", new { name = "  " });

        Assert.Equal(HttpStatusCode.BadRequest, response.StatusCode);
        Assert.Equal("application/problem+json", response.Content.Headers.ContentType?.MediaType);
        Assert.Contains("name", await response.Content.ReadAsStringAsync(), StringComparison.OrdinalIgnoreCase);
    }

    [Fact]
    public async Task Production_does_not_expose_the_management_endpoint()
    {
        using var application = new WebApplicationFactory<Program>();
        using var factory = application.WithWebHostBuilder(builder => builder.UseEnvironment("Production"));
        using var client = factory.CreateClient();

        using var response = await client.GetAsync("/api/agencies");

        Assert.Equal(HttpStatusCode.NotFound, response.StatusCode);
    }
}
