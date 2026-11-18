using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using TerraParadise.Data.Generated.Models;

namespace TerraParadise.Data.Generated;

public partial class TerraParadiseDataDbContext : DbContext
{
    public TerraParadiseDataDbContext(DbContextOptions<TerraParadiseDataDbContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Agency> Agencies { get; set; }

    public virtual DbSet<Alert> Alerts { get; set; }

    public virtual DbSet<AppUser> AppUsers { get; set; }

    public virtual DbSet<AutonomousCommunity> AutonomousCommunities { get; set; }

    public virtual DbSet<Comarca> Comarcas { get; set; }

    public virtual DbSet<Favorite> Favorites { get; set; }

    public virtual DbSet<Feature> Features { get; set; }

    public virtual DbSet<Locality> Localities { get; set; }

    public virtual DbSet<Municipality> Municipalities { get; set; }

    public virtual DbSet<PriceHistory> PriceHistories { get; set; }

    public virtual DbSet<Property> Properties { get; set; }

    public virtual DbSet<PropertyFeature> PropertyFeatures { get; set; }

    public virtual DbSet<PropertyImage> PropertyImages { get; set; }

    public virtual DbSet<PropertySource> PropertySources { get; set; }

    public virtual DbSet<PropertyStatus> PropertyStatuses { get; set; }

    public virtual DbSet<PropertyType> PropertyTypes { get; set; }

    public virtual DbSet<Province> Provinces { get; set; }

    public virtual DbSet<SavedSearch> SavedSearches { get; set; }

    public virtual DbSet<Source> Sources { get; set; }

    public virtual DbSet<SubscriptionPlan> SubscriptionPlans { get; set; }

    public virtual DbSet<UserSubscription> UserSubscriptions { get; set; }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Agency>(entity =>
        {
            entity.ToTable("Agency");

            entity.Property(e => e.Address).HasMaxLength(300);
            entity.Property(e => e.CreatedAtUtc)
                .HasPrecision(0)
                .HasDefaultValueSql("(sysutcdatetime())", "DF_Agency_CreatedAtUtc");
            entity.Property(e => e.Description).HasMaxLength(2000);
            entity.Property(e => e.Email).HasMaxLength(256);
            entity.Property(e => e.IsActive).HasDefaultValue(true, "DF_Agency_IsActive");
            entity.Property(e => e.Name).HasMaxLength(180);
            entity.Property(e => e.PhoneNumber).HasMaxLength(30);
            entity.Property(e => e.TaxIdentifier).HasMaxLength(30);
            entity.Property(e => e.UpdatedAtUtc).HasPrecision(0);
            entity.Property(e => e.Website).HasMaxLength(500);

            entity.HasOne(d => d.AppUser).WithMany(p => p.Agencies)
                .HasForeignKey(d => d.AppUserId)
                .HasConstraintName("FK_Agency_AppUser");

            entity.HasOne(d => d.Locality).WithMany(p => p.Agencies)
                .HasForeignKey(d => d.LocalityId)
                .HasConstraintName("FK_Agency_Locality");

            entity.HasOne(d => d.Municipality).WithMany(p => p.Agencies)
                .HasForeignKey(d => d.MunicipalityId)
                .HasConstraintName("FK_Agency_Municipality");
        });

        modelBuilder.Entity<Alert>(entity =>
        {
            entity.ToTable("Alert");

            entity.Property(e => e.AlertType)
                .HasMaxLength(30)
                .HasDefaultValue("NewProperty", "DF_Alert_Type");
            entity.Property(e => e.CreatedAtUtc)
                .HasPrecision(0)
                .HasDefaultValueSql("(sysutcdatetime())", "DF_Alert_CreatedAt");
            entity.Property(e => e.DeliveryChannel)
                .HasMaxLength(20)
                .HasDefaultValue("Email", "DF_Alert_Channel");
            entity.Property(e => e.Frequency)
                .HasMaxLength(20)
                .HasDefaultValue("Daily", "DF_Alert_Frequency");
            entity.Property(e => e.IsEnabled).HasDefaultValue(true, "DF_Alert_IsEnabled");
            entity.Property(e => e.LastSentAtUtc).HasPrecision(0);

            entity.HasOne(d => d.SavedSearch).WithMany(p => p.Alerts)
                .HasForeignKey(d => d.SavedSearchId)
                .HasConstraintName("FK_Alert_SavedSearch");
        });

        modelBuilder.Entity<AppUser>(entity =>
        {
            entity.ToTable("AppUser");

            entity.HasIndex(e => e.NormalizedEmail, "UQ_AppUser_NormalizedEmail").IsUnique();

            entity.Property(e => e.AppUserId).HasDefaultValueSql("(newsequentialid())", "DF_AppUser_Id");
            entity.Property(e => e.CreatedAtUtc)
                .HasPrecision(0)
                .HasDefaultValueSql("(sysutcdatetime())", "DF_AppUser_CreatedAtUtc");
            entity.Property(e => e.DisplayName).HasMaxLength(160);
            entity.Property(e => e.Email).HasMaxLength(256);
            entity.Property(e => e.IsActive).HasDefaultValue(true, "DF_AppUser_IsActive");
            entity.Property(e => e.LastLoginAtUtc).HasPrecision(0);
            entity.Property(e => e.NormalizedEmail).HasMaxLength(256);
            entity.Property(e => e.PasswordHash).HasMaxLength(500);
            entity.Property(e => e.PhoneNumber).HasMaxLength(30);
            entity.Property(e => e.UpdatedAtUtc).HasPrecision(0);
            entity.Property(e => e.UserRole)
                .HasMaxLength(30)
                .HasDefaultValue("User", "DF_AppUser_Role");
        });

        modelBuilder.Entity<AutonomousCommunity>(entity =>
        {
            entity.ToTable("AutonomousCommunity");

            entity.HasIndex(e => new { e.Name, e.Country }, "UQ_AutonomousCommunity_Name_Country").IsUnique();

            entity.Property(e => e.Country)
                .HasMaxLength(100)
                .HasDefaultValue("España", "DF_AutonomousCommunity_Country");
            entity.Property(e => e.CreatedAtUtc)
                .HasPrecision(0)
                .HasDefaultValueSql("(sysutcdatetime())", "DF_AutonomousCommunity_CreatedAtUtc");
            entity.Property(e => e.IneCode)
                .HasMaxLength(2)
                .IsUnicode(false)
                .IsFixedLength();
            entity.Property(e => e.IsActive).HasDefaultValue(true, "DF_AutonomousCommunity_IsActive");
            entity.Property(e => e.Name).HasMaxLength(100);
            entity.Property(e => e.UpdatedAtUtc).HasPrecision(0);
        });

        modelBuilder.Entity<Comarca>(entity =>
        {
            entity.ToTable("Comarca");

            entity.HasIndex(e => e.ProvinceId, "IX_Comarca_ProvinceId");

            entity.HasIndex(e => new { e.Name, e.ProvinceId }, "UQ_Comarca_Name_ProvinceId").IsUnique();

            entity.Property(e => e.CreatedAtUtc)
                .HasPrecision(0)
                .HasDefaultValueSql("(sysutcdatetime())", "DF_Comarca_CreatedAtUtc");
            entity.Property(e => e.IsActive).HasDefaultValue(true, "DF_Comarca_IsActive");
            entity.Property(e => e.Name).HasMaxLength(100);
            entity.Property(e => e.UpdatedAtUtc).HasPrecision(0);

            entity.HasOne(d => d.Province).WithMany(p => p.Comarcas)
                .HasForeignKey(d => d.ProvinceId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Comarca_Province");
        });

        modelBuilder.Entity<Favorite>(entity =>
        {
            entity.HasKey(e => new { e.AppUserId, e.PropertyId });

            entity.ToTable("Favorite");

            entity.HasIndex(e => e.PropertyId, "IX_Favorite_Property");

            entity.Property(e => e.CreatedAtUtc)
                .HasPrecision(0)
                .HasDefaultValueSql("(sysutcdatetime())", "DF_Favorite_CreatedAt");

            entity.HasOne(d => d.AppUser).WithMany(p => p.Favorites)
                .HasForeignKey(d => d.AppUserId)
                .HasConstraintName("FK_Favorite_AppUser");

            entity.HasOne(d => d.Property).WithMany(p => p.Favorites)
                .HasForeignKey(d => d.PropertyId)
                .HasConstraintName("FK_Favorite_Property");
        });

        modelBuilder.Entity<Feature>(entity =>
        {
            entity.ToTable("Feature");

            entity.HasIndex(e => e.Name, "UQ_Feature_Name").IsUnique();

            entity.Property(e => e.Category).HasMaxLength(60);
            entity.Property(e => e.DataType)
                .HasMaxLength(20)
                .HasDefaultValue("Boolean", "DF_Feature_DataType");
            entity.Property(e => e.IsActive).HasDefaultValue(true, "DF_Feature_IsActive");
            entity.Property(e => e.Name).HasMaxLength(100);
            entity.Property(e => e.Unit).HasMaxLength(30);
        });

        modelBuilder.Entity<Locality>(entity =>
        {
            entity.ToTable("Locality");

            entity.HasIndex(e => new { e.MunicipalityId, e.Name }, "UQ_Locality_Municipality_Name").IsUnique();

            entity.Property(e => e.CreatedAtUtc)
                .HasPrecision(0)
                .HasDefaultValueSql("(sysutcdatetime())", "DF_Locality_CreatedAtUtc");
            entity.Property(e => e.IsActive).HasDefaultValue(true, "DF_Locality_IsActive");
            entity.Property(e => e.Name).HasMaxLength(120);
            entity.Property(e => e.PostalCode).HasMaxLength(10);
            entity.Property(e => e.UpdatedAtUtc).HasPrecision(0);

            entity.HasOne(d => d.Municipality).WithMany(p => p.Localities)
                .HasForeignKey(d => d.MunicipalityId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Locality_Municipality");
        });

        modelBuilder.Entity<Municipality>(entity =>
        {
            entity.ToTable("Municipality");

            entity.HasIndex(e => e.ComarcaId, "IX_Municipality_ComarcaId");

            entity.HasIndex(e => e.ProvinceId, "IX_Municipality_ProvinceId");

            entity.HasIndex(e => new { e.Name, e.ProvinceId }, "UQ_Municipality_Name_ProvinceId").IsUnique();

            entity.Property(e => e.CreatedAtUtc)
                .HasPrecision(0)
                .HasDefaultValueSql("(sysutcdatetime())", "DF_Municipality_CreatedAtUtc");
            entity.Property(e => e.IsActive).HasDefaultValue(true, "DF_Municipality_IsActive");
            entity.Property(e => e.Name).HasMaxLength(100);
            entity.Property(e => e.UpdatedAtUtc).HasPrecision(0);

            entity.HasOne(d => d.Comarca).WithMany(p => p.Municipalities)
                .HasForeignKey(d => d.ComarcaId)
                .HasConstraintName("FK_Municipality_Comarca");

            entity.HasOne(d => d.Province).WithMany(p => p.Municipalities)
                .HasForeignKey(d => d.ProvinceId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Municipality_Province");
        });

        modelBuilder.Entity<PriceHistory>(entity =>
        {
            entity.ToTable("PriceHistory");

            entity.HasIndex(e => new { e.PropertyId, e.RecordedAtUtc }, "IX_PriceHistory_Property_Date").IsDescending(false, true);

            entity.Property(e => e.ChangeType).HasMaxLength(20);
            entity.Property(e => e.CurrencyCode)
                .HasMaxLength(3)
                .IsUnicode(false)
                .IsFixedLength()
                .HasDefaultValue("EUR", "DF_PriceHistory_Currency");
            entity.Property(e => e.Notes).HasMaxLength(500);
            entity.Property(e => e.PreviousPrice).HasColumnType("decimal(18, 2)");
            entity.Property(e => e.Price).HasColumnType("decimal(18, 2)");
            entity.Property(e => e.RecordedAtUtc)
                .HasPrecision(0)
                .HasDefaultValueSql("(sysutcdatetime())", "DF_PriceHistory_RecordedAt");

            entity.HasOne(d => d.Property).WithMany(p => p.PriceHistories)
                .HasForeignKey(d => d.PropertyId)
                .HasConstraintName("FK_PriceHistory_Property");

            entity.HasOne(d => d.Source).WithMany(p => p.PriceHistories)
                .HasForeignKey(d => d.SourceId)
                .HasConstraintName("FK_PriceHistory_Source");
        });

        modelBuilder.Entity<Property>(entity =>
        {
            entity.ToTable("Property");

            entity.HasIndex(e => new { e.Latitude, e.Longitude }, "IX_Property_Coordinates").HasFilter("([Latitude] IS NOT NULL AND [Longitude] IS NOT NULL)");

            entity.HasIndex(e => e.LocalityId, "IX_Property_Locality");

            entity.HasIndex(e => new { e.IsPublished, e.PublishedAtUtc }, "IX_Property_Published").IsDescending(false, true);

            entity.HasIndex(e => new { e.MunicipalityId, e.PropertyTypeId, e.OperationType, e.Price }, "IX_Property_Search");

            entity.Property(e => e.Address).HasMaxLength(300);
            entity.Property(e => e.BuiltAreaM2).HasColumnType("decimal(10, 2)");
            entity.Property(e => e.ConditionDescription).HasMaxLength(50);
            entity.Property(e => e.CreatedAtUtc)
                .HasPrecision(0)
                .HasDefaultValueSql("(sysutcdatetime())", "DF_Property_CreatedAtUtc");
            entity.Property(e => e.CurrencyCode)
                .HasMaxLength(3)
                .IsUnicode(false)
                .IsFixedLength()
                .HasDefaultValue("EUR", "DF_Property_Currency");
            entity.Property(e => e.EnergyRating).HasMaxLength(10);
            entity.Property(e => e.FirstDetectedAtUtc).HasPrecision(0);
            entity.Property(e => e.LastCheckedAtUtc).HasPrecision(0);
            entity.Property(e => e.Latitude).HasColumnType("decimal(9, 6)");
            entity.Property(e => e.Longitude).HasColumnType("decimal(9, 6)");
            entity.Property(e => e.OperationType).HasMaxLength(20);
            entity.Property(e => e.PlotAreaM2).HasColumnType("decimal(10, 2)");
            entity.Property(e => e.PostalCode).HasMaxLength(10);
            entity.Property(e => e.Price).HasColumnType("decimal(18, 2)");
            entity.Property(e => e.PublishedAtUtc).HasPrecision(0);
            entity.Property(e => e.RowVersion)
                .IsRowVersion()
                .IsConcurrencyToken();
            entity.Property(e => e.Title).HasMaxLength(250);
            entity.Property(e => e.UpdatedAtUtc).HasPrecision(0);
            entity.Property(e => e.UsableAreaM2).HasColumnType("decimal(10, 2)");

            entity.HasOne(d => d.Agency).WithMany(p => p.Properties)
                .HasForeignKey(d => d.AgencyId)
                .HasConstraintName("FK_Property_Agency");

            entity.HasOne(d => d.Locality).WithMany(p => p.Properties)
                .HasForeignKey(d => d.LocalityId)
                .HasConstraintName("FK_Property_Locality");

            entity.HasOne(d => d.Municipality).WithMany(p => p.Properties)
                .HasForeignKey(d => d.MunicipalityId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Property_Municipality");

            entity.HasOne(d => d.OwnerUser).WithMany(p => p.Properties)
                .HasForeignKey(d => d.OwnerUserId)
                .HasConstraintName("FK_Property_OwnerUser");

            entity.HasOne(d => d.PropertyStatus).WithMany(p => p.Properties)
                .HasForeignKey(d => d.PropertyStatusId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Property_PropertyStatus");

            entity.HasOne(d => d.PropertyType).WithMany(p => p.Properties)
                .HasForeignKey(d => d.PropertyTypeId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Property_PropertyType");
        });

        modelBuilder.Entity<PropertyFeature>(entity =>
        {
            entity.HasKey(e => new { e.PropertyId, e.FeatureId });

            entity.ToTable("PropertyFeature");

            entity.Property(e => e.NumberValue).HasColumnType("decimal(18, 4)");
            entity.Property(e => e.TextValue).HasMaxLength(500);

            entity.HasOne(d => d.Feature).WithMany(p => p.PropertyFeatures)
                .HasForeignKey(d => d.FeatureId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_PropertyFeature_Feature");

            entity.HasOne(d => d.Property).WithMany(p => p.PropertyFeatures)
                .HasForeignKey(d => d.PropertyId)
                .HasConstraintName("FK_PropertyFeature_Property");
        });

        modelBuilder.Entity<PropertyImage>(entity =>
        {
            entity.ToTable("PropertyImage");

            entity.HasIndex(e => new { e.PropertyId, e.DisplayOrder }, "IX_PropertyImage_Property_Order");

            entity.Property(e => e.Caption).HasMaxLength(250);
            entity.Property(e => e.CreatedAtUtc)
                .HasPrecision(0)
                .HasDefaultValueSql("(sysutcdatetime())", "DF_PropertyImage_CreatedAtUtc");
            entity.Property(e => e.ImageUrl).HasMaxLength(1000);
            entity.Property(e => e.SourceImageUrl).HasMaxLength(1000);
            entity.Property(e => e.ThumbnailUrl).HasMaxLength(1000);

            entity.HasOne(d => d.Property).WithMany(p => p.PropertyImages)
                .HasForeignKey(d => d.PropertyId)
                .HasConstraintName("FK_PropertyImage_Property");
        });

        modelBuilder.Entity<PropertySource>(entity =>
        {
            entity.ToTable("PropertySource");

            entity.HasIndex(e => new { e.PropertyId, e.IsActive }, "IX_PropertySource_Property");

            entity.HasIndex(e => new { e.SourceId, e.ExternalId }, "UX_PropertySource_Source_ExternalId")
                .IsUnique()
                .HasFilter("([ExternalId] IS NOT NULL)");

            entity.Property(e => e.ExternalId).HasMaxLength(200);
            entity.Property(e => e.FirstSeenAtUtc)
                .HasPrecision(0)
                .HasDefaultValueSql("(sysutcdatetime())", "DF_PropertySource_FirstSeen");
            entity.Property(e => e.ImportNotes).HasMaxLength(1000);
            entity.Property(e => e.IsActive).HasDefaultValue(true, "DF_PropertySource_IsActive");
            entity.Property(e => e.LastSeenAtUtc)
                .HasPrecision(0)
                .HasDefaultValueSql("(sysutcdatetime())", "DF_PropertySource_LastSeen");
            entity.Property(e => e.LastVerifiedAtUtc).HasPrecision(0);
            entity.Property(e => e.OriginalTitle).HasMaxLength(300);
            entity.Property(e => e.OriginalUrl).HasMaxLength(1000);
            entity.Property(e => e.VerificationStatus)
                .HasMaxLength(30)
                .HasDefaultValue("Pending", "DF_PropertySource_Verification");

            entity.HasOne(d => d.Property).WithMany(p => p.PropertySources)
                .HasForeignKey(d => d.PropertyId)
                .HasConstraintName("FK_PropertySource_Property");

            entity.HasOne(d => d.Source).WithMany(p => p.PropertySources)
                .HasForeignKey(d => d.SourceId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_PropertySource_Source");
        });

        modelBuilder.Entity<PropertyStatus>(entity =>
        {
            entity.ToTable("PropertyStatus");

            entity.HasIndex(e => e.Name, "UQ_PropertyStatus_Name").IsUnique();

            entity.Property(e => e.Description).HasMaxLength(250);
            entity.Property(e => e.IsActive).HasDefaultValue(true, "DF_PropertyStatus_IsActive");
            entity.Property(e => e.Name).HasMaxLength(50);
        });

        modelBuilder.Entity<PropertyType>(entity =>
        {
            entity.ToTable("PropertyType");

            entity.HasIndex(e => e.Name, "UQ_PropertyType_Name").IsUnique();

            entity.Property(e => e.Description).HasMaxLength(250);
            entity.Property(e => e.IsActive).HasDefaultValue(true, "DF_PropertyType_IsActive");
            entity.Property(e => e.Name).HasMaxLength(60);
        });

        modelBuilder.Entity<Province>(entity =>
        {
            entity.ToTable("Province");

            entity.HasIndex(e => e.AutonomousCommunityId, "IX_Province_AutonomousCommunityId");

            entity.HasIndex(e => e.Name, "UQ_Province_Name").IsUnique();

            entity.Property(e => e.CreatedAtUtc)
                .HasPrecision(0)
                .HasDefaultValueSql("(sysutcdatetime())", "DF_Province_CreatedAtUtc");
            entity.Property(e => e.IneCode)
                .HasMaxLength(2)
                .IsUnicode(false)
                .IsFixedLength();
            entity.Property(e => e.IsActive).HasDefaultValue(true, "DF_Province_IsActive");
            entity.Property(e => e.Name).HasMaxLength(100);
            entity.Property(e => e.UpdatedAtUtc).HasPrecision(0);

            entity.HasOne(d => d.AutonomousCommunity).WithMany(p => p.Provinces)
                .HasForeignKey(d => d.AutonomousCommunityId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Province_AutonomousCommunity");
        });

        modelBuilder.Entity<SavedSearch>(entity =>
        {
            entity.ToTable("SavedSearch");

            entity.HasIndex(e => new { e.AppUserId, e.IsActive }, "IX_SavedSearch_User");

            entity.Property(e => e.CreatedAtUtc)
                .HasPrecision(0)
                .HasDefaultValueSql("(sysutcdatetime())", "DF_SavedSearch_CreatedAt");
            entity.Property(e => e.IsActive).HasDefaultValue(true, "DF_SavedSearch_IsActive");
            entity.Property(e => e.Name).HasMaxLength(120);
            entity.Property(e => e.UpdatedAtUtc).HasPrecision(0);

            entity.HasOne(d => d.AppUser).WithMany(p => p.SavedSearches)
                .HasForeignKey(d => d.AppUserId)
                .HasConstraintName("FK_SavedSearch_AppUser");
        });

        modelBuilder.Entity<Source>(entity =>
        {
            entity.ToTable("Source");

            entity.HasIndex(e => e.Name, "UQ_Source_Name").IsUnique();

            entity.Property(e => e.AccessNotes).HasMaxLength(1000);
            entity.Property(e => e.BaseUrl).HasMaxLength(500);
            entity.Property(e => e.CreatedAtUtc)
                .HasPrecision(0)
                .HasDefaultValueSql("(sysutcdatetime())", "DF_Source_CreatedAtUtc");
            entity.Property(e => e.IsActive).HasDefaultValue(true, "DF_Source_IsActive");
            entity.Property(e => e.Name).HasMaxLength(120);
            entity.Property(e => e.SourceType).HasMaxLength(30);
            entity.Property(e => e.UpdatedAtUtc).HasPrecision(0);
        });

        modelBuilder.Entity<SubscriptionPlan>(entity =>
        {
            entity.ToTable("SubscriptionPlan");

            entity.HasIndex(e => e.Code, "UQ_SubscriptionPlan_Code").IsUnique();

            entity.Property(e => e.BillingPeriod)
                .HasMaxLength(20)
                .HasDefaultValue("Monthly", "DF_SubscriptionPlan_Period");
            entity.Property(e => e.Code).HasMaxLength(40);
            entity.Property(e => e.CreatedAtUtc)
                .HasPrecision(0)
                .HasDefaultValueSql("(sysutcdatetime())", "DF_SubscriptionPlan_CreatedAt");
            entity.Property(e => e.CurrencyCode)
                .HasMaxLength(3)
                .IsUnicode(false)
                .IsFixedLength()
                .HasDefaultValue("EUR", "DF_SubscriptionPlan_Currency");
            entity.Property(e => e.Description).HasMaxLength(500);
            entity.Property(e => e.IsActive).HasDefaultValue(true, "DF_SubscriptionPlan_IsActive");
            entity.Property(e => e.Name).HasMaxLength(100);
            entity.Property(e => e.Price).HasColumnType("decimal(10, 2)");
        });

        modelBuilder.Entity<UserSubscription>(entity =>
        {
            entity.ToTable("UserSubscription");

            entity.HasIndex(e => new { e.AppUserId, e.Status }, "IX_UserSubscription_User_Status");

            entity.Property(e => e.CreatedAtUtc)
                .HasPrecision(0)
                .HasDefaultValueSql("(sysutcdatetime())", "DF_UserSubscription_CreatedAt");
            entity.Property(e => e.EndAtUtc).HasPrecision(0);
            entity.Property(e => e.ExternalPaymentId).HasMaxLength(200);
            entity.Property(e => e.StartAtUtc).HasPrecision(0);
            entity.Property(e => e.Status)
                .HasMaxLength(20)
                .HasDefaultValue("Pending", "DF_UserSubscription_Status");
            entity.Property(e => e.UpdatedAtUtc).HasPrecision(0);

            entity.HasOne(d => d.AppUser).WithMany(p => p.UserSubscriptions)
                .HasForeignKey(d => d.AppUserId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_UserSubscription_AppUser");

            entity.HasOne(d => d.SubscriptionPlan).WithMany(p => p.UserSubscriptions)
                .HasForeignKey(d => d.SubscriptionPlanId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_UserSubscription_Plan");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
