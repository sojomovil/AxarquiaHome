/*
================================================================================
 Script de creación de base de datos: AxarquiaHomeDb
 Generado a partir del esquema existente de AxarquiaHomeDb.
 Incluye: tablas, claves primarias, claves foráneas (relaciones),
          restricciones CHECK, valores por defecto e índices (únicos y no únicos).
================================================================================
*/

SET NOCOUNT ON;
GO

IF DB_ID(N'AxarquiaHomeDb') IS NULL
BEGIN
    CREATE DATABASE AxarquiaHomeDb;
END
GO

USE AxarquiaHomeDb;
GO

/* ============================================================================
   1. TABLAS DE CATÁLOGO / GEOGRAFÍA
   ============================================================================ */

CREATE TABLE dbo.AutonomousCommunity
(
    AutonomousCommunityId INT IDENTITY(1,1) NOT NULL,
    IneCode               CHAR(2)      NULL,
    Name                  NVARCHAR(200) NOT NULL,
    Country               NVARCHAR(200) NOT NULL CONSTRAINT DF_AutonomousCommunity_Country DEFAULT (N'España'),
    IsActive              BIT NOT NULL CONSTRAINT DF_AutonomousCommunity_IsActive DEFAULT ((1)),
    CreatedAtUtc          DATETIME2(6) NOT NULL CONSTRAINT DF_AutonomousCommunity_CreatedAtUtc DEFAULT (SYSUTCDATETIME()),
    UpdatedAtUtc          DATETIME2(6) NULL,
    CONSTRAINT PK_AutonomousCommunity PRIMARY KEY CLUSTERED (AutonomousCommunityId)
);
GO

CREATE TABLE dbo.Province
(
    ProvinceId             INT IDENTITY(1,1) NOT NULL,
    AutonomousCommunityId  INT NOT NULL,
    IneCode                CHAR(2) NULL,
    Name                   NVARCHAR(200) NOT NULL,
    IsActive               BIT NOT NULL CONSTRAINT DF_Province_IsActive DEFAULT ((1)),
    CreatedAtUtc           DATETIME2(6) NOT NULL CONSTRAINT DF_Province_CreatedAtUtc DEFAULT (SYSUTCDATETIME()),
    UpdatedAtUtc           DATETIME2(6) NULL,
    CONSTRAINT PK_Province PRIMARY KEY CLUSTERED (ProvinceId)
);
GO

CREATE TABLE dbo.Comarca
(
    ComarcaId     INT IDENTITY(1,1) NOT NULL,
    Name          NVARCHAR(200) NOT NULL,
    IsActive      BIT NOT NULL CONSTRAINT DF_Comarca_IsActive DEFAULT ((1)),
    CreatedAtUtc  DATETIME2(6) NOT NULL CONSTRAINT DF_Comarca_CreatedAtUtc DEFAULT (SYSUTCDATETIME()),
    UpdatedAtUtc  DATETIME2(6) NULL,
    ProvinceId    INT NOT NULL,
    CONSTRAINT PK_Comarca PRIMARY KEY CLUSTERED (ComarcaId)
);
GO

CREATE TABLE dbo.Municipality
(
    MunicipalityId INT IDENTITY(1,1) NOT NULL,
    Name           NVARCHAR(200) NOT NULL,
    IsActive       BIT NOT NULL CONSTRAINT DF_Municipality_IsActive DEFAULT ((1)),
    CreatedAtUtc   DATETIME2(6) NOT NULL CONSTRAINT DF_Municipality_CreatedAtUtc DEFAULT (SYSUTCDATETIME()),
    UpdatedAtUtc   DATETIME2(6) NULL,
    ComarcaId      INT NULL,
    ProvinceId     INT NOT NULL,
    CONSTRAINT PK_Municipality PRIMARY KEY CLUSTERED (MunicipalityId)
);
GO

CREATE TABLE dbo.Locality
(
    LocalityId     INT IDENTITY(1,1) NOT NULL,
    MunicipalityId INT NOT NULL,
    Name           NVARCHAR(240) NOT NULL,
    PostalCode     NVARCHAR(20) NULL,
    IsActive       BIT NOT NULL CONSTRAINT DF_Locality_IsActive DEFAULT ((1)),
    CreatedAtUtc   DATETIME2(6) NOT NULL CONSTRAINT DF_Locality_CreatedAtUtc DEFAULT (SYSUTCDATETIME()),
    UpdatedAtUtc   DATETIME2(6) NULL,
    CONSTRAINT PK_Locality PRIMARY KEY CLUSTERED (LocalityId)
);
GO

/* ============================================================================
   2. USUARIOS, AGENCIAS Y SUSCRIPCIONES
   ============================================================================ */

