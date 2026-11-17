using Microsoft.AspNetCore.Mvc.Testing;
using System.Net;

namespace TerraParadise.Api.Tests;

public sealed class HealthEndpointTests
{
    [Fact]
    public async Task Health_endpoint_reports_api_readiness()
    {
        using var factory = new WebApplicationFactory<Program>();
        using var client = factory.CreateClient();

        var response = await client.GetAsync("/health");
        var content = await response.Content.ReadAsStringAsync();

        Assert.Equal(HttpStatusCode.OK, response.StatusCode);
        Assert.Equal("Healthy", content);
    }
}
