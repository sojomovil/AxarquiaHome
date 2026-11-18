using Microsoft.AspNetCore.Mvc.Testing;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using TerraParadise.Data.Generated;

namespace TerraParadise.Api.Tests;

public sealed class DataContextTests
{
    [Fact]
    public void Api_resolves_the_generated_context_using_the_configured_sql_server_connection()
    {
        const string connectionString = "Server=unused;Database=AxarquiaHomeDb;Integrated Security=True";
        using var application = new WebApplicationFactory<Program>();
        using var factory = application.WithWebHostBuilder(builder =>
            builder.ConfigureAppConfiguration((_, configuration) => configuration.AddInMemoryCollection(
                new Dictionary<string, string?> { ["ConnectionStrings:TerraParadiseDb"] = connectionString })));
        using var scope = factory.Services.CreateScope();

        var context = scope.ServiceProvider.GetRequiredService<TerraParadiseDataDbContext>();

        Assert.True(context.Database.IsSqlServer());
        var connection = context.Database.GetDbConnection();
        Assert.Equal("unused", connection.DataSource);
        Assert.Equal("AxarquiaHomeDb", connection.Database);
    }
}