CREATE TABLE dbo.AppUser
(
    AppUserId        UNIQUEIDENTIFIER NOT NULL CONSTRAINT DF_AppUser_Id DEFAULT (NEWSEQUENTIALID()),
    Email            NVARCHAR(320) NOT NULL,
    NormalizedEmail  NVARCHAR(512) NOT NULL,
    DisplayName      NVARCHAR(320) NOT NULL,
    PhoneNumber      NVARCHAR(60) NULL,
    PasswordHash     NVARCHAR(1000) NULL,
    UserRole         NVARCHAR(60) NOT NULL CONSTRAINT DF_AppUser_Role DEFAULT (N'User'),
    IsEmailVerified  BIT NOT NULL CONSTRAINT DF_AppUser_EmailVerified DEFAULT ((0)),
    IsActive         BIT NOT NULL CONSTRAINT DF_AppUser_IsActive DEFAULT ((1)),
    CreatedAtUtc     DATETIME2(6) NOT NULL CONSTRAINT DF_AppUser_CreatedAtUtc DEFAULT (SYSUTCDATETIME()),
    UpdatedAtUtc     DATETIME2(6) NULL,
    LastLoginAtUtc   DATETIME2(6) NULL,
    CONSTRAINT PK_AppUser PRIMARY KEY CLUSTERED (AppUserId),
    CONSTRAINT CK_AppUser_UserRole CHECK ([UserRole] = N'Administrator' OR [UserRole] = N'Agency' OR [UserRole] = N'Premium' OR [UserRole] = N'User')
);
GO

CREATE TABLE dbo.Agency
(
    AgencyId       INT IDENTITY(1,1) NOT NULL,
    AppUserId      UNIQUEIDENTIFIER NULL,
    Name           NVARCHAR(360) NOT NULL,
    TaxIdentifier  NVARCHAR(60) NULL,
    Email          NVARCHAR(512) NULL,
    PhoneNumber    NVARCHAR(60) NULL,
    Website        NVARCHAR(1000) NULL,
    Address        NVARCHAR(600) NULL,
    MunicipalityId INT NULL,
    LocalityId     INT NULL,
    Description    NVARCHAR(4000) NULL,
    IsVerified     BIT NOT NULL CONSTRAINT DF_Agency_IsVerified DEFAULT ((0)),
    IsActive       BIT NOT NULL CONSTRAINT DF_Agency_IsActive DEFAULT ((1)),
    CreatedAtUtc   DATETIME2(6) NOT NULL CONSTRAINT DF_Agency_CreatedAtUtc DEFAULT (SYSUTCDATETIME()),
    UpdatedAtUtc   DATETIME2(6) NULL,
    CONSTRAINT PK_Agency PRIMARY KEY CLUSTERED (AgencyId)
);
GO

CREATE TABLE dbo.SubscriptionPlan
(
    SubscriptionPlanId INT IDENTITY(1,1) NOT NULL,
    Code               NVARCHAR(80) NOT NULL,
    Name               NVARCHAR(200) NOT NULL,
    Description        NVARCHAR(1000) NULL,
    Price              DECIMAL(18,2) NOT NULL CONSTRAINT DF_SubscriptionPlan_Price DEFAULT ((0)),
    CurrencyCode       CHAR(3) NOT NULL CONSTRAINT DF_SubscriptionPlan_Currency DEFAULT ('EUR'),
    BillingPeriod      NVARCHAR(40) NOT NULL CONSTRAINT DF_SubscriptionPlan_Period DEFAULT (N'Monthly'),
    IsActive           BIT NOT NULL CONSTRAINT DF_SubscriptionPlan_IsActive DEFAULT ((1)),
    CreatedAtUtc       DATETIME2(6) NOT NULL CONSTRAINT DF_SubscriptionPlan_CreatedAt DEFAULT (SYSUTCDATETIME()),
    CONSTRAINT PK_SubscriptionPlan PRIMARY KEY CLUSTERED (SubscriptionPlanId),
    CONSTRAINT CK_SubscriptionPlan_Period CHECK ([BillingPeriod] = N'OneTime' OR [BillingPeriod] = N'Yearly' OR [BillingPeriod] = N'Monthly'),
    CONSTRAINT CK_SubscriptionPlan_Price CHECK ([Price] >= (0))
);
GO

CREATE TABLE dbo.UserSubscription
(
    UserSubscriptionId INT IDENTITY(1,1) NOT NULL,
    AppUserId          UNIQUEIDENTIFIER NOT NULL,
    SubscriptionPlanId INT NOT NULL,
    Status             NVARCHAR(40) NOT NULL CONSTRAINT DF_UserSubscription_Status DEFAULT (N'Pending'),
    StartAtUtc         DATETIME2(6) NULL,
    EndAtUtc           DATETIME2(6) NULL,
    ExternalPaymentId  NVARCHAR(400) NULL,
    CreatedAtUtc       DATETIME2(6) NOT NULL CONSTRAINT DF_UserSubscription_CreatedAt DEFAULT (SYSUTCDATETIME()),
    UpdatedAtUtc       DATETIME2(6) NULL,
    CONSTRAINT PK_UserSubscription PRIMARY KEY CLUSTERED (UserSubscriptionId),
    CONSTRAINT CK_UserSubscription_Dates CHECK ([EndAtUtc] IS NULL OR [StartAtUtc] IS NULL OR [EndAtUtc] >= [StartAtUtc]),
    CONSTRAINT CK_UserSubscription_Status CHECK ([Status] = N'Failed' OR [Status] = N'Expired' OR [Status] = N'Cancelled' OR [Status] = N'Active' OR [Status] = N'Pending')
);
GO

