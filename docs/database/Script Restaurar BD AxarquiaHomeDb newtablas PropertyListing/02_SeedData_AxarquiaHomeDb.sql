/*
================================================================================
 Script de datos (INSERTs) para AxarquiaHomeDb
 Generado automaticamente desde el servidor origen.
 Ejecutar DESPUES de 01_CreateDatabase_AxarquiaHomeDb.sql
================================================================================
*/
SET NOCOUNT ON;
USE AxarquiaHomeDb;
GO

-- =========================================================================
-- Datos de la tabla: AutonomousCommunity
-- =========================================================================
SET IDENTITY_INSERT dbo.[AutonomousCommunity] ON;
INSERT INTO dbo.[AutonomousCommunity] ([AutonomousCommunityId], [IneCode], [Name], [Country], [IsActive], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (1, N'01', N'Andalucía', N'España', 1, '2026-11-12T15:45:41.0000000', NULL);
INSERT INTO dbo.[AutonomousCommunity] ([AutonomousCommunityId], [IneCode], [Name], [Country], [IsActive], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (2, N'02', N'Aragón', N'España', 1, '2026-11-12T15:45:41.0000000', NULL);
INSERT INTO dbo.[AutonomousCommunity] ([AutonomousCommunityId], [IneCode], [Name], [Country], [IsActive], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (3, N'03', N'Principado de Asturias', N'España', 1, '2026-11-12T15:45:41.0000000', NULL);
INSERT INTO dbo.[AutonomousCommunity] ([AutonomousCommunityId], [IneCode], [Name], [Country], [IsActive], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (4, N'04', N'Illes Balears', N'España', 1, '2026-11-12T15:45:41.0000000', NULL);
INSERT INTO dbo.[AutonomousCommunity] ([AutonomousCommunityId], [IneCode], [Name], [Country], [IsActive], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (5, N'05', N'Canarias', N'España', 1, '2026-11-12T15:45:41.0000000', NULL);
INSERT INTO dbo.[AutonomousCommunity] ([AutonomousCommunityId], [IneCode], [Name], [Country], [IsActive], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (6, N'06', N'Cantabria', N'España', 1, '2026-11-12T15:45:41.0000000', NULL);
INSERT INTO dbo.[AutonomousCommunity] ([AutonomousCommunityId], [IneCode], [Name], [Country], [IsActive], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (7, N'07', N'Castilla y León', N'España', 1, '2026-11-12T15:45:41.0000000', NULL);
INSERT INTO dbo.[AutonomousCommunity] ([AutonomousCommunityId], [IneCode], [Name], [Country], [IsActive], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (8, N'08', N'Castilla-La Mancha', N'España', 1, '2026-11-12T15:45:41.0000000', NULL);
INSERT INTO dbo.[AutonomousCommunity] ([AutonomousCommunityId], [IneCode], [Name], [Country], [IsActive], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (9, N'09', N'Cataluña', N'España', 1, '2026-11-12T15:45:41.0000000', NULL);
INSERT INTO dbo.[AutonomousCommunity] ([AutonomousCommunityId], [IneCode], [Name], [Country], [IsActive], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (10, N'10', N'Comunitat Valenciana', N'España', 1, '2026-11-12T15:45:41.0000000', NULL);
INSERT INTO dbo.[AutonomousCommunity] ([AutonomousCommunityId], [IneCode], [Name], [Country], [IsActive], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (11, N'11', N'Extremadura', N'España', 1, '2026-11-12T15:45:41.0000000', NULL);
INSERT INTO dbo.[AutonomousCommunity] ([AutonomousCommunityId], [IneCode], [Name], [Country], [IsActive], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (12, N'12', N'Galicia', N'España', 1, '2026-11-12T15:45:41.0000000', NULL);
INSERT INTO dbo.[AutonomousCommunity] ([AutonomousCommunityId], [IneCode], [Name], [Country], [IsActive], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (13, N'13', N'Comunidad de Madrid', N'España', 1, '2026-11-12T15:45:41.0000000', NULL);
INSERT INTO dbo.[AutonomousCommunity] ([AutonomousCommunityId], [IneCode], [Name], [Country], [IsActive], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (14, N'14', N'Región de Murcia', N'España', 1, '2026-11-12T15:45:41.0000000', NULL);
INSERT INTO dbo.[AutonomousCommunity] ([AutonomousCommunityId], [IneCode], [Name], [Country], [IsActive], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (15, N'15', N'Comunidad Foral de Navarra', N'España', 1, '2026-11-12T15:45:41.0000000', NULL);
INSERT INTO dbo.[AutonomousCommunity] ([AutonomousCommunityId], [IneCode], [Name], [Country], [IsActive], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (16, N'16', N'País Vasco', N'España', 1, '2026-11-12T15:45:41.0000000', NULL);
INSERT INTO dbo.[AutonomousCommunity] ([AutonomousCommunityId], [IneCode], [Name], [Country], [IsActive], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (17, N'17', N'La Rioja', N'España', 1, '2026-11-12T15:45:41.0000000', NULL);
INSERT INTO dbo.[AutonomousCommunity] ([AutonomousCommunityId], [IneCode], [Name], [Country], [IsActive], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (18, N'18', N'Ceuta', N'España', 1, '2026-11-12T15:45:41.0000000', NULL);
INSERT INTO dbo.[AutonomousCommunity] ([AutonomousCommunityId], [IneCode], [Name], [Country], [IsActive], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (19, N'19', N'Melilla', N'España', 1, '2026-11-12T15:45:41.0000000', NULL);
SET IDENTITY_INSERT dbo.[AutonomousCommunity] OFF;
GO

-- =========================================================================
-- Datos de la tabla: Province
-- =========================================================================
SET IDENTITY_INSERT dbo.[Province] ON;
INSERT INTO dbo.[Province] ([ProvinceId], [AutonomousCommunityId], [IneCode], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (1, 1, N'04', N'Almería', 1, '2026-11-12T15:45:41.0000000', NULL);
INSERT INTO dbo.[Province] ([ProvinceId], [AutonomousCommunityId], [IneCode], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (2, 1, N'11', N'Cádiz', 1, '2026-11-12T15:45:41.0000000', NULL);
INSERT INTO dbo.[Province] ([ProvinceId], [AutonomousCommunityId], [IneCode], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (3, 1, N'14', N'Córdoba', 1, '2026-11-12T15:45:41.0000000', NULL);
INSERT INTO dbo.[Province] ([ProvinceId], [AutonomousCommunityId], [IneCode], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (4, 1, N'18', N'Granada', 1, '2026-11-12T15:45:41.0000000', NULL);
INSERT INTO dbo.[Province] ([ProvinceId], [AutonomousCommunityId], [IneCode], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (5, 1, N'21', N'Huelva', 1, '2026-11-12T15:45:41.0000000', NULL);
INSERT INTO dbo.[Province] ([ProvinceId], [AutonomousCommunityId], [IneCode], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (6, 1, N'23', N'Jaén', 1, '2026-11-12T15:45:41.0000000', NULL);
INSERT INTO dbo.[Province] ([ProvinceId], [AutonomousCommunityId], [IneCode], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (7, 1, N'29', N'Málaga', 1, '2026-11-12T15:45:41.0000000', NULL);
INSERT INTO dbo.[Province] ([ProvinceId], [AutonomousCommunityId], [IneCode], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (8, 1, N'41', N'Sevilla', 1, '2026-11-12T15:45:41.0000000', NULL);
INSERT INTO dbo.[Province] ([ProvinceId], [AutonomousCommunityId], [IneCode], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (9, 2, N'22', N'Huesca', 1, '2026-11-12T15:45:41.0000000', NULL);
INSERT INTO dbo.[Province] ([ProvinceId], [AutonomousCommunityId], [IneCode], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (10, 2, N'44', N'Teruel', 1, '2026-11-12T15:45:41.0000000', NULL);
INSERT INTO dbo.[Province] ([ProvinceId], [AutonomousCommunityId], [IneCode], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (11, 2, N'50', N'Zaragoza', 1, '2026-11-12T15:45:41.0000000', NULL);
INSERT INTO dbo.[Province] ([ProvinceId], [AutonomousCommunityId], [IneCode], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (12, 3, N'33', N'Asturias', 1, '2026-11-12T15:45:41.0000000', NULL);
INSERT INTO dbo.[Province] ([ProvinceId], [AutonomousCommunityId], [IneCode], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (13, 4, N'07', N'Illes Balears', 1, '2026-11-12T15:45:41.0000000', NULL);
INSERT INTO dbo.[Province] ([ProvinceId], [AutonomousCommunityId], [IneCode], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (14, 5, N'35', N'Las Palmas', 1, '2026-11-12T15:45:41.0000000', NULL);
INSERT INTO dbo.[Province] ([ProvinceId], [AutonomousCommunityId], [IneCode], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (15, 5, N'38', N'Santa Cruz de Tenerife', 1, '2026-11-12T15:45:41.0000000', NULL);
INSERT INTO dbo.[Province] ([ProvinceId], [AutonomousCommunityId], [IneCode], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (16, 6, N'39', N'Cantabria', 1, '2026-11-12T15:45:41.0000000', NULL);
INSERT INTO dbo.[Province] ([ProvinceId], [AutonomousCommunityId], [IneCode], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (17, 7, N'05', N'Ávila', 1, '2026-11-12T15:45:41.0000000', NULL);
INSERT INTO dbo.[Province] ([ProvinceId], [AutonomousCommunityId], [IneCode], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (18, 7, N'09', N'Burgos', 1, '2026-11-12T15:45:41.0000000', NULL);
INSERT INTO dbo.[Province] ([ProvinceId], [AutonomousCommunityId], [IneCode], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (19, 7, N'24', N'León', 1, '2026-11-12T15:45:41.0000000', NULL);
INSERT INTO dbo.[Province] ([ProvinceId], [AutonomousCommunityId], [IneCode], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (20, 7, N'34', N'Palencia', 1, '2026-11-12T15:45:41.0000000', NULL);
INSERT INTO dbo.[Province] ([ProvinceId], [AutonomousCommunityId], [IneCode], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (21, 7, N'37', N'Salamanca', 1, '2026-11-12T15:45:41.0000000', NULL);
INSERT INTO dbo.[Province] ([ProvinceId], [AutonomousCommunityId], [IneCode], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (22, 7, N'40', N'Segovia', 1, '2026-11-12T15:45:41.0000000', NULL);
INSERT INTO dbo.[Province] ([ProvinceId], [AutonomousCommunityId], [IneCode], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (23, 7, N'42', N'Soria', 1, '2026-11-12T15:45:41.0000000', NULL);
INSERT INTO dbo.[Province] ([ProvinceId], [AutonomousCommunityId], [IneCode], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (24, 7, N'47', N'Valladolid', 1, '2026-11-12T15:45:41.0000000', NULL);
INSERT INTO dbo.[Province] ([ProvinceId], [AutonomousCommunityId], [IneCode], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (25, 7, N'49', N'Zamora', 1, '2026-11-12T15:45:41.0000000', NULL);
INSERT INTO dbo.[Province] ([ProvinceId], [AutonomousCommunityId], [IneCode], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (26, 8, N'02', N'Albacete', 1, '2026-11-12T15:45:41.0000000', NULL);
INSERT INTO dbo.[Province] ([ProvinceId], [AutonomousCommunityId], [IneCode], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (27, 8, N'13', N'Ciudad Real', 1, '2026-11-12T15:45:41.0000000', NULL);
INSERT INTO dbo.[Province] ([ProvinceId], [AutonomousCommunityId], [IneCode], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (28, 8, N'16', N'Cuenca', 1, '2026-11-12T15:45:41.0000000', NULL);
INSERT INTO dbo.[Province] ([ProvinceId], [AutonomousCommunityId], [IneCode], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (29, 8, N'19', N'Guadalajara', 1, '2026-11-12T15:45:41.0000000', NULL);
INSERT INTO dbo.[Province] ([ProvinceId], [AutonomousCommunityId], [IneCode], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (30, 8, N'45', N'Toledo', 1, '2026-11-12T15:45:41.0000000', NULL);
INSERT INTO dbo.[Province] ([ProvinceId], [AutonomousCommunityId], [IneCode], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (31, 9, N'08', N'Barcelona', 1, '2026-11-12T15:45:41.0000000', NULL);
INSERT INTO dbo.[Province] ([ProvinceId], [AutonomousCommunityId], [IneCode], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (32, 9, N'17', N'Girona', 1, '2026-11-12T15:45:41.0000000', NULL);
INSERT INTO dbo.[Province] ([ProvinceId], [AutonomousCommunityId], [IneCode], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (33, 9, N'25', N'Lleida', 1, '2026-11-12T15:45:41.0000000', NULL);
INSERT INTO dbo.[Province] ([ProvinceId], [AutonomousCommunityId], [IneCode], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (34, 9, N'43', N'Tarragona', 1, '2026-11-12T15:45:41.0000000', NULL);
INSERT INTO dbo.[Province] ([ProvinceId], [AutonomousCommunityId], [IneCode], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (35, 10, N'03', N'Alicante/Alacant', 1, '2026-11-12T15:45:41.0000000', NULL);
INSERT INTO dbo.[Province] ([ProvinceId], [AutonomousCommunityId], [IneCode], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (36, 10, N'12', N'Castellón/Castelló', 1, '2026-11-12T15:45:41.0000000', NULL);
INSERT INTO dbo.[Province] ([ProvinceId], [AutonomousCommunityId], [IneCode], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (37, 10, N'46', N'Valencia/València', 1, '2026-11-12T15:45:41.0000000', NULL);
INSERT INTO dbo.[Province] ([ProvinceId], [AutonomousCommunityId], [IneCode], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (38, 11, N'06', N'Badajoz', 1, '2026-11-12T15:45:41.0000000', NULL);
INSERT INTO dbo.[Province] ([ProvinceId], [AutonomousCommunityId], [IneCode], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (39, 11, N'10', N'Cáceres', 1, '2026-11-12T15:45:41.0000000', NULL);
INSERT INTO dbo.[Province] ([ProvinceId], [AutonomousCommunityId], [IneCode], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (40, 12, N'15', N'A Coruña', 1, '2026-11-12T15:45:41.0000000', NULL);
INSERT INTO dbo.[Province] ([ProvinceId], [AutonomousCommunityId], [IneCode], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (41, 12, N'27', N'Lugo', 1, '2026-11-12T15:45:41.0000000', NULL);
INSERT INTO dbo.[Province] ([ProvinceId], [AutonomousCommunityId], [IneCode], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (42, 12, N'32', N'Ourense', 1, '2026-11-12T15:45:41.0000000', NULL);
INSERT INTO dbo.[Province] ([ProvinceId], [AutonomousCommunityId], [IneCode], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (43, 12, N'36', N'Pontevedra', 1, '2026-11-12T15:45:41.0000000', NULL);
INSERT INTO dbo.[Province] ([ProvinceId], [AutonomousCommunityId], [IneCode], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (44, 13, N'28', N'Madrid', 1, '2026-11-12T15:45:41.0000000', NULL);
INSERT INTO dbo.[Province] ([ProvinceId], [AutonomousCommunityId], [IneCode], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (45, 14, N'30', N'Murcia', 1, '2026-11-12T15:45:41.0000000', NULL);
INSERT INTO dbo.[Province] ([ProvinceId], [AutonomousCommunityId], [IneCode], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (46, 15, N'31', N'Navarra', 1, '2026-11-12T15:45:41.0000000', NULL);
INSERT INTO dbo.[Province] ([ProvinceId], [AutonomousCommunityId], [IneCode], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (47, 16, N'01', N'Araba/Álava', 1, '2026-11-12T15:45:41.0000000', NULL);
INSERT INTO dbo.[Province] ([ProvinceId], [AutonomousCommunityId], [IneCode], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (48, 16, N'48', N'Bizkaia', 1, '2026-11-12T15:45:41.0000000', NULL);
INSERT INTO dbo.[Province] ([ProvinceId], [AutonomousCommunityId], [IneCode], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (49, 16, N'20', N'Gipuzkoa', 1, '2026-11-12T15:45:41.0000000', NULL);
INSERT INTO dbo.[Province] ([ProvinceId], [AutonomousCommunityId], [IneCode], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (50, 17, N'26', N'La Rioja', 1, '2026-11-12T15:45:41.0000000', NULL);
INSERT INTO dbo.[Province] ([ProvinceId], [AutonomousCommunityId], [IneCode], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (51, 18, N'51', N'Ceuta', 1, '2026-11-12T15:45:41.0000000', NULL);
INSERT INTO dbo.[Province] ([ProvinceId], [AutonomousCommunityId], [IneCode], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (52, 19, N'52', N'Melilla', 1, '2026-11-12T15:45:41.0000000', NULL);
SET IDENTITY_INSERT dbo.[Province] OFF;
GO

-- =========================================================================
-- Datos de la tabla: Comarca
-- =========================================================================
SET IDENTITY_INSERT dbo.[Comarca] ON;
INSERT INTO dbo.[Comarca] ([ComarcaId], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc], [ProvinceId]) VALUES (1, N'Valle del Almanzora', 1, '2026-11-12T12:52:04.0000000', '2026-11-12T15:45:41.0000000', 1);
INSERT INTO dbo.[Comarca] ([ComarcaId], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc], [ProvinceId]) VALUES (2, N'Los Vélez', 1, '2026-11-12T12:52:04.0000000', '2026-11-12T15:45:41.0000000', 1);
INSERT INTO dbo.[Comarca] ([ComarcaId], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc], [ProvinceId]) VALUES (3, N'Levante Almeriense', 1, '2026-11-12T12:52:04.0000000', '2026-11-12T15:45:41.0000000', 1);
INSERT INTO dbo.[Comarca] ([ComarcaId], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc], [ProvinceId]) VALUES (4, N'Los Filabres - Tabernas', 1, '2026-11-12T12:52:04.0000000', '2026-11-12T15:45:41.0000000', 1);
INSERT INTO dbo.[Comarca] ([ComarcaId], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc], [ProvinceId]) VALUES (5, N'Alpujarra Almeriense', 1, '2026-11-12T12:52:04.0000000', '2026-11-12T15:45:41.0000000', 1);
INSERT INTO dbo.[Comarca] ([ComarcaId], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc], [ProvinceId]) VALUES (6, N'Comarca Metropolitana de Almería', 1, '2026-11-12T12:52:04.0000000', '2026-11-12T15:45:41.0000000', 1);
INSERT INTO dbo.[Comarca] ([ComarcaId], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc], [ProvinceId]) VALUES (7, N'Poniente Almeriense', 1, '2026-11-12T12:52:04.0000000', '2026-11-12T15:45:41.0000000', 1);
INSERT INTO dbo.[Comarca] ([ComarcaId], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc], [ProvinceId]) VALUES (8, N'Bahía de Cádiz', 1, '2026-11-12T12:52:04.0000000', '2026-11-12T15:45:41.0000000', 2);
INSERT INTO dbo.[Comarca] ([ComarcaId], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc], [ProvinceId]) VALUES (9, N'Campiña de Jerez', 1, '2026-11-12T12:52:04.0000000', '2026-11-12T15:45:41.0000000', 2);
INSERT INTO dbo.[Comarca] ([ComarcaId], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc], [ProvinceId]) VALUES (10, N'Costa Noroeste de Cádiz', 1, '2026-11-12T12:52:04.0000000', '2026-11-12T15:45:41.0000000', 2);
INSERT INTO dbo.[Comarca] ([ComarcaId], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc], [ProvinceId]) VALUES (11, N'Sierra de Cádiz', 1, '2026-11-12T12:52:04.0000000', '2026-11-12T15:45:41.0000000', 2);
INSERT INTO dbo.[Comarca] ([ComarcaId], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc], [ProvinceId]) VALUES (12, N'La Janda', 1, '2026-11-12T12:52:04.0000000', '2026-11-12T15:45:41.0000000', 2);
INSERT INTO dbo.[Comarca] ([ComarcaId], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc], [ProvinceId]) VALUES (13, N'Campo de Gibraltar', 1, '2026-11-12T12:52:04.0000000', '2026-11-12T15:45:41.0000000', 2);
INSERT INTO dbo.[Comarca] ([ComarcaId], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc], [ProvinceId]) VALUES (14, N'Alto Guadalquivir', 1, '2026-11-12T12:52:04.0000000', '2026-11-12T15:45:41.0000000', 3);
INSERT INTO dbo.[Comarca] ([ComarcaId], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc], [ProvinceId]) VALUES (15, N'Campiña Este - Guadajoz', 1, '2026-11-12T12:52:04.0000000', '2026-11-12T15:45:41.0000000', 3);
INSERT INTO dbo.[Comarca] ([ComarcaId], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc], [ProvinceId]) VALUES (16, N'Campiña Sur Cordobesa', 1, '2026-11-12T12:52:04.0000000', '2026-11-12T15:45:41.0000000', 3);
INSERT INTO dbo.[Comarca] ([ComarcaId], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc], [ProvinceId]) VALUES (17, N'Subbética', 1, '2026-11-12T12:52:04.0000000', '2026-11-12T15:45:41.0000000', 3);
INSERT INTO dbo.[Comarca] ([ComarcaId], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc], [ProvinceId]) VALUES (18, N'Valle Medio del Guadalquivir', 1, '2026-11-12T12:52:04.0000000', '2026-11-12T15:45:41.0000000', 3);
INSERT INTO dbo.[Comarca] ([ComarcaId], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc], [ProvinceId]) VALUES (19, N'Córdoba', 1, '2026-11-12T12:52:04.0000000', '2026-11-12T15:45:41.0000000', 3);
INSERT INTO dbo.[Comarca] ([ComarcaId], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc], [ProvinceId]) VALUES (20, N'Valle del Guadiato', 1, '2026-11-12T12:52:04.0000000', '2026-11-12T15:45:41.0000000', 3);
INSERT INTO dbo.[Comarca] ([ComarcaId], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc], [ProvinceId]) VALUES (21, N'Los Pedroches', 1, '2026-11-12T12:52:04.0000000', '2026-11-12T15:45:41.0000000', 3);
INSERT INTO dbo.[Comarca] ([ComarcaId], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc], [ProvinceId]) VALUES (22, N'Los Montes', 1, '2026-11-12T12:52:04.0000000', '2026-11-12T15:45:41.0000000', 4);
INSERT INTO dbo.[Comarca] ([ComarcaId], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc], [ProvinceId]) VALUES (23, N'Vega de Granada', 1, '2026-11-12T12:52:04.0000000', '2026-11-12T15:45:41.0000000', 4);
INSERT INTO dbo.[Comarca] ([ComarcaId], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc], [ProvinceId]) VALUES (24, N'La Alpujarra Granadina', 1, '2026-11-12T12:52:04.0000000', '2026-11-12T15:45:41.0000000', 4);
INSERT INTO dbo.[Comarca] ([ComarcaId], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc], [ProvinceId]) VALUES (25, N'Valle de Lecrín', 1, '2026-11-12T12:52:04.0000000', '2026-11-12T15:45:41.0000000', 4);
INSERT INTO dbo.[Comarca] ([ComarcaId], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc], [ProvinceId]) VALUES (26, N'Costa Tropical', 1, '2026-11-12T12:52:04.0000000', '2026-11-12T15:45:41.0000000', 4);
INSERT INTO dbo.[Comarca] ([ComarcaId], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc], [ProvinceId]) VALUES (27, N'Alhama', 1, '2026-11-12T12:52:04.0000000', '2026-11-12T15:45:41.0000000', 4);
INSERT INTO dbo.[Comarca] ([ComarcaId], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc], [ProvinceId]) VALUES (28, N'Loja', 1, '2026-11-12T12:52:04.0000000', '2026-11-12T15:45:41.0000000', 4);
INSERT INTO dbo.[Comarca] ([ComarcaId], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc], [ProvinceId]) VALUES (29, N'Comarca de Guadix', 1, '2026-11-12T12:52:04.0000000', '2026-11-12T15:45:41.0000000', 4);
INSERT INTO dbo.[Comarca] ([ComarcaId], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc], [ProvinceId]) VALUES (30, N'Comarca de Baza', 1, '2026-11-12T12:52:04.0000000', '2026-11-12T15:45:41.0000000', 4);
INSERT INTO dbo.[Comarca] ([ComarcaId], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc], [ProvinceId]) VALUES (31, N'Comarca de Huéscar', 1, '2026-11-12T12:52:04.0000000', '2026-11-12T15:45:41.0000000', 4);
INSERT INTO dbo.[Comarca] ([ComarcaId], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc], [ProvinceId]) VALUES (32, N'Sierra de Huelva', 1, '2026-11-12T12:52:04.0000000', '2026-11-12T15:45:41.0000000', 5);
INSERT INTO dbo.[Comarca] ([ComarcaId], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc], [ProvinceId]) VALUES (33, N'El Andévalo', 1, '2026-11-12T12:52:04.0000000', '2026-11-12T15:45:41.0000000', 5);
INSERT INTO dbo.[Comarca] ([ComarcaId], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc], [ProvinceId]) VALUES (34, N'Cuenca Minera', 1, '2026-11-12T12:52:04.0000000', '2026-11-12T15:45:41.0000000', 5);
INSERT INTO dbo.[Comarca] ([ComarcaId], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc], [ProvinceId]) VALUES (35, N'El Condado', 1, '2026-11-12T12:52:04.0000000', '2026-11-12T15:45:41.0000000', 5);
INSERT INTO dbo.[Comarca] ([ComarcaId], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc], [ProvinceId]) VALUES (36, N'Comarca Metropolitana de Huelva', 1, '2026-11-12T12:52:04.0000000', '2026-11-12T15:45:41.0000000', 5);
INSERT INTO dbo.[Comarca] ([ComarcaId], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc], [ProvinceId]) VALUES (37, N'Costa Occidental de Huelva', 1, '2026-11-12T12:52:04.0000000', '2026-11-12T15:45:41.0000000', 5);
INSERT INTO dbo.[Comarca] ([ComarcaId], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc], [ProvinceId]) VALUES (38, N'Área Metropolitana de Jaén', 1, '2026-11-12T12:52:04.0000000', '2026-11-12T15:45:41.0000000', 6);
INSERT INTO dbo.[Comarca] ([ComarcaId], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc], [ProvinceId]) VALUES (39, N'Sierra Mágina', 1, '2026-11-12T12:52:04.0000000', '2026-11-12T15:45:41.0000000', 6);
INSERT INTO dbo.[Comarca] ([ComarcaId], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc], [ProvinceId]) VALUES (40, N'La Loma', 1, '2026-11-12T12:52:04.0000000', '2026-11-12T15:45:41.0000000', 6);
INSERT INTO dbo.[Comarca] ([ComarcaId], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc], [ProvinceId]) VALUES (41, N'Las Villas', 1, '2026-11-12T12:52:04.0000000', '2026-11-12T15:45:41.0000000', 6);
INSERT INTO dbo.[Comarca] ([ComarcaId], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc], [ProvinceId]) VALUES (42, N'Sierra de Cazorla', 1, '2026-11-12T12:52:04.0000000', '2026-11-12T15:45:41.0000000', 6);
INSERT INTO dbo.[Comarca] ([ComarcaId], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc], [ProvinceId]) VALUES (43, N'Sierra de Segura', 1, '2026-11-12T12:52:04.0000000', '2026-11-12T15:45:41.0000000', 6);
INSERT INTO dbo.[Comarca] ([ComarcaId], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc], [ProvinceId]) VALUES (44, N'El Condado (Jaén)', 1, '2026-11-12T12:52:04.0000000', '2026-11-12T15:45:41.0000000', 6);
INSERT INTO dbo.[Comarca] ([ComarcaId], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc], [ProvinceId]) VALUES (45, N'Sierra Morena', 1, '2026-11-12T12:52:04.0000000', '2026-11-12T15:45:41.0000000', 6);
INSERT INTO dbo.[Comarca] ([ComarcaId], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc], [ProvinceId]) VALUES (46, N'Campiña de Jaén', 1, '2026-11-12T12:52:04.0000000', '2026-11-12T15:45:41.0000000', 6);
INSERT INTO dbo.[Comarca] ([ComarcaId], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc], [ProvinceId]) VALUES (47, N'Sierra Sur de Jaén', 1, '2026-11-12T12:52:04.0000000', '2026-11-12T15:45:41.0000000', 6);
INSERT INTO dbo.[Comarca] ([ComarcaId], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc], [ProvinceId]) VALUES (48, N'La Axarquía - Costa del Sol', 1, '2026-11-12T12:52:04.0000000', '2026-11-12T15:45:41.0000000', 7);
INSERT INTO dbo.[Comarca] ([ComarcaId], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc], [ProvinceId]) VALUES (49, N'Comarca de Antequera', 1, '2026-11-12T12:52:04.0000000', '2026-11-12T15:45:41.0000000', 7);
INSERT INTO dbo.[Comarca] ([ComarcaId], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc], [ProvinceId]) VALUES (50, N'Costa del Sol Occidental', 1, '2026-11-12T12:52:04.0000000', '2026-11-12T15:45:41.0000000', 7);
INSERT INTO dbo.[Comarca] ([ComarcaId], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc], [ProvinceId]) VALUES (51, N'Guadalteba', 1, '2026-11-12T12:52:04.0000000', '2026-11-12T15:45:41.0000000', 7);
INSERT INTO dbo.[Comarca] ([ComarcaId], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc], [ProvinceId]) VALUES (52, N'Málaga - Costa del Sol', 1, '2026-11-12T12:52:04.0000000', '2026-11-12T15:45:41.0000000', 7);
INSERT INTO dbo.[Comarca] ([ComarcaId], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc], [ProvinceId]) VALUES (53, N'Nororma', 1, '2026-11-12T12:52:04.0000000', '2026-11-12T15:45:41.0000000', 7);
INSERT INTO dbo.[Comarca] ([ComarcaId], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc], [ProvinceId]) VALUES (54, N'Serranía de Ronda', 1, '2026-11-12T12:52:04.0000000', '2026-11-12T15:45:41.0000000', 7);
INSERT INTO dbo.[Comarca] ([ComarcaId], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc], [ProvinceId]) VALUES (55, N'Sierra de las Nieves', 1, '2026-11-12T12:52:04.0000000', '2026-11-12T15:45:41.0000000', 7);
INSERT INTO dbo.[Comarca] ([ComarcaId], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc], [ProvinceId]) VALUES (56, N'Valle del Guadalhorce', 1, '2026-11-12T12:52:04.0000000', '2026-11-12T15:45:41.0000000', 7);
INSERT INTO dbo.[Comarca] ([ComarcaId], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc], [ProvinceId]) VALUES (57, N'El Aljarafe', 1, '2026-11-12T12:52:04.0000000', '2026-11-12T15:45:41.0000000', 8);
INSERT INTO dbo.[Comarca] ([ComarcaId], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc], [ProvinceId]) VALUES (58, N'Bajo Guadalquivir', 1, '2026-11-12T12:52:04.0000000', '2026-11-12T15:45:41.0000000', 8);
INSERT INTO dbo.[Comarca] ([ComarcaId], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc], [ProvinceId]) VALUES (59, N'Campiña de Morón y Marchena', 1, '2026-11-12T12:52:04.0000000', '2026-11-12T15:45:41.0000000', 8);
INSERT INTO dbo.[Comarca] ([ComarcaId], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc], [ProvinceId]) VALUES (60, N'Campiña de Carmona', 1, '2026-11-12T12:52:04.0000000', '2026-11-12T15:45:41.0000000', 8);
INSERT INTO dbo.[Comarca] ([ComarcaId], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc], [ProvinceId]) VALUES (61, N'Comarca de Écija', 1, '2026-11-12T12:52:04.0000000', '2026-11-12T15:45:41.0000000', 8);
INSERT INTO dbo.[Comarca] ([ComarcaId], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc], [ProvinceId]) VALUES (62, N'Sierra Norte de Sevilla', 1, '2026-11-12T12:52:04.0000000', '2026-11-12T15:45:41.0000000', 8);
INSERT INTO dbo.[Comarca] ([ComarcaId], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc], [ProvinceId]) VALUES (63, N'Sierra Sur de Sevilla', 1, '2026-11-12T12:52:04.0000000', '2026-11-12T15:45:41.0000000', 8);
INSERT INTO dbo.[Comarca] ([ComarcaId], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc], [ProvinceId]) VALUES (64, N'Comarca Metropolitana de Sevilla', 1, '2026-11-12T12:52:04.0000000', '2026-11-12T15:45:41.0000000', 8);
INSERT INTO dbo.[Comarca] ([ComarcaId], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc], [ProvinceId]) VALUES (65, N'Vega del Guadalquivir', 1, '2026-11-12T12:52:04.0000000', '2026-11-12T15:45:41.0000000', 8);
SET IDENTITY_INSERT dbo.[Comarca] OFF;
GO

-- =========================================================================
-- Datos de la tabla: Municipality
-- =========================================================================
SET IDENTITY_INSERT dbo.[Municipality] ON;
INSERT INTO dbo.[Municipality] ([MunicipalityId], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc], [ComarcaId], [ProvinceId]) VALUES (1, N'Alcaucín', 1, '2026-11-11T11:33:06.0000000', '2026-11-12T15:45:41.0000000', 48, 7);
INSERT INTO dbo.[Municipality] ([MunicipalityId], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc], [ComarcaId], [ProvinceId]) VALUES (2, N'Alfarnate', 1, '2026-11-11T11:33:06.0000000', '2026-11-12T15:45:41.0000000', 48, 7);
INSERT INTO dbo.[Municipality] ([MunicipalityId], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc], [ComarcaId], [ProvinceId]) VALUES (3, N'Alfarnatejo', 1, '2026-11-11T11:33:06.0000000', '2026-11-12T15:45:41.0000000', 48, 7);
INSERT INTO dbo.[Municipality] ([MunicipalityId], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc], [ComarcaId], [ProvinceId]) VALUES (4, N'Algarrobo', 1, '2026-11-11T11:33:06.0000000', '2026-11-12T15:45:41.0000000', 48, 7);
INSERT INTO dbo.[Municipality] ([MunicipalityId], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc], [ComarcaId], [ProvinceId]) VALUES (5, N'Almáchar', 1, '2026-11-11T11:33:06.0000000', '2026-11-12T15:45:41.0000000', 48, 7);
INSERT INTO dbo.[Municipality] ([MunicipalityId], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc], [ComarcaId], [ProvinceId]) VALUES (6, N'Árchez', 1, '2026-11-11T11:33:06.0000000', '2026-11-12T15:45:41.0000000', 48, 7);
INSERT INTO dbo.[Municipality] ([MunicipalityId], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc], [ComarcaId], [ProvinceId]) VALUES (7, N'Arenas', 1, '2026-11-11T11:33:06.0000000', '2026-11-12T15:45:41.0000000', 48, 7);
INSERT INTO dbo.[Municipality] ([MunicipalityId], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc], [ComarcaId], [ProvinceId]) VALUES (8, N'Benamargosa', 1, '2026-11-11T11:33:06.0000000', '2026-11-12T15:45:41.0000000', 48, 7);
INSERT INTO dbo.[Municipality] ([MunicipalityId], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc], [ComarcaId], [ProvinceId]) VALUES (9, N'Benamocarra', 1, '2026-11-11T11:33:06.0000000', '2026-11-12T15:45:41.0000000', 48, 7);
INSERT INTO dbo.[Municipality] ([MunicipalityId], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc], [ComarcaId], [ProvinceId]) VALUES (10, N'El Borge', 1, '2026-11-11T11:33:06.0000000', '2026-11-12T15:45:41.0000000', 48, 7);
INSERT INTO dbo.[Municipality] ([MunicipalityId], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc], [ComarcaId], [ProvinceId]) VALUES (11, N'Canillas de Aceituno', 1, '2026-11-11T11:33:06.0000000', '2026-11-12T15:45:41.0000000', 48, 7);
INSERT INTO dbo.[Municipality] ([MunicipalityId], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc], [ComarcaId], [ProvinceId]) VALUES (12, N'Canillas de Albaida', 1, '2026-11-11T11:33:06.0000000', '2026-11-12T15:45:41.0000000', 48, 7);
INSERT INTO dbo.[Municipality] ([MunicipalityId], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc], [ComarcaId], [ProvinceId]) VALUES (13, N'Comares', 1, '2026-11-11T11:33:06.0000000', '2026-11-12T15:45:41.0000000', 48, 7);
INSERT INTO dbo.[Municipality] ([MunicipalityId], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc], [ComarcaId], [ProvinceId]) VALUES (14, N'Cómpeta', 1, '2026-11-11T11:33:06.0000000', '2026-11-12T15:45:41.0000000', 48, 7);
INSERT INTO dbo.[Municipality] ([MunicipalityId], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc], [ComarcaId], [ProvinceId]) VALUES (15, N'Cútar', 1, '2026-11-11T11:33:06.0000000', '2026-11-12T15:45:41.0000000', 48, 7);
INSERT INTO dbo.[Municipality] ([MunicipalityId], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc], [ComarcaId], [ProvinceId]) VALUES (16, N'Frigiliana', 1, '2026-11-11T11:33:06.0000000', '2026-11-12T15:45:41.0000000', 48, 7);
INSERT INTO dbo.[Municipality] ([MunicipalityId], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc], [ComarcaId], [ProvinceId]) VALUES (17, N'Iznate', 1, '2026-11-11T11:33:06.0000000', '2026-11-12T15:45:41.0000000', 48, 7);
INSERT INTO dbo.[Municipality] ([MunicipalityId], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc], [ComarcaId], [ProvinceId]) VALUES (18, N'Macharaviaya', 1, '2026-11-11T11:33:06.0000000', '2026-11-12T15:45:41.0000000', 48, 7);
INSERT INTO dbo.[Municipality] ([MunicipalityId], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc], [ComarcaId], [ProvinceId]) VALUES (19, N'Moclinejo', 1, '2026-11-11T11:33:06.0000000', '2026-11-12T15:45:41.0000000', 48, 7);
INSERT INTO dbo.[Municipality] ([MunicipalityId], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc], [ComarcaId], [ProvinceId]) VALUES (20, N'Nerja', 1, '2026-11-11T11:33:06.0000000', '2026-11-12T15:45:41.0000000', 48, 7);
INSERT INTO dbo.[Municipality] ([MunicipalityId], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc], [ComarcaId], [ProvinceId]) VALUES (21, N'Periana', 1, '2026-11-11T11:33:06.0000000', '2026-11-12T15:45:41.0000000', 48, 7);
INSERT INTO dbo.[Municipality] ([MunicipalityId], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc], [ComarcaId], [ProvinceId]) VALUES (22, N'Rincón de la Victoria', 1, '2026-11-11T11:33:06.0000000', '2026-11-12T15:45:41.0000000', 48, 7);
INSERT INTO dbo.[Municipality] ([MunicipalityId], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc], [ComarcaId], [ProvinceId]) VALUES (23, N'Riogordo', 1, '2026-11-11T11:33:06.0000000', '2026-11-12T15:45:41.0000000', 48, 7);
INSERT INTO dbo.[Municipality] ([MunicipalityId], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc], [ComarcaId], [ProvinceId]) VALUES (24, N'Sedella', 1, '2026-11-11T11:33:06.0000000', '2026-11-12T15:45:41.0000000', 48, 7);
INSERT INTO dbo.[Municipality] ([MunicipalityId], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc], [ComarcaId], [ProvinceId]) VALUES (25, N'Sayalonga', 1, '2026-11-11T11:33:06.0000000', '2026-11-12T15:45:41.0000000', 48, 7);
INSERT INTO dbo.[Municipality] ([MunicipalityId], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc], [ComarcaId], [ProvinceId]) VALUES (26, N'Totalán', 1, '2026-11-11T11:33:06.0000000', '2026-11-12T15:45:41.0000000', 48, 7);
INSERT INTO dbo.[Municipality] ([MunicipalityId], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc], [ComarcaId], [ProvinceId]) VALUES (27, N'Torrox', 1, '2026-11-11T11:33:06.0000000', '2026-11-12T15:45:41.0000000', 48, 7);
INSERT INTO dbo.[Municipality] ([MunicipalityId], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc], [ComarcaId], [ProvinceId]) VALUES (28, N'Vélez-Málaga', 1, '2026-11-11T11:33:06.0000000', '2026-11-12T15:45:41.0000000', 48, 7);
INSERT INTO dbo.[Municipality] ([MunicipalityId], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc], [ComarcaId], [ProvinceId]) VALUES (29, N'La Viñuela', 1, '2026-11-11T11:33:06.0000000', '2026-11-12T15:45:41.0000000', 48, 7);
INSERT INTO dbo.[Municipality] ([MunicipalityId], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc], [ComarcaId], [ProvinceId]) VALUES (30, N'Salares', 1, '2026-11-11T11:33:06.0000000', '2026-11-12T15:45:41.0000000', 48, 7);
INSERT INTO dbo.[Municipality] ([MunicipalityId], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc], [ComarcaId], [ProvinceId]) VALUES (31, N'Valle de Abdalajís', 1, '2026-11-11T11:33:06.0000000', '2026-11-12T15:45:41.0000000', 56, 7);
INSERT INTO dbo.[Municipality] ([MunicipalityId], [Name], [IsActive], [CreatedAtUtc], [UpdatedAtUtc], [ComarcaId], [ProvinceId]) VALUES (32, N'Colmenar', 1, '2026-11-12T13:38:28.0000000', '2026-11-12T15:45:41.0000000', 48, 7);
SET IDENTITY_INSERT dbo.[Municipality] OFF;
GO

