using TerraParadise.Application;

namespace TerraParadise.Application.Tests;

public sealed class ArchitectureTests
{
    [Fact]
    public void Application_does_not_reference_outer_layers()
    {
        var references = typeof(DependencyInjection).Assembly.GetReferencedAssemblies();

        Assert.DoesNotContain(
            references,
            reference => reference.Name is "TerraParadise.Infrastructure"
                or "TerraParadise.Api");
    }
}