/* ============================================================================
   3. CATÁLOGOS DE PROPIEDADES
   ============================================================================ */

CREATE TABLE dbo.PropertyType
(
    PropertyTypeId SMALLINT IDENTITY(1,1) NOT NULL,
    Name           NVARCHAR(120) NOT NULL,
    Description    NVARCHAR(500) NULL,
    IsActive       BIT NOT NULL CONSTRAINT DF_PropertyType_IsActive DEFAULT ((1)),
    CONSTRAINT PK_PropertyType PRIMARY KEY CLUSTERED (PropertyTypeId)
);
GO

CREATE TABLE dbo.PropertyStatus
(
    PropertyStatusId SMALLINT IDENTITY(1,1) NOT NULL,
    Name             NVARCHAR(100) NOT NULL,
    Description      NVARCHAR(500) NULL,
    IsActive         BIT NOT NULL CONSTRAINT DF_PropertyStatus_IsActive DEFAULT ((1)),
    CONSTRAINT PK_PropertyStatus PRIMARY KEY CLUSTERED (PropertyStatusId)
);
GO

CREATE TABLE dbo.Feature
(
    FeatureId INT IDENTITY(1,1) NOT NULL,
    Name      NVARCHAR(200) NOT NULL,
    Category  NVARCHAR(120) NULL,
    DataType  NVARCHAR(40) NOT NULL CONSTRAINT DF_Feature_DataType DEFAULT (N'Boolean'),
    Unit      NVARCHAR(60) NULL,
    IsActive  BIT NOT NULL CONSTRAINT DF_Feature_IsActive DEFAULT ((1)),
    CONSTRAINT PK_Feature PRIMARY KEY CLUSTERED (FeatureId),
    CONSTRAINT CK_Feature_DataType CHECK ([DataType] = N'Text' OR [DataType] = N'Number' OR [DataType] = N'Boolean')
);
GO

CREATE TABLE dbo.Source
(
    SourceId      INT IDENTITY(1,1) NOT NULL,
    Name          NVARCHAR(240) NOT NULL,
    BaseUrl       NVARCHAR(1000) NULL,
    SourceType    NVARCHAR(60) NOT NULL,
    IsAuthorized  BIT NOT NULL CONSTRAINT DF_Source_IsAuthorized DEFAULT ((0)),
    IsActive      BIT NOT NULL CONSTRAINT DF_Source_IsActive DEFAULT ((1)),
    AccessNotes   NVARCHAR(2000) NULL,
    CreatedAtUtc  DATETIME2(6) NOT NULL CONSTRAINT DF_Source_CreatedAtUtc DEFAULT (SYSUTCDATETIME()),
    UpdatedAtUtc  DATETIME2(6) NULL,
    CONSTRAINT PK_Source PRIMARY KEY CLUSTERED (SourceId),
    CONSTRAINT CK_Source_SourceType CHECK ([SourceType] = N'Other' OR [SourceType] = N'Import' OR [SourceType] = N'Owner' OR [SourceType] = N'Agency' OR [SourceType] = N'Portal')
);
GO

/* ============================================================================
   4. PROPIEDADES
   ============================================================================ */

