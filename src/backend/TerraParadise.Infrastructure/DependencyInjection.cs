using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using TerraParadise.Application.Agencies;
using TerraParadise.Application.Properties;
using TerraParadise.Data.Generated;
using TerraParadise.Infrastructure.Identity;
using TerraParadise.Infrastructure.Persistence;

namespace TerraParadise.Infrastructure;

public static class DependencyInjection
{
    public static IServiceCollection AddInfrastructure(
        this IServiceCollection services,
        IConfiguration configuration)
    {
        services.AddDbContext<TerraParadiseDbContext>(ConfigureSqlServer);
        services.AddDbContext<TerraParadiseDataDbContext>(ConfigureSqlServer);
        services.AddScoped<IAgencyService, AgencyService>();
        services.AddScoped<IPropertyService, PropertyService>();

        services
            .AddIdentityCore<ApplicationUser>()
            .AddRoles<IdentityRole<Guid>>()
            .AddEntityFrameworkStores<TerraParadiseDbContext>();

        return services;

        void ConfigureSqlServer(DbContextOptionsBuilder options)
        {
            var connectionString = configuration.GetConnectionString("TerraParadiseDb");

            if (string.IsNullOrWhiteSpace(connectionString))
            {
                throw new InvalidOperationException(
                    "The 'ConnectionStrings:TerraParadiseDb' configuration value is required.");
            }

            options.UseSqlServer(connectionString);
        }
    }
}
