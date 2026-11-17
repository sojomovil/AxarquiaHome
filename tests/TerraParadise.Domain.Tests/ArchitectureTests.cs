using TerraParadise.Domain;

namespace TerraParadise.Domain.Tests;

public sealed class ArchitectureTests
{
    [Fact]
    public void Domain_does_not_reference_outer_application_layers()
    {
        var references = typeof(DomainException).Assembly.GetReferencedAssemblies();

        Assert.DoesNotContain(
            references,
            reference => reference.Name is "TerraParadise.Application"
                or "TerraParadise.Infrastructure"
                or "TerraParadise.Api");
    }
}