CREATE TABLE dbo.Property
(
    PropertyId           BIGINT IDENTITY(1,1) NOT NULL,
    PropertyTypeId       SMALLINT NOT NULL,
    PropertyStatusId     SMALLINT NOT NULL,
    MunicipalityId       INT NOT NULL,
    LocalityId           INT NULL,
    AgencyId             INT NULL,
    OwnerUserId          UNIQUEIDENTIFIER NULL,
    Title                NVARCHAR(500) NOT NULL,
    Description          NVARCHAR(MAX) NULL,
    OperationType        NVARCHAR(40) NOT NULL,
    Price                DECIMAL(18,2) NOT NULL,
    CurrencyCode         CHAR(3) NOT NULL CONSTRAINT DF_Property_Currency DEFAULT ('EUR'),
    BuiltAreaM2          DECIMAL(10,2) NULL,
    UsableAreaM2         DECIMAL(10,2) NULL,
    PlotAreaM2           DECIMAL(10,2) NULL,
    Bedrooms             TINYINT NULL,
    Bathrooms            TINYINT NULL,
    FloorNumber          SMALLINT NULL,
    TotalFloors          SMALLINT NULL,
    YearBuilt            SMALLINT NULL,
    Address              NVARCHAR(600) NULL,
    PostalCode           NVARCHAR(20) NULL,
    Latitude             DECIMAL(9,6) NULL,
    Longitude            DECIMAL(9,6) NULL,
    DistanceToBeachM     INT NULL,
    HasLift              BIT NULL,
    HasTerrace           BIT NULL,
    HasBalcony           BIT NULL,
    HasPool              BIT NULL,
    HasGarden            BIT NULL,
    HasParking           BIT NULL,
    HasAirConditioning   BIT NULL,
    IsFurnished          BIT NULL,
    EnergyRating         NVARCHAR(20) NULL,
    ConditionDescription NVARCHAR(100) NULL,
    IsPublished          BIT NOT NULL CONSTRAINT DF_Property_IsPublished DEFAULT ((0)),
    IsFeatured           BIT NOT NULL CONSTRAINT DF_Property_IsFeatured DEFAULT ((0)),
    IsVerified           BIT NOT NULL CONSTRAINT DF_Property_IsVerified DEFAULT ((0)),
    PublishedAtUtc       DATETIME2(6) NULL,
    FirstDetectedAtUtc   DATETIME2(6) NULL,
    LastCheckedAtUtc     DATETIME2(6) NULL,
    CreatedAtUtc         DATETIME2(6) NOT NULL CONSTRAINT DF_Property_CreatedAtUtc DEFAULT (SYSUTCDATETIME()),
    UpdatedAtUtc         DATETIME2(6) NULL,
    RowVersion           ROWVERSION NOT NULL,
    CONSTRAINT PK_Property PRIMARY KEY CLUSTERED (PropertyId),
    CONSTRAINT CK_Property_Areas CHECK (([BuiltAreaM2] IS NULL OR [BuiltAreaM2] >= (0)) AND ([UsableAreaM2] IS NULL OR [UsableAreaM2] >= (0)) AND ([PlotAreaM2] IS NULL OR [PlotAreaM2] >= (0))),
    CONSTRAINT CK_Property_DistanceToBeach CHECK ([DistanceToBeachM] IS NULL OR [DistanceToBeachM] >= (0)),
    CONSTRAINT CK_Property_Latitude CHECK ([Latitude] IS NULL OR [Latitude] >= (-90) AND [Latitude] <= (90)),
    CONSTRAINT CK_Property_Longitude CHECK ([Longitude] IS NULL OR [Longitude] >= (-180) AND [Longitude] <= (180)),
    CONSTRAINT CK_Property_OperationType CHECK ([OperationType] = N'SeasonalRent' OR [OperationType] = N'Rent' OR [OperationType] = N'Sale'),
    CONSTRAINT CK_Property_Price CHECK ([Price] >= (0))
);
GO

CREATE TABLE dbo.PropertyFeature
(
    PropertyId   BIGINT NOT NULL,
    FeatureId    INT NOT NULL,
    BooleanValue BIT NULL,
    NumberValue  DECIMAL(18,4) NULL,
    TextValue    NVARCHAR(1000) NULL,
    CONSTRAINT PK_PropertyFeature PRIMARY KEY CLUSTERED (PropertyId, FeatureId),
    CONSTRAINT CK_PropertyFeature_OneValue CHECK (((CASE WHEN [BooleanValue] IS NOT NULL THEN (1) ELSE (0) END + CASE WHEN [NumberValue] IS NOT NULL THEN (1) ELSE (0) END) + CASE WHEN [TextValue] IS NOT NULL THEN (1) ELSE (0) END) = (1))
);
GO

CREATE TABLE dbo.PropertyImage
(
    PropertyImageId BIGINT IDENTITY(1,1) NOT NULL,
    PropertyId      BIGINT NOT NULL,
    ImageUrl        NVARCHAR(2000) NOT NULL,
    ThumbnailUrl    NVARCHAR(2000) NULL,
    Caption         NVARCHAR(500) NULL,
    DisplayOrder    INT NOT NULL CONSTRAINT DF_PropertyImage_DisplayOrder DEFAULT ((0)),
    IsPrimary       BIT NOT NULL CONSTRAINT DF_PropertyImage_IsPrimary DEFAULT ((0)),
    SourceImageUrl  NVARCHAR(2000) NULL,
    CreatedAtUtc    DATETIME2(6) NOT NULL CONSTRAINT DF_PropertyImage_CreatedAtUtc DEFAULT (SYSUTCDATETIME()),
    CONSTRAINT PK_PropertyImage PRIMARY KEY CLUSTERED (PropertyImageId),
    CONSTRAINT CK_PropertyImage_DisplayOrder CHECK ([DisplayOrder] >= (0))
);
GO

CREATE TABLE dbo.PropertyListing
(
    PropertyListingId BIGINT IDENTITY(1,1) NOT NULL,
    PropertyId        BIGINT NOT NULL,
    OperationType      NVARCHAR(40) NOT NULL,
    PricePeriod        NVARCHAR(40) NOT NULL,
    Price              DECIMAL(18,2) NOT NULL,
    CurrencyCode       CHAR(3) NOT NULL CONSTRAINT DF_PropertyListing_Currency DEFAULT ('EUR'),
    DepositAmount      DECIMAL(18,2) NULL,
    MinStayUnits       INT NULL,
    MaxStayUnits       INT NULL,
    UtilitiesIncluded  BIT NULL,
    AvailableFromDate  DATE NULL,
    IsActive           BIT NOT NULL CONSTRAINT DF_PropertyListing_IsActive DEFAULT ((1)),
    CreatedAtUtc       DATETIME2(6) NOT NULL CONSTRAINT DF_PropertyListing_CreatedAtUtc DEFAULT (SYSUTCDATETIME()),
    UpdatedAtUtc       DATETIME2(6) NULL,
    CONSTRAINT PK_PropertyListing PRIMARY KEY CLUSTERED (PropertyListingId),
    CONSTRAINT CK_PropertyListing_OperationType CHECK ([OperationType] = N'SeasonalRent' OR [OperationType] = N'Rent' OR [OperationType] = N'Sale'),
    CONSTRAINT CK_PropertyListing_PricePeriod CHECK ([PricePeriod] = N'Daily' OR [PricePeriod] = N'Monthly' OR [PricePeriod] = N'OneTime'),
    CONSTRAINT CK_PropertyListing_Operation_Period CHECK ([OperationType] = N'Sale' AND [PricePeriod] = N'OneTime' OR ([OperationType] = N'SeasonalRent' OR [OperationType] = N'Rent') AND ([PricePeriod] = N'Daily' OR [PricePeriod] = N'Monthly')),
    CONSTRAINT CK_PropertyListing_Price CHECK ([Price] >= (0) AND ([DepositAmount] IS NULL OR [DepositAmount] >= (0))),
    CONSTRAINT CK_PropertyListing_StayUnits CHECK (([MinStayUnits] IS NULL OR [MinStayUnits] > (0)) AND ([MaxStayUnits] IS NULL OR [MaxStayUnits] >= ISNULL([MinStayUnits], (1))))
);
GO