-- =========================================================================
-- Datos de la tabla: Locality
-- =========================================================================
SET IDENTITY_INSERT dbo.[Locality] ON;
INSERT INTO dbo.[Locality] ([LocalityId], [MunicipalityId], [Name], [PostalCode], [IsActive], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (1, 28, N'Vélez-Málaga Centro', N'29700', 1, '2026-11-11T11:40:32.0000000', NULL);
INSERT INTO dbo.[Locality] ([LocalityId], [MunicipalityId], [Name], [PostalCode], [IsActive], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (2, 28, N'Torre del Mar', N'29740', 1, '2026-11-11T11:40:32.0000000', NULL);
INSERT INTO dbo.[Locality] ([LocalityId], [MunicipalityId], [Name], [PostalCode], [IsActive], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (3, 28, N'Caleta de Vélez', N'29751', 1, '2026-11-11T11:40:32.0000000', NULL);
INSERT INTO dbo.[Locality] ([LocalityId], [MunicipalityId], [Name], [PostalCode], [IsActive], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (4, 28, N'Almayate', N'29792', 1, '2026-11-11T11:40:32.0000000', NULL);
INSERT INTO dbo.[Locality] ([LocalityId], [MunicipalityId], [Name], [PostalCode], [IsActive], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (5, 28, N'Benajarafe', N'29790', 1, '2026-11-11T11:40:32.0000000', NULL);
INSERT INTO dbo.[Locality] ([LocalityId], [MunicipalityId], [Name], [PostalCode], [IsActive], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (6, 28, N'Chilches', N'29790', 1, '2026-11-11T11:40:32.0000000', NULL);
INSERT INTO dbo.[Locality] ([LocalityId], [MunicipalityId], [Name], [PostalCode], [IsActive], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (7, 20, N'Nerja Centro', N'29780', 1, '2026-11-11T11:40:32.0000000', NULL);
INSERT INTO dbo.[Locality] ([LocalityId], [MunicipalityId], [Name], [PostalCode], [IsActive], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (8, 20, N'Maro', N'29787', 1, '2026-11-11T11:40:32.0000000', NULL);
INSERT INTO dbo.[Locality] ([LocalityId], [MunicipalityId], [Name], [PostalCode], [IsActive], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (9, 27, N'Torrox Pueblo', N'29770', 1, '2026-11-11T11:40:32.0000000', NULL);
INSERT INTO dbo.[Locality] ([LocalityId], [MunicipalityId], [Name], [PostalCode], [IsActive], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (10, 27, N'Torrox Costa', N'29793', 1, '2026-11-11T11:40:32.0000000', NULL);
INSERT INTO dbo.[Locality] ([LocalityId], [MunicipalityId], [Name], [PostalCode], [IsActive], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (11, 27, N'El Morche', N'29793', 1, '2026-11-11T11:40:32.0000000', NULL);
INSERT INTO dbo.[Locality] ([LocalityId], [MunicipalityId], [Name], [PostalCode], [IsActive], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (12, 22, N'Rincón de la Victoria Centro', N'29730', 1, '2026-11-11T11:40:32.0000000', NULL);
INSERT INTO dbo.[Locality] ([LocalityId], [MunicipalityId], [Name], [PostalCode], [IsActive], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (13, 22, N'Cala del Moral', N'29720', 1, '2026-11-11T11:40:32.0000000', NULL);
INSERT INTO dbo.[Locality] ([LocalityId], [MunicipalityId], [Name], [PostalCode], [IsActive], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (14, 22, N'Torre de Benagalbón', N'29738', 1, '2026-11-11T11:40:32.0000000', NULL);
INSERT INTO dbo.[Locality] ([LocalityId], [MunicipalityId], [Name], [PostalCode], [IsActive], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (15, 16, N'Frigiliana Pueblo', N'29788', 1, '2026-11-11T11:40:32.0000000', NULL);
INSERT INTO dbo.[Locality] ([LocalityId], [MunicipalityId], [Name], [PostalCode], [IsActive], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (16, 4, N'Algarrobo Pueblo', N'29750', 1, '2026-11-11T11:40:32.0000000', NULL);
INSERT INTO dbo.[Locality] ([LocalityId], [MunicipalityId], [Name], [PostalCode], [IsActive], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (17, 4, N'Algarrobo Costa', N'29750', 1, '2026-11-11T11:40:32.0000000', NULL);
INSERT INTO dbo.[Locality] ([LocalityId], [MunicipalityId], [Name], [PostalCode], [IsActive], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (18, 29, N'Puente de Don Manuel', N'29713', 1, '2026-11-11T11:40:32.0000000', NULL);
INSERT INTO dbo.[Locality] ([LocalityId], [MunicipalityId], [Name], [PostalCode], [IsActive], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (19, 29, N'La Viñuela Pueblo', N'29712', 1, '2026-11-11T11:40:32.0000000', NULL);
INSERT INTO dbo.[Locality] ([LocalityId], [MunicipalityId], [Name], [PostalCode], [IsActive], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (20, 14, N'Cómpeta Centro', N'29754', 1, '2026-11-11T11:40:32.0000000', NULL);
INSERT INTO dbo.[Locality] ([LocalityId], [MunicipalityId], [Name], [PostalCode], [IsActive], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (21, 21, N'Mondrón', N'29710', 1, '2026-11-11T11:40:32.0000000', NULL);
SET IDENTITY_INSERT dbo.[Locality] OFF;
GO

-- =========================================================================
-- Datos de la tabla: AppUser
-- =========================================================================
INSERT INTO dbo.[AppUser] ([AppUserId], [Email], [NormalizedEmail], [DisplayName], [PhoneNumber], [PasswordHash], [UserRole], [IsEmailVerified], [IsActive], [CreatedAtUtc], [UpdatedAtUtc], [LastLoginAtUtc]) VALUES (N'6284a152-86a7-4e3d-afcb-64cf9169c1ef', N'admin@axarquiahome.es', N'ADMIN@AXARQUIAHOME.ES', N'Administrador Sistema', N'+34600000000', N'HASH_DEMO_123', N'Administrator', 1, 1, '2026-11-11T13:04:34.0000000', NULL, NULL);
INSERT INTO dbo.[AppUser] ([AppUserId], [Email], [NormalizedEmail], [DisplayName], [PhoneNumber], [PasswordHash], [UserRole], [IsEmailVerified], [IsActive], [CreatedAtUtc], [UpdatedAtUtc], [LastLoginAtUtc]) VALUES (N'909c42f4-1beb-4d80-9b58-822215b49d41', N'contacto@nerjasun.com', N'CONTACTO@NERJASUN.COM', N'Nerja Sun Properties', N'+34952520000', N'HASH_DEMO_123', N'Agency', 1, 1, '2026-11-11T13:04:34.0000000', NULL, NULL);
INSERT INTO dbo.[AppUser] ([AppUserId], [Email], [NormalizedEmail], [DisplayName], [PhoneNumber], [PasswordHash], [UserRole], [IsEmailVerified], [IsActive], [CreatedAtUtc], [UpdatedAtUtc], [LastLoginAtUtc]) VALUES (N'bee739cc-9a6d-46fb-9398-990349e21020', N'juan.perez@email.com', N'JUAN.PEREZ@EMAIL.COM', N'Juan Pérez', N'+34611223344', N'HASH_DEMO_123', N'Premium', 1, 1, '2026-11-11T13:04:34.0000000', NULL, NULL);
INSERT INTO dbo.[AppUser] ([AppUserId], [Email], [NormalizedEmail], [DisplayName], [PhoneNumber], [PasswordHash], [UserRole], [IsEmailVerified], [IsActive], [CreatedAtUtc], [UpdatedAtUtc], [LastLoginAtUtc]) VALUES (N'42119021-8878-4fb2-8293-bdacfd3d85b8', N'maria.gomez@email.com', N'MARIA.GOMEZ@EMAIL.COM', N'María Gómez', N'+34655667788', N'HASH_DEMO_123', N'User', 1, 1, '2026-11-11T13:04:34.0000000', NULL, NULL);
INSERT INTO dbo.[AppUser] ([AppUserId], [Email], [NormalizedEmail], [DisplayName], [PhoneNumber], [PasswordHash], [UserRole], [IsEmailVerified], [IsActive], [CreatedAtUtc], [UpdatedAtUtc], [LastLoginAtUtc]) VALUES (N'e17728c0-ab97-465f-a920-d2a7e523dd02', N'info@costaxarquia.es', N'INFO@COSTAXARQUIA.ES', N'Inmobiliaria Costa Axarquía', N'+34952540000', N'HASH_DEMO_123', N'Agency', 1, 1, '2026-11-11T13:04:34.0000000', NULL, NULL);
GO

-- =========================================================================
-- Datos de la tabla: Agency
-- =========================================================================
SET IDENTITY_INSERT dbo.[Agency] ON;
INSERT INTO dbo.[Agency] ([AgencyId], [AppUserId], [Name], [TaxIdentifier], [Email], [PhoneNumber], [Website], [Address], [MunicipalityId], [LocalityId], [Description], [IsVerified], [IsActive], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (1, N'909c42f4-1beb-4d80-9b58-822215b49d41', N'Nerja Sun Properties', N'B92000111', N'contacto@nerjasun.com', N'+34952520000', N'https://www.nerjasun.com', N'Calle Pintada 12', 20, 7, N'Especialistas en alquiler y venta de chalets y apartamentos en Nerja y Frigiliana.', 1, 1, '2026-11-11T13:22:14.0000000', NULL);
INSERT INTO dbo.[Agency] ([AgencyId], [AppUserId], [Name], [TaxIdentifier], [Email], [PhoneNumber], [Website], [Address], [MunicipalityId], [LocalityId], [Description], [IsVerified], [IsActive], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (2, N'e17728c0-ab97-465f-a920-d2a7e523dd02', N'Inmobiliaria Costa Axarquía', N'B92000222', N'info@costaxarquia.es', N'+34952540000', N'https://www.costaxarquia.es', N'Paseo Marítimo 45', 28, 2, N'Líderes en el sector inmobiliario en Torre del Mar, Vélez-Málaga y Torrox.', 1, 1, '2026-11-11T13:22:14.0000000', NULL);
SET IDENTITY_INSERT dbo.[Agency] OFF;
GO

-- =========================================================================
-- Datos de la tabla: SubscriptionPlan
-- =========================================================================
SET IDENTITY_INSERT dbo.[SubscriptionPlan] ON;
INSERT INTO dbo.[SubscriptionPlan] ([SubscriptionPlanId], [Code], [Name], [Description], [Price], [CurrencyCode], [BillingPeriod], [IsActive], [CreatedAtUtc]) VALUES (1, N'FREE', N'Gratuito', N'Acceso básico al portal', 0.00, N'EUR', N'Monthly', 1, '2026-11-11T11:05:35.0000000');
INSERT INTO dbo.[SubscriptionPlan] ([SubscriptionPlanId], [Code], [Name], [Description], [Price], [CurrencyCode], [BillingPeriod], [IsActive], [CreatedAtUtc]) VALUES (2, N'PREMIUM_MONTHLY', N'Premium mensual', N'Funciones avanzadas para usuarios particulares', 0.00, N'EUR', N'Monthly', 1, '2026-11-11T11:05:35.0000000');
INSERT INTO dbo.[SubscriptionPlan] ([SubscriptionPlanId], [Code], [Name], [Description], [Price], [CurrencyCode], [BillingPeriod], [IsActive], [CreatedAtUtc]) VALUES (3, N'AGENCY_MONTHLY', N'Profesional mensual', N'Funciones para agencias inmobiliarias', 0.00, N'EUR', N'Monthly', 1, '2026-11-11T11:05:35.0000000');
SET IDENTITY_INSERT dbo.[SubscriptionPlan] OFF;
GO

-- =========================================================================
-- Datos de la tabla: UserSubscription
-- =========================================================================
SET IDENTITY_INSERT dbo.[UserSubscription] ON;
INSERT INTO dbo.[UserSubscription] ([UserSubscriptionId], [AppUserId], [SubscriptionPlanId], [Status], [StartAtUtc], [EndAtUtc], [ExternalPaymentId], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (1, N'bee739cc-9a6d-46fb-9398-990349e21020', 2, N'Active', '2026-11-11T15:13:17.0000000', '2026-12-11T15:13:17.0000000', N'sub_test_123456789', '2026-11-11T15:13:17.0000000', NULL);
INSERT INTO dbo.[UserSubscription] ([UserSubscriptionId], [AppUserId], [SubscriptionPlanId], [Status], [StartAtUtc], [EndAtUtc], [ExternalPaymentId], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (2, N'909c42f4-1beb-4d80-9b58-822215b49d41', 3, N'Active', '2026-11-11T15:13:17.0000000', '2027-11-11T15:13:17.0000000', N'sub_test_987654321', '2026-11-11T15:13:17.0000000', NULL);
INSERT INTO dbo.[UserSubscription] ([UserSubscriptionId], [AppUserId], [SubscriptionPlanId], [Status], [StartAtUtc], [EndAtUtc], [ExternalPaymentId], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (3, N'42119021-8878-4fb2-8293-bdacfd3d85b8', 1, N'Active', '2026-11-11T15:13:17.0000000', NULL, NULL, '2026-11-11T15:13:17.0000000', NULL);
INSERT INTO dbo.[UserSubscription] ([UserSubscriptionId], [AppUserId], [SubscriptionPlanId], [Status], [StartAtUtc], [EndAtUtc], [ExternalPaymentId], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (4, N'bee739cc-9a6d-46fb-9398-990349e21020', 2, N'Active', '2026-11-11T15:25:45.0000000', '2026-12-11T15:25:45.0000000', N'sub_test_123456789', '2026-11-11T15:25:45.0000000', NULL);
INSERT INTO dbo.[UserSubscription] ([UserSubscriptionId], [AppUserId], [SubscriptionPlanId], [Status], [StartAtUtc], [EndAtUtc], [ExternalPaymentId], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (5, N'909c42f4-1beb-4d80-9b58-822215b49d41', 3, N'Active', '2026-11-11T15:25:45.0000000', '2027-11-11T15:25:45.0000000', N'sub_test_987654321', '2026-11-11T15:25:45.0000000', NULL);
INSERT INTO dbo.[UserSubscription] ([UserSubscriptionId], [AppUserId], [SubscriptionPlanId], [Status], [StartAtUtc], [EndAtUtc], [ExternalPaymentId], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (6, N'42119021-8878-4fb2-8293-bdacfd3d85b8', 1, N'Active', '2026-11-11T15:25:45.0000000', NULL, NULL, '2026-11-11T15:25:45.0000000', NULL);
SET IDENTITY_INSERT dbo.[UserSubscription] OFF;
GO

-- =========================================================================
-- Datos de la tabla: PropertyType
-- =========================================================================
SET IDENTITY_INSERT dbo.[PropertyType] ON;
INSERT INTO dbo.[PropertyType] ([PropertyTypeId], [Name], [Description], [IsActive]) VALUES (1, N'Piso', N'Piso o apartamento', 1);
INSERT INTO dbo.[PropertyType] ([PropertyTypeId], [Name], [Description], [IsActive]) VALUES (2, N'Casa', N'Casa independiente', 1);
INSERT INTO dbo.[PropertyType] ([PropertyTypeId], [Name], [Description], [IsActive]) VALUES (3, N'Adosado', N'Vivienda adosada', 1);
INSERT INTO dbo.[PropertyType] ([PropertyTypeId], [Name], [Description], [IsActive]) VALUES (4, N'Dúplex', N'Vivienda dúplex', 1);
INSERT INTO dbo.[PropertyType] ([PropertyTypeId], [Name], [Description], [IsActive]) VALUES (5, N'Ático', N'Ático', 1);
INSERT INTO dbo.[PropertyType] ([PropertyTypeId], [Name], [Description], [IsActive]) VALUES (6, N'Local', N'Local comercial', 1);
INSERT INTO dbo.[PropertyType] ([PropertyTypeId], [Name], [Description], [IsActive]) VALUES (7, N'Terreno', N'Terreno o parcela', 1);
INSERT INTO dbo.[PropertyType] ([PropertyTypeId], [Name], [Description], [IsActive]) VALUES (8, N'Garaje', N'Plaza de garaje', 1);
INSERT INTO dbo.[PropertyType] ([PropertyTypeId], [Name], [Description], [IsActive]) VALUES (9, N'Trastero', N'Trastero', 1);
INSERT INTO dbo.[PropertyType] ([PropertyTypeId], [Name], [Description], [IsActive]) VALUES (10, N'Finca', N'Finca rústica', 1);
INSERT INTO dbo.[PropertyType] ([PropertyTypeId], [Name], [Description], [IsActive]) VALUES (11, N'Villa / Chalet', N'Villa independiente o chalet con parcela', 1);
INSERT INTO dbo.[PropertyType] ([PropertyTypeId], [Name], [Description], [IsActive]) VALUES (12, N'Cortijo / Casa de Campo', N'Casa rústica tradicional en entorno rural', 1);
SET IDENTITY_INSERT dbo.[PropertyType] OFF;
GO

-- =========================================================================
-- Datos de la tabla: PropertyStatus
-- =========================================================================
SET IDENTITY_INSERT dbo.[PropertyStatus] ON;
INSERT INTO dbo.[PropertyStatus] ([PropertyStatusId], [Name], [Description], [IsActive]) VALUES (1, N'Draft', N'Borrador', 1);
INSERT INTO dbo.[PropertyStatus] ([PropertyStatusId], [Name], [Description], [IsActive]) VALUES (2, N'Published', N'Publicado', 1);
INSERT INTO dbo.[PropertyStatus] ([PropertyStatusId], [Name], [Description], [IsActive]) VALUES (3, N'Reserved', N'Reservado', 1);
INSERT INTO dbo.[PropertyStatus] ([PropertyStatusId], [Name], [Description], [IsActive]) VALUES (4, N'Sold', N'Vendido', 1);
INSERT INTO dbo.[PropertyStatus] ([PropertyStatusId], [Name], [Description], [IsActive]) VALUES (5, N'Rented', N'Alquilado', 1);
INSERT INTO dbo.[PropertyStatus] ([PropertyStatusId], [Name], [Description], [IsActive]) VALUES (6, N'Withdrawn', N'Retirado', 1);
INSERT INTO dbo.[PropertyStatus] ([PropertyStatusId], [Name], [Description], [IsActive]) VALUES (7, N'Expired', N'Anuncio caducado', 1);
SET IDENTITY_INSERT dbo.[PropertyStatus] OFF;
GO

-- =========================================================================
-- Datos de la tabla: Feature
-- =========================================================================
SET IDENTITY_INSERT dbo.[Feature] ON;
INSERT INTO dbo.[Feature] ([FeatureId], [Name], [Category], [DataType], [Unit], [IsActive]) VALUES (1, N'Vistas al mar', N'Ubicación', N'Boolean', NULL, 1);
INSERT INTO dbo.[Feature] ([FeatureId], [Name], [Category], [DataType], [Unit], [IsActive]) VALUES (2, N'Vistas a la montaña', N'Ubicación', N'Boolean', NULL, 1);
INSERT INTO dbo.[Feature] ([FeatureId], [Name], [Category], [DataType], [Unit], [IsActive]) VALUES (3, N'Piscina privada', N'Exterior', N'Boolean', NULL, 1);
INSERT INTO dbo.[Feature] ([FeatureId], [Name], [Category], [DataType], [Unit], [IsActive]) VALUES (4, N'Piscina comunitaria', N'Exterior', N'Boolean', NULL, 1);
INSERT INTO dbo.[Feature] ([FeatureId], [Name], [Category], [DataType], [Unit], [IsActive]) VALUES (5, N'Orientación', N'General', N'Text', NULL, 1);
INSERT INTO dbo.[Feature] ([FeatureId], [Name], [Category], [DataType], [Unit], [IsActive]) VALUES (6, N'Gastos de comunidad', N'Económico', N'Number', N'EUR/mes', 1);
INSERT INTO dbo.[Feature] ([FeatureId], [Name], [Category], [DataType], [Unit], [IsActive]) VALUES (7, N'IBI Anual', N'Económico', N'Number', N'EUR/año', 1);
INSERT INTO dbo.[Feature] ([FeatureId], [Name], [Category], [DataType], [Unit], [IsActive]) VALUES (8, N'Licencia Turística (VFT)', N'Legal', N'Boolean', NULL, 1);
SET IDENTITY_INSERT dbo.[Feature] OFF;
GO

-- =========================================================================
-- Datos de la tabla: Source
-- =========================================================================
SET IDENTITY_INSERT dbo.[Source] ON;
INSERT INTO dbo.[Source] ([SourceId], [Name], [BaseUrl], [SourceType], [IsAuthorized], [IsActive], [AccessNotes], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (1, N'Axarquía Properties Scraping (Demo)', N'https://demo.axarquiaproperties.local', N'Import', 1, 1, N'Fuente de datos simulada para captación masiva', '2026-11-11T11:51:22.0000000', NULL);
INSERT INTO dbo.[Source] ([SourceId], [Name], [BaseUrl], [SourceType], [IsAuthorized], [IsActive], [AccessNotes], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (2, N'Idealista Feed API (Demo)', N'https://api.idealista.com/demo', N'Portal', 1, 1, N'Integración API de pruebas', '2026-11-11T11:51:22.0000000', NULL);
INSERT INTO dbo.[Source] ([SourceId], [Name], [BaseUrl], [SourceType], [IsAuthorized], [IsActive], [AccessNotes], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (3, N'Captación Directa Propietarios', NULL, N'Owner', 1, 1, N'Inmuebles dados de alta directamente por particulares', '2026-11-11T11:51:22.0000000', NULL);
SET IDENTITY_INSERT dbo.[Source] OFF;
GO

-- =========================================================================
-- Datos de la tabla: Property
-- =========================================================================
SET IDENTITY_INSERT dbo.[Property] ON;
INSERT INTO dbo.[Property] ([PropertyId], [PropertyTypeId], [PropertyStatusId], [MunicipalityId], [LocalityId], [AgencyId], [OwnerUserId], [Title], [Description], [OperationType], [Price], [CurrencyCode], [BuiltAreaM2], [UsableAreaM2], [PlotAreaM2], [Bedrooms], [Bathrooms], [FloorNumber], [TotalFloors], [YearBuilt], [Address], [PostalCode], [Latitude], [Longitude], [DistanceToBeachM], [HasLift], [HasTerrace], [HasBalcony], [HasPool], [HasGarden], [HasParking], [HasAirConditioning], [IsFurnished], [EnergyRating], [ConditionDescription], [IsPublished], [IsFeatured], [IsVerified], [PublishedAtUtc], [FirstDetectedAtUtc], [LastCheckedAtUtc], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (1, 1, 2, 28, 2, 2, NULL, N'Espectacular Ático con Vistas al Mar en Primera Línea', N'Magnífico ático situado en el Paseo Marítimo de Torre del Mar. Cuenta con gran terraza orientada al sur, piscina comunitaria y garaje opcional. Totalmente reformado.', N'Sale', 285000.00, N'EUR', 95.00, 85.00, NULL, 2, 2, 5, NULL, NULL, N'Paseo Marítimo Poniente 12, Planta 5, B', N'29740', 36.741200, -4.098100, 50, 1, 1, NULL, 1, NULL, NULL, 1, NULL, N'B', NULL, 1, 1, 1, '2026-11-11T15:25:45.0000000', NULL, NULL, '2026-11-11T15:25:45.0000000', NULL);
INSERT INTO dbo.[Property] ([PropertyId], [PropertyTypeId], [PropertyStatusId], [MunicipalityId], [LocalityId], [AgencyId], [OwnerUserId], [Title], [Description], [OperationType], [Price], [CurrencyCode], [BuiltAreaM2], [UsableAreaM2], [PlotAreaM2], [Bedrooms], [Bathrooms], [FloorNumber], [TotalFloors], [YearBuilt], [Address], [PostalCode], [Latitude], [Longitude], [DistanceToBeachM], [HasLift], [HasTerrace], [HasBalcony], [HasPool], [HasGarden], [HasParking], [HasAirConditioning], [IsFurnished], [EnergyRating], [ConditionDescription], [IsPublished], [IsFeatured], [IsVerified], [PublishedAtUtc], [FirstDetectedAtUtc], [LastCheckedAtUtc], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (2, 11, 2, 16, 15, 1, NULL, N'Villa de Lujo con Piscina Privada y Vistas a la Montaña y Mar', N'Hermosa villa de estilo andaluz ubicada entre Nerja y Frigiliana. Entorno tranquilo, piscina privada, zona de barbacoa y amplios jardines.', N'Sale', 540000.00, N'EUR', 210.00, 185.00, 800.00, 4, 3, NULL, 2, NULL, N'Urb. Cortijo San Rafael', N'29788', 36.772500, -3.881400, 3000, NULL, 1, NULL, 1, 1, 1, NULL, NULL, N'C', NULL, 1, 1, 1, '2026-11-11T15:25:45.0000000', NULL, NULL, '2026-11-11T15:25:45.0000000', NULL);
INSERT INTO dbo.[Property] ([PropertyId], [PropertyTypeId], [PropertyStatusId], [MunicipalityId], [LocalityId], [AgencyId], [OwnerUserId], [Title], [Description], [OperationType], [Price], [CurrencyCode], [BuiltAreaM2], [UsableAreaM2], [PlotAreaM2], [Bedrooms], [Bathrooms], [FloorNumber], [TotalFloors], [YearBuilt], [Address], [PostalCode], [Latitude], [Longitude], [DistanceToBeachM], [HasLift], [HasTerrace], [HasBalcony], [HasPool], [HasGarden], [HasParking], [HasAirConditioning], [IsFurnished], [EnergyRating], [ConditionDescription], [IsPublished], [IsFeatured], [IsVerified], [PublishedAtUtc], [FirstDetectedAtUtc], [LastCheckedAtUtc], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (3, 12, 2, 29, 19, NULL, N'bee739cc-9a6d-46fb-9398-990349e21020', N'Acogedor Cortijo Rústico cerca del Pantano de La Viñuela', N'Casa de campo con gran encanto, vistas panorámicas al embalse de La Viñuela y Sierra Tejeda. Alquiler de larga temporada.', N'Rent', 950.00, N'EUR', 120.00, 105.00, 2500.00, 3, 2, NULL, NULL, NULL, N'Diseminado Pago Los Romanes s/n', N'29712', 36.884100, -4.168300, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, 1, N'D', NULL, 1, 0, 1, '2026-11-11T15:25:45.0000000', NULL, NULL, '2026-11-11T15:25:45.0000000', NULL);
SET IDENTITY_INSERT dbo.[Property] OFF;
GO

-- =========================================================================
-- Datos de la tabla: PropertyFeature
-- =========================================================================
INSERT INTO dbo.[PropertyFeature] ([PropertyId], [FeatureId], [BooleanValue], [NumberValue], [TextValue]) VALUES (1, 1, 1, NULL, NULL);
INSERT INTO dbo.[PropertyFeature] ([PropertyId], [FeatureId], [BooleanValue], [NumberValue], [TextValue]) VALUES (1, 5, NULL, NULL, N'Sur');
INSERT INTO dbo.[PropertyFeature] ([PropertyId], [FeatureId], [BooleanValue], [NumberValue], [TextValue]) VALUES (1, 6, NULL, 65.0000, NULL);
INSERT INTO dbo.[PropertyFeature] ([PropertyId], [FeatureId], [BooleanValue], [NumberValue], [TextValue]) VALUES (2, 1, 1, NULL, NULL);
INSERT INTO dbo.[PropertyFeature] ([PropertyId], [FeatureId], [BooleanValue], [NumberValue], [TextValue]) VALUES (2, 2, 1, NULL, NULL);
INSERT INTO dbo.[PropertyFeature] ([PropertyId], [FeatureId], [BooleanValue], [NumberValue], [TextValue]) VALUES (2, 5, NULL, NULL, N'Suroeste');
INSERT INTO dbo.[PropertyFeature] ([PropertyId], [FeatureId], [BooleanValue], [NumberValue], [TextValue]) VALUES (3, 2, 1, NULL, NULL);
GO

-- =========================================================================
-- Datos de la tabla: PropertyImage
-- =========================================================================
SET IDENTITY_INSERT dbo.[PropertyImage] ON;
INSERT INTO dbo.[PropertyImage] ([PropertyImageId], [PropertyId], [ImageUrl], [ThumbnailUrl], [Caption], [DisplayOrder], [IsPrimary], [SourceImageUrl], [CreatedAtUtc]) VALUES (6, 1, N'https://images.axarquiahome.local/properties/1/main.jpg', N'https://images.axarquiahome.local/properties/1/main_thumb.jpg', N'Salon con vistas al mar', 1, 1, NULL, '2026-11-11T15:25:45.0000000');
INSERT INTO dbo.[PropertyImage] ([PropertyImageId], [PropertyId], [ImageUrl], [ThumbnailUrl], [Caption], [DisplayOrder], [IsPrimary], [SourceImageUrl], [CreatedAtUtc]) VALUES (7, 1, N'https://images.axarquiahome.local/properties/1/terrace.jpg', N'https://images.axarquiahome.local/properties/1/terrace_thumb.jpg', N'Terraza principal', 2, 0, NULL, '2026-11-11T15:25:45.0000000');
INSERT INTO dbo.[PropertyImage] ([PropertyImageId], [PropertyId], [ImageUrl], [ThumbnailUrl], [Caption], [DisplayOrder], [IsPrimary], [SourceImageUrl], [CreatedAtUtc]) VALUES (8, 2, N'https://images.axarquiahome.local/properties/2/villa.jpg', N'https://images.axarquiahome.local/properties/2/villa_thumb.jpg', N'Vista exterior de la villa', 1, 1, NULL, '2026-11-11T15:25:45.0000000');
INSERT INTO dbo.[PropertyImage] ([PropertyImageId], [PropertyId], [ImageUrl], [ThumbnailUrl], [Caption], [DisplayOrder], [IsPrimary], [SourceImageUrl], [CreatedAtUtc]) VALUES (9, 2, N'https://images.axarquiahome.local/properties/2/pool.jpg', N'https://images.axarquiahome.local/properties/2/pool_thumb.jpg', N'Piscina privada', 2, 0, NULL, '2026-11-11T15:25:45.0000000');
INSERT INTO dbo.[PropertyImage] ([PropertyImageId], [PropertyId], [ImageUrl], [ThumbnailUrl], [Caption], [DisplayOrder], [IsPrimary], [SourceImageUrl], [CreatedAtUtc]) VALUES (10, 3, N'https://images.axarquiahome.local/properties/3/cortijo.jpg', N'https://images.axarquiahome.local/properties/3/cortijo_thumb.jpg', N'Fachada del cortijo', 1, 1, NULL, '2026-11-11T15:25:45.0000000');
SET IDENTITY_INSERT dbo.[PropertyImage] OFF;
GO

-- =========================================================================
-- Datos de la tabla: PropertyListing
-- =========================================================================
SET IDENTITY_INSERT dbo.[PropertyListing] ON;
INSERT INTO dbo.[PropertyListing] ([PropertyListingId], [PropertyId], [OperationType], [PricePeriod], [Price], [CurrencyCode], [DepositAmount], [MinStayUnits], [MaxStayUnits], [UtilitiesIncluded], [AvailableFromDate], [IsActive], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (1, 1, N'Sale', N'OneTime', 285000.00, N'EUR', NULL, NULL, NULL, NULL, NULL, 1, '2026-11-11T15:25:45.0000000', NULL);
INSERT INTO dbo.[PropertyListing] ([PropertyListingId], [PropertyId], [OperationType], [PricePeriod], [Price], [CurrencyCode], [DepositAmount], [MinStayUnits], [MaxStayUnits], [UtilitiesIncluded], [AvailableFromDate], [IsActive], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (2, 2, N'Sale', N'OneTime', 540000.00, N'EUR', NULL, NULL, NULL, NULL, NULL, 1, '2026-11-11T15:25:45.0000000', NULL);
INSERT INTO dbo.[PropertyListing] ([PropertyListingId], [PropertyId], [OperationType], [PricePeriod], [Price], [CurrencyCode], [DepositAmount], [MinStayUnits], [MaxStayUnits], [UtilitiesIncluded], [AvailableFromDate], [IsActive], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (3, 3, N'Rent', N'Monthly', 950.00, N'EUR', NULL, NULL, NULL, NULL, NULL, 1, '2026-11-11T15:25:45.0000000', NULL);
SET IDENTITY_INSERT dbo.[PropertyListing] OFF;
GO

-- =========================================================================
-- Datos de la tabla: PropertySource
-- =========================================================================
SET IDENTITY_INSERT dbo.[PropertySource] ON;
INSERT INTO dbo.[PropertySource] ([PropertySourceId], [PropertyId], [SourceId], [ExternalId], [OriginalUrl], [OriginalTitle], [OriginalDescription], [FirstSeenAtUtc], [LastSeenAtUtc], [LastVerifiedAtUtc], [IsActive], [VerificationStatus], [ImportNotes]) VALUES (3, 1, 1, N'EXT-99211', N'https://demo.axarquiaproperties.local/p/99211', N'Ático Torre del Mar en venta', NULL, '2026-11-11T15:25:45.0000000', '2026-11-11T15:25:45.0000000', NULL, 1, N'Verified', NULL);
INSERT INTO dbo.[PropertySource] ([PropertySourceId], [PropertyId], [SourceId], [ExternalId], [OriginalUrl], [OriginalTitle], [OriginalDescription], [FirstSeenAtUtc], [LastSeenAtUtc], [LastVerifiedAtUtc], [IsActive], [VerificationStatus], [ImportNotes]) VALUES (4, 2, 1, N'EXT-88402', N'https://demo.axarquiaproperties.local/p/88402', N'Villa Frigiliana 4 dorms', NULL, '2026-11-11T15:25:45.0000000', '2026-11-11T15:25:45.0000000', NULL, 1, N'Verified', NULL);
SET IDENTITY_INSERT dbo.[PropertySource] OFF;
GO

-- =========================================================================
-- Datos de la tabla: PriceHistory
-- =========================================================================
SET IDENTITY_INSERT dbo.[PriceHistory] ON;
INSERT INTO dbo.[PriceHistory] ([PriceHistoryId], [PropertyId], [Price], [PreviousPrice], [CurrencyCode], [ChangeType], [RecordedAtUtc], [SourceId], [Notes], [PropertyListingId]) VALUES (4, 1, 295000.00, NULL, N'EUR', N'Initial', '2026-10-12T15:25:45.0000000', NULL, N'Precio de salida', NULL);
INSERT INTO dbo.[PriceHistory] ([PriceHistoryId], [PropertyId], [Price], [PreviousPrice], [CurrencyCode], [ChangeType], [RecordedAtUtc], [SourceId], [Notes], [PropertyListingId]) VALUES (5, 1, 285000.00, 295000.00, N'EUR', N'Decrease', '2026-11-11T15:25:45.0000000', NULL, N'Bajada de precio promocional', NULL);
INSERT INTO dbo.[PriceHistory] ([PriceHistoryId], [PropertyId], [Price], [PreviousPrice], [CurrencyCode], [ChangeType], [RecordedAtUtc], [SourceId], [Notes], [PropertyListingId]) VALUES (6, 2, 540000.00, NULL, N'EUR', N'Initial', '2026-11-11T15:25:45.0000000', NULL, N'Publicación inicial', NULL);
SET IDENTITY_INSERT dbo.[PriceHistory] OFF;
GO

-- =========================================================================
-- Datos de la tabla: RentalBooking
-- =========================================================================
-- (tabla sin datos)

-- =========================================================================
-- Datos de la tabla: Favorite
-- =========================================================================
INSERT INTO dbo.[Favorite] ([AppUserId], [PropertyId], [CreatedAtUtc]) VALUES (N'bee739cc-9a6d-46fb-9398-990349e21020', 2, '2026-11-11T15:25:45.0000000');
INSERT INTO dbo.[Favorite] ([AppUserId], [PropertyId], [CreatedAtUtc]) VALUES (N'42119021-8878-4fb2-8293-bdacfd3d85b8', 1, '2026-11-11T15:25:45.0000000');
INSERT INTO dbo.[Favorite] ([AppUserId], [PropertyId], [CreatedAtUtc]) VALUES (N'42119021-8878-4fb2-8293-bdacfd3d85b8', 2, '2026-11-11T15:25:45.0000000');
GO

-- =========================================================================
-- Datos de la tabla: SavedSearch
-- =========================================================================
SET IDENTITY_INSERT dbo.[SavedSearch] ON;
INSERT INTO dbo.[SavedSearch] ([SavedSearchId], [AppUserId], [Name], [SearchCriteriaJson], [IsActive], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (1, N'42119021-8878-4fb2-8293-bdacfd3d85b8', N'Áticos o Casas en la Costa Axárquica', N'{"operationType":"Sale","maxPrice":300000,"minBedrooms":2,"hasTerrace":true,"municipalities":["Vélez-Málaga","Torrox","Nerja"]}', 1, '2026-11-11T15:13:17.0000000', NULL);
INSERT INTO dbo.[SavedSearch] ([SavedSearchId], [AppUserId], [Name], [SearchCriteriaJson], [IsActive], [CreatedAtUtc], [UpdatedAtUtc]) VALUES (2, N'42119021-8878-4fb2-8293-bdacfd3d85b8', N'Áticos o Casas en la Costa Axárquica', N'{"operationType":"Sale","maxPrice":300000,"minBedrooms":2,"hasTerrace":true,"municipalities":["Vélez-Málaga","Torrox","Nerja"]}', 1, '2026-11-11T15:25:45.0000000', NULL);
SET IDENTITY_INSERT dbo.[SavedSearch] OFF;
GO

-- =========================================================================
-- Datos de la tabla: Alert
-- =========================================================================
SET IDENTITY_INSERT dbo.[Alert] ON;
INSERT INTO dbo.[Alert] ([AlertId], [SavedSearchId], [AlertType], [DeliveryChannel], [IsEnabled], [Frequency], [LastSentAtUtc], [CreatedAtUtc]) VALUES (1, 1, N'NewProperty', N'Email', 1, N'Daily', NULL, '2026-11-11T15:13:17.0000000');
INSERT INTO dbo.[Alert] ([AlertId], [SavedSearchId], [AlertType], [DeliveryChannel], [IsEnabled], [Frequency], [LastSentAtUtc], [CreatedAtUtc]) VALUES (2, 1, N'PriceChange', N'Email', 1, N'Immediate', NULL, '2026-11-11T15:13:17.0000000');
INSERT INTO dbo.[Alert] ([AlertId], [SavedSearchId], [AlertType], [DeliveryChannel], [IsEnabled], [Frequency], [LastSentAtUtc], [CreatedAtUtc]) VALUES (3, 2, N'NewProperty', N'Email', 1, N'Daily', NULL, '2026-11-11T15:25:45.0000000');
INSERT INTO dbo.[Alert] ([AlertId], [SavedSearchId], [AlertType], [DeliveryChannel], [IsEnabled], [Frequency], [LastSentAtUtc], [CreatedAtUtc]) VALUES (4, 2, N'PriceChange', N'Email', 1, N'Immediate', NULL, '2026-11-11T15:25:45.0000000');
SET IDENTITY_INSERT dbo.[Alert] OFF;
GO

PRINT N'Carga de datos de AxarquiaHomeDb completada.';
GO

