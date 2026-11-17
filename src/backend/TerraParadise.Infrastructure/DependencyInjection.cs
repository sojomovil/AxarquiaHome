using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using TerraParadise.Infrastructure.Identity;
using TerraParadise.Infrastructure.Persistence;

namespace TerraParadise.Infrastructure;

public static class DependencyInjection
{
    public static IServiceCollection AddInfrastructure(
        this IServiceCollection services,
        IConfiguration configuration)
    {
        services.AddDbContext<TerraParadiseDbContext>(options =>
        {
            var connectionString = configuration.GetConnectionString("TerraParadiseDb");

            if (string.IsNullOrWhiteSpace(connectionString))
            {
                throw new InvalidOperationException(
                    "The 'ConnectionStrings:TerraParadiseDb' configuration value is required.");
            }

            options.UseSqlServer(connectionString);
        });

        services
            .AddIdentityCore<ApplicationUser>()
            .AddRoles<IdentityRole<Guid>>()
            .AddEntityFrameworkStores<TerraParadiseDbContext>();

        return services;
    }
}