CREATE TABLE dbo.PropertySource
(
    PropertySourceId     BIGINT IDENTITY(1,1) NOT NULL,
    PropertyId           BIGINT NOT NULL,
    SourceId             INT NOT NULL,
    ExternalId           NVARCHAR(400) NULL,
    OriginalUrl          NVARCHAR(2000) NOT NULL,
    OriginalTitle        NVARCHAR(600) NULL,
    OriginalDescription  NVARCHAR(MAX) NULL,
    FirstSeenAtUtc       DATETIME2(6) NOT NULL CONSTRAINT DF_PropertySource_FirstSeen DEFAULT (SYSUTCDATETIME()),
    LastSeenAtUtc        DATETIME2(6) NOT NULL CONSTRAINT DF_PropertySource_LastSeen DEFAULT (SYSUTCDATETIME()),
    LastVerifiedAtUtc    DATETIME2(6) NULL,
    IsActive             BIT NOT NULL CONSTRAINT DF_PropertySource_IsActive DEFAULT ((1)),
    VerificationStatus   NVARCHAR(60) NOT NULL CONSTRAINT DF_PropertySource_Verification DEFAULT (N'Pending'),
    ImportNotes          NVARCHAR(2000) NULL,
    CONSTRAINT PK_PropertySource PRIMARY KEY CLUSTERED (PropertySourceId),
    CONSTRAINT CK_PropertySource_Verification CHECK ([VerificationStatus] = N'Error' OR [VerificationStatus] = N'Rejected' OR [VerificationStatus] = N'Unavailable' OR [VerificationStatus] = N'Verified' OR [VerificationStatus] = N'Pending')
);
GO

CREATE TABLE dbo.PriceHistory
(
    PriceHistoryId    BIGINT IDENTITY(1,1) NOT NULL,
    PropertyId        BIGINT NOT NULL,
    Price             DECIMAL(18,2) NOT NULL,
    PreviousPrice     DECIMAL(18,2) NULL,
    CurrencyCode      CHAR(3) NOT NULL CONSTRAINT DF_PriceHistory_Currency DEFAULT ('EUR'),
    ChangeType        NVARCHAR(40) NOT NULL,
    RecordedAtUtc     DATETIME2(6) NOT NULL CONSTRAINT DF_PriceHistory_RecordedAt DEFAULT (SYSUTCDATETIME()),
    SourceId          INT NULL,
    Notes             NVARCHAR(1000) NULL,
    PropertyListingId BIGINT NULL,
    CONSTRAINT PK_PriceHistory PRIMARY KEY CLUSTERED (PriceHistoryId),
    CONSTRAINT CK_PriceHistory_ChangeType CHECK ([ChangeType] = N'Unchanged' OR [ChangeType] = N'Decrease' OR [ChangeType] = N'Increase' OR [ChangeType] = N'Initial'),
    CONSTRAINT CK_PriceHistory_PreviousPrice CHECK ([PreviousPrice] IS NULL OR [PreviousPrice] >= (0)),
    CONSTRAINT CK_PriceHistory_Price CHECK ([Price] >= (0))
);
GO

/* ============================================================================
   5. RESERVAS, FAVORITOS, BÚSQUEDAS Y ALERTAS
   ============================================================================ */

