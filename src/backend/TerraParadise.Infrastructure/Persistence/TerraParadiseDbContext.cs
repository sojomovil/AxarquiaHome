using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using TerraParadise.Infrastructure.Identity;

namespace TerraParadise.Infrastructure.Persistence;

public sealed class TerraParadiseDbContext(
    DbContextOptions<TerraParadiseDbContext> options)
    : IdentityDbContext<ApplicationUser, IdentityRole<Guid>, Guid>(options)
{
}
