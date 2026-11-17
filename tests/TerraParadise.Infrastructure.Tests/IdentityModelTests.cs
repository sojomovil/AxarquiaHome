using Microsoft.AspNetCore.Identity;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using TerraParadise.Infrastructure;
using Microsoft.EntityFrameworkCore;
using TerraParadise.Infrastructure.Identity;
using TerraParadise.Infrastructure.Persistence;

namespace TerraParadise.Infrastructure.Tests;

public sealed class IdentityModelTests
{
    [Fact]
    public void Missing_connection_string_is_reported_when_database_context_is_requested()
    {
        var services = new ServiceCollection();
        services.AddLogging();
        services.AddInfrastructure(new ConfigurationBuilder().Build());
        using var provider = services.BuildServiceProvider();

        var exception = Assert.Throws<InvalidOperationException>(
            () => provider.GetRequiredService<TerraParadiseDbContext>());

        Assert.Contains("ConnectionStrings:TerraParadiseDb", exception.Message);
    }

    [Fact]
    public void Identity_model_is_available_without_business_entities()
    {
        var options = new DbContextOptionsBuilder<TerraParadiseDbContext>()
            .UseInMemoryDatabase(Guid.NewGuid().ToString())
            .Options;

        using var context = new TerraParadiseDbContext(options);
        var entityTypes = context.Model.GetEntityTypes().Select(entity => entity.ClrType).ToArray();

        Assert.Contains(typeof(ApplicationUser), entityTypes);
        Assert.Contains(typeof(IdentityRole<Guid>), entityTypes);
        Assert.DoesNotContain(entityTypes, entity => entity.Name is "Property" or "Municipality");
    }
}