CREATE TABLE dbo.RentalBooking
(
    RentalBookingId    BIGINT IDENTITY(1,1) NOT NULL,
    PropertyListingId  BIGINT NOT NULL,
    TenantUserId       UNIQUEIDENTIFIER NOT NULL,
    StartDate          DATE NOT NULL,
    EndDate            DATE NOT NULL,
    BillingUnit        NVARCHAR(40) NOT NULL,
    QuantityUnits      INT NOT NULL,
    UnitPriceSnapshot  DECIMAL(18,2) NOT NULL,
    TotalAmount        DECIMAL(18,2) NOT NULL,
    DepositAmount      DECIMAL(18,2) NULL,
    CurrencyCode       CHAR(3) NOT NULL CONSTRAINT DF_RentalBooking_Currency DEFAULT ('EUR'),
    Status             NVARCHAR(40) NOT NULL CONSTRAINT DF_RentalBooking_Status DEFAULT (N'Pending'),
    Notes              NVARCHAR(2000) NULL,
    CreatedAtUtc       DATETIME2(6) NOT NULL CONSTRAINT DF_RentalBooking_CreatedAtUtc DEFAULT (SYSUTCDATETIME()),
    UpdatedAtUtc       DATETIME2(6) NULL,
    CONSTRAINT PK_RentalBooking PRIMARY KEY CLUSTERED (RentalBookingId),
    CONSTRAINT CK_RentalBooking_Dates CHECK ([EndDate] > [StartDate]),
    CONSTRAINT CK_RentalBooking_BillingUnit CHECK ([BillingUnit] = N'Monthly' OR [BillingUnit] = N'Daily'),
    CONSTRAINT CK_RentalBooking_Amounts CHECK ([QuantityUnits] > (0) AND [UnitPriceSnapshot] >= (0) AND [TotalAmount] >= (0)),
    CONSTRAINT CK_RentalBooking_Status CHECK ([Status] = N'Cancelled' OR [Status] = N'Completed' OR [Status] = N'Active' OR [Status] = N'Confirmed' OR [Status] = N'Pending')
);
GO

CREATE TABLE dbo.Favorite
(
    AppUserId    UNIQUEIDENTIFIER NOT NULL,
    PropertyId   BIGINT NOT NULL,
    CreatedAtUtc DATETIME2(6) NOT NULL CONSTRAINT DF_Favorite_CreatedAt DEFAULT (SYSUTCDATETIME()),
    CONSTRAINT PK_Favorite PRIMARY KEY CLUSTERED (AppUserId, PropertyId)
);
GO

CREATE TABLE dbo.SavedSearch
(
    SavedSearchId       BIGINT IDENTITY(1,1) NOT NULL,
    AppUserId           UNIQUEIDENTIFIER NOT NULL,
    Name                NVARCHAR(240) NOT NULL,
    SearchCriteriaJson  NVARCHAR(MAX) NOT NULL,
    IsActive            BIT NOT NULL CONSTRAINT DF_SavedSearch_IsActive DEFAULT ((1)),
    CreatedAtUtc        DATETIME2(6) NOT NULL CONSTRAINT DF_SavedSearch_CreatedAt DEFAULT (SYSUTCDATETIME()),
    UpdatedAtUtc        DATETIME2(6) NULL,
    CONSTRAINT PK_SavedSearch PRIMARY KEY CLUSTERED (SavedSearchId),
    CONSTRAINT CK_SavedSearch_Json CHECK (ISJSON([SearchCriteriaJson]) = (1))
);
GO

CREATE TABLE dbo.Alert
(
    AlertId          BIGINT IDENTITY(1,1) NOT NULL,
    SavedSearchId    BIGINT NOT NULL,
    AlertType        NVARCHAR(60) NOT NULL CONSTRAINT DF_Alert_Type DEFAULT (N'NewProperty'),
    DeliveryChannel  NVARCHAR(40) NOT NULL CONSTRAINT DF_Alert_Channel DEFAULT (N'Email'),
    IsEnabled        BIT NOT NULL CONSTRAINT DF_Alert_IsEnabled DEFAULT ((1)),
    Frequency        NVARCHAR(40) NOT NULL CONSTRAINT DF_Alert_Frequency DEFAULT (N'Daily'),
    LastSentAtUtc    DATETIME2(6) NULL,
    CreatedAtUtc     DATETIME2(6) NOT NULL CONSTRAINT DF_Alert_CreatedAt DEFAULT (SYSUTCDATETIME()),
    CONSTRAINT PK_Alert PRIMARY KEY CLUSTERED (AlertId),
    CONSTRAINT CK_Alert_Channel CHECK ([DeliveryChannel] = N'InApp' OR [DeliveryChannel] = N'Email'),
    CONSTRAINT CK_Alert_Frequency CHECK ([Frequency] = N'Weekly' OR [Frequency] = N'Daily' OR [Frequency] = N'Immediate'),
    CONSTRAINT CK_Alert_Type CHECK ([AlertType] = N'AnyChange' OR [AlertType] = N'PriceChange' OR [AlertType] = N'NewProperty')
);
GO

/* ============================================================================
   6. ÍNDICES (ÚNICOS Y NO ÚNICOS)
   ============================================================================ */

CREATE UNIQUE INDEX UQ_AutonomousCommunity_Name_Country ON dbo.AutonomousCommunity (Name, Country);
CREATE UNIQUE INDEX UQ_Province_Name ON dbo.Province (Name);
CREATE INDEX IX_Province_AutonomousCommunityId ON dbo.Province (AutonomousCommunityId) INCLUDE (Name, IsActive);

CREATE UNIQUE INDEX UQ_Comarca_Name_ProvinceId ON dbo.Comarca (Name, ProvinceId);
CREATE INDEX IX_Comarca_ProvinceId ON dbo.Comarca (ProvinceId) INCLUDE (Name, IsActive);

CREATE UNIQUE INDEX UQ_Municipality_Name_ProvinceId ON dbo.Municipality (Name, ProvinceId);
CREATE INDEX IX_Municipality_ComarcaId ON dbo.Municipality (ComarcaId) INCLUDE (Name, IsActive);
CREATE INDEX IX_Municipality_ProvinceId ON dbo.Municipality (ProvinceId) INCLUDE (Name, ComarcaId, IsActive);

CREATE UNIQUE INDEX UQ_Locality_Municipality_Name ON dbo.Locality (MunicipalityId, Name);

CREATE UNIQUE INDEX UQ_AppUser_NormalizedEmail ON dbo.AppUser (NormalizedEmail);

CREATE UNIQUE INDEX UQ_Feature_Name ON dbo.Feature (Name);
CREATE UNIQUE INDEX UQ_PropertyStatus_Name ON dbo.PropertyStatus (Name);
CREATE UNIQUE INDEX UQ_PropertyType_Name ON dbo.PropertyType (Name);
CREATE UNIQUE INDEX UQ_Source_Name ON dbo.Source (Name);
CREATE UNIQUE INDEX UQ_SubscriptionPlan_Code ON dbo.SubscriptionPlan (Code);

CREATE INDEX IX_Property_Coordinates ON dbo.Property (Latitude, Longitude);
CREATE INDEX IX_Property_Locality ON dbo.Property (LocalityId) INCLUDE (Price, BuiltAreaM2, Bedrooms, OperationType, IsPublished);
CREATE INDEX IX_Property_Published ON dbo.Property (IsPublished, PublishedAtUtc) INCLUDE (MunicipalityId, PropertyTypeId, OperationType, Price, BuiltAreaM2);
CREATE INDEX IX_Property_Search ON dbo.Property (MunicipalityId, PropertyTypeId, OperationType, Price) INCLUDE (BuiltAreaM2, Bedrooms, Bathrooms, PropertyStatusId, IsPublished);

CREATE INDEX IX_PropertyImage_Property_Order ON dbo.PropertyImage (PropertyId, DisplayOrder);

CREATE INDEX IX_PropertyListing_Search ON dbo.PropertyListing (OperationType, PricePeriod, IsActive, Price) INCLUDE (PropertyId, MinStayUnits, AvailableFromDate);
CREATE UNIQUE INDEX UX_PropertyListing_Active_Mode ON dbo.PropertyListing (PropertyId, OperationType, PricePeriod);

CREATE INDEX IX_PropertySource_Property ON dbo.PropertySource (PropertyId, IsActive);
CREATE UNIQUE INDEX UX_PropertySource_Source_ExternalId ON dbo.PropertySource (SourceId, ExternalId);

CREATE INDEX IX_PriceHistory_Property_Date ON dbo.PriceHistory (PropertyId, RecordedAtUtc);

CREATE INDEX IX_RentalBooking_Listing_Dates ON dbo.RentalBooking (PropertyListingId, StartDate, EndDate) INCLUDE (Status);

CREATE INDEX IX_Favorite_Property ON dbo.Favorite (PropertyId);

CREATE INDEX IX_SavedSearch_User ON dbo.SavedSearch (AppUserId, IsActive);

CREATE INDEX IX_UserSubscription_User_Status ON dbo.UserSubscription (AppUserId, Status);
GO

/* ============================================================================
   7. CLAVES FORÁNEAS (RELACIONES)
   ============================================================================ */

ALTER TABLE dbo.Province
    ADD CONSTRAINT FK_Province_AutonomousCommunity FOREIGN KEY (AutonomousCommunityId)
        REFERENCES dbo.AutonomousCommunity (AutonomousCommunityId);

ALTER TABLE dbo.Comarca
    ADD CONSTRAINT FK_Comarca_Province FOREIGN KEY (ProvinceId)
        REFERENCES dbo.Province (ProvinceId);

ALTER TABLE dbo.Municipality
    ADD CONSTRAINT FK_Municipality_Comarca FOREIGN KEY (ComarcaId)
        REFERENCES dbo.Comarca (ComarcaId);

ALTER TABLE dbo.Municipality
    ADD CONSTRAINT FK_Municipality_Province FOREIGN KEY (ProvinceId)
        REFERENCES dbo.Province (ProvinceId);

ALTER TABLE dbo.Locality
    ADD CONSTRAINT FK_Locality_Municipality FOREIGN KEY (MunicipalityId)
        REFERENCES dbo.Municipality (MunicipalityId);

ALTER TABLE dbo.Agency
    ADD CONSTRAINT FK_Agency_AppUser FOREIGN KEY (AppUserId)
        REFERENCES dbo.AppUser (AppUserId);

ALTER TABLE dbo.Agency
    ADD CONSTRAINT FK_Agency_Municipality FOREIGN KEY (MunicipalityId)
        REFERENCES dbo.Municipality (MunicipalityId);

ALTER TABLE dbo.Agency
    ADD CONSTRAINT FK_Agency_Locality FOREIGN KEY (LocalityId)
        REFERENCES dbo.Locality (LocalityId);

ALTER TABLE dbo.UserSubscription
    ADD CONSTRAINT FK_UserSubscription_AppUser FOREIGN KEY (AppUserId)
        REFERENCES dbo.AppUser (AppUserId);

ALTER TABLE dbo.UserSubscription
    ADD CONSTRAINT FK_UserSubscription_Plan FOREIGN KEY (SubscriptionPlanId)
        REFERENCES dbo.SubscriptionPlan (SubscriptionPlanId);

ALTER TABLE dbo.Property
    ADD CONSTRAINT FK_Property_PropertyType FOREIGN KEY (PropertyTypeId)
        REFERENCES dbo.PropertyType (PropertyTypeId);

ALTER TABLE dbo.Property
    ADD CONSTRAINT FK_Property_PropertyStatus FOREIGN KEY (PropertyStatusId)
        REFERENCES dbo.PropertyStatus (PropertyStatusId);

ALTER TABLE dbo.Property
    ADD CONSTRAINT FK_Property_Municipality FOREIGN KEY (MunicipalityId)
        REFERENCES dbo.Municipality (MunicipalityId);

ALTER TABLE dbo.Property
    ADD CONSTRAINT FK_Property_Locality FOREIGN KEY (LocalityId)
        REFERENCES dbo.Locality (LocalityId);

ALTER TABLE dbo.Property
    ADD CONSTRAINT FK_Property_Agency FOREIGN KEY (AgencyId)
        REFERENCES dbo.Agency (AgencyId);

ALTER TABLE dbo.Property
    ADD CONSTRAINT FK_Property_OwnerUser FOREIGN KEY (OwnerUserId)
        REFERENCES dbo.AppUser (AppUserId);

ALTER TABLE dbo.PropertyFeature
    ADD CONSTRAINT FK_PropertyFeature_Property FOREIGN KEY (PropertyId)
        REFERENCES dbo.Property (PropertyId) ON DELETE CASCADE;

ALTER TABLE dbo.PropertyFeature
    ADD CONSTRAINT FK_PropertyFeature_Feature FOREIGN KEY (FeatureId)
        REFERENCES dbo.Feature (FeatureId);

ALTER TABLE dbo.PropertyImage
    ADD CONSTRAINT FK_PropertyImage_Property FOREIGN KEY (PropertyId)
        REFERENCES dbo.Property (PropertyId) ON DELETE CASCADE;

ALTER TABLE dbo.PropertyListing
    ADD CONSTRAINT FK_PropertyListing_Property FOREIGN KEY (PropertyId)
        REFERENCES dbo.Property (PropertyId) ON DELETE CASCADE;

ALTER TABLE dbo.PropertySource
    ADD CONSTRAINT FK_PropertySource_Property FOREIGN KEY (PropertyId)
        REFERENCES dbo.Property (PropertyId) ON DELETE CASCADE;

ALTER TABLE dbo.PropertySource
    ADD CONSTRAINT FK_PropertySource_Source FOREIGN KEY (SourceId)
        REFERENCES dbo.Source (SourceId);

ALTER TABLE dbo.PriceHistory
    ADD CONSTRAINT FK_PriceHistory_Property FOREIGN KEY (PropertyId)
        REFERENCES dbo.Property (PropertyId) ON DELETE CASCADE;

ALTER TABLE dbo.PriceHistory
    ADD CONSTRAINT FK_PriceHistory_PropertyListing FOREIGN KEY (PropertyListingId)
        REFERENCES dbo.PropertyListing (PropertyListingId);

ALTER TABLE dbo.PriceHistory
    ADD CONSTRAINT FK_PriceHistory_Source FOREIGN KEY (SourceId)
        REFERENCES dbo.Source (SourceId);

ALTER TABLE dbo.RentalBooking
    ADD CONSTRAINT FK_RentalBooking_PropertyListing FOREIGN KEY (PropertyListingId)
        REFERENCES dbo.PropertyListing (PropertyListingId);

ALTER TABLE dbo.RentalBooking
    ADD CONSTRAINT FK_RentalBooking_TenantUser FOREIGN KEY (TenantUserId)
        REFERENCES dbo.AppUser (AppUserId);

ALTER TABLE dbo.Favorite
    ADD CONSTRAINT FK_Favorite_AppUser FOREIGN KEY (AppUserId)
        REFERENCES dbo.AppUser (AppUserId) ON DELETE CASCADE;

ALTER TABLE dbo.Favorite
    ADD CONSTRAINT FK_Favorite_Property FOREIGN KEY (PropertyId)
        REFERENCES dbo.Property (PropertyId) ON DELETE CASCADE;

ALTER TABLE dbo.SavedSearch
    ADD CONSTRAINT FK_SavedSearch_AppUser FOREIGN KEY (AppUserId)
        REFERENCES dbo.AppUser (AppUserId) ON DELETE CASCADE;

ALTER TABLE dbo.Alert
    ADD CONSTRAINT FK_Alert_SavedSearch FOREIGN KEY (SavedSearchId)
        REFERENCES dbo.SavedSearch (SavedSearchId) ON DELETE CASCADE;
GO

PRINT N'Esquema de AxarquiaHomeDb creado correctamente.';
GO
