<#
    Genera un script de INSERTs con todos los datos de las tablas de AxarquiaHomeDb.
    Uso: configura ConnectionStrings__TerraParadiseDb y ejecuta pwsh -File .\Generate-InsertScript.ps1
#>

$connStr = [Environment]::GetEnvironmentVariable('ConnectionStrings__TerraParadiseDb')
if ([string]::IsNullOrWhiteSpace($connStr)) {
    throw 'Configura ConnectionStrings__TerraParadiseDb con la conexion a tu base AxarquiaHomeDb antes de ejecutar el generador.'
}

$tables = @(
    'AutonomousCommunity','Province','Comarca','Municipality','Locality',
    'AppUser','Agency','SubscriptionPlan','UserSubscription',
    'PropertyType','PropertyStatus','Feature','Source',
    'Property','PropertyFeature','PropertyImage','PropertyListing','PropertySource','PriceHistory',
    'RentalBooking','Favorite','SavedSearch','Alert'
)

$outFile = Join-Path $PSScriptRoot "02_SeedData_AxarquiaHomeDb.sql"

$sb = New-Object System.Text.StringBuilder
[void]$sb.AppendLine("/*")
[void]$sb.AppendLine("================================================================================")
[void]$sb.AppendLine(" Script de datos (INSERTs) para AxarquiaHomeDb")
[void]$sb.AppendLine(" Generado automaticamente desde el servidor origen.")
[void]$sb.AppendLine(" Ejecutar DESPUES de 01_CreateDatabase_AxarquiaHomeDb.sql")
[void]$sb.AppendLine("================================================================================")
[void]$sb.AppendLine("*/")
[void]$sb.AppendLine("SET NOCOUNT ON;")
[void]$sb.AppendLine("USE AxarquiaHomeDb;")
[void]$sb.AppendLine("GO")
[void]$sb.AppendLine("")

function Format-SqlValue {
    param($value, [string]$typeName)

    if ($null -eq $value -or $value -is [DBNull]) {
        return "NULL"
    }

    switch ($typeName) {
        { $_ -in @('String','Char','Guid') } {
            $escaped = $value.ToString().Replace("'", "''")
            return "N'$escaped'"
        }
        'Boolean' {
            return $(if ($value) { "1" } else { "0" })
        }
        'DateTime' {
            $dt = [datetime]$value
            return "'$($dt.ToString('yyyy-MM-ddTHH:mm:ss.fffffff'))'"
        }
        'TimeSpan' {
            return "'$value'"
        }
        'Byte[]' {
            return "DEFAULT"
        }
        default {
            # Numeric types (Int16/32/64, Decimal, Double, Single, Byte)
            $s = $value.ToString([System.Globalization.CultureInfo]::InvariantCulture)
            return $s
        }
    }
}

$connection = New-Object System.Data.SqlClient.SqlConnection($connStr)
$connection.Open()

foreach ($table in $tables) {
    [void]$sb.AppendLine("-- =========================================================================")
    [void]$sb.AppendLine("-- Datos de la tabla: $table")
    [void]$sb.AppendLine("-- =========================================================================")

    $cmdSchema = $connection.CreateCommand()
    $cmdSchema.CommandText = "SELECT c.name AS ColumnName, ty.name AS TypeName, c.is_identity AS IsIdentity FROM sys.columns c INNER JOIN sys.types ty ON c.user_type_id = ty.user_type_id WHERE c.object_id = OBJECT_ID(@tbl) AND ty.name NOT IN ('timestamp','rowversion') ORDER BY c.column_id"
    [void]$cmdSchema.Parameters.AddWithValue("@tbl", "dbo.$table")
    $readerSchema = $cmdSchema.ExecuteReader()

    $columns = @()
    $hasIdentity = $false
    while ($readerSchema.Read()) {
        $colName = $readerSchema["ColumnName"].ToString()
        $sqlType = $readerSchema["TypeName"].ToString()
        $isIdentity = [bool]$readerSchema["IsIdentity"]
        if ($isIdentity) { $hasIdentity = $true }
        $columns += [PSCustomObject]@{ Name = $colName; SqlType = $sqlType }
    }
    $readerSchema.Close()

    if ($columns.Count -eq 0) {
        [void]$sb.AppendLine("-- (sin columnas elegibles)")
        [void]$sb.AppendLine("")
        continue
    }

    $colNamesQuoted = ($columns | ForEach-Object { "[$($_.Name)]" }) -join ", "

    $cmdData = $connection.CreateCommand()
    $cmdData.CommandText = "SELECT $colNamesQuoted FROM dbo.[$table]"
    $readerData = $cmdData.ExecuteReader()

    $rowCount = 0
    $rows = @()
    while ($readerData.Read()) {
        $rowCount++
        $values = @()
        for ($i = 0; $i -lt $columns.Count; $i++) {
            $colType = $columns[$i].SqlType
            $netTypeName = $readerData.GetFieldType($i).Name
            $rawValue = $readerData.GetValue($i)
            $values += Format-SqlValue -value $rawValue -typeName $netTypeName
        }
        $rows += "INSERT INTO dbo.[$table] ($colNamesQuoted) VALUES (" + ($values -join ", ") + ");"
    }
    $readerData.Close()

    if ($rowCount -eq 0) {
        [void]$sb.AppendLine("-- (tabla sin datos)")
        [void]$sb.AppendLine("")
        continue
    }

    if ($hasIdentity) {
        [void]$sb.AppendLine("SET IDENTITY_INSERT dbo.[$table] ON;")
    }

    foreach ($row in $rows) {
        [void]$sb.AppendLine($row)
    }

    if ($hasIdentity) {
        [void]$sb.AppendLine("SET IDENTITY_INSERT dbo.[$table] OFF;")
    }

    [void]$sb.AppendLine("GO")
    [void]$sb.AppendLine("")

    Write-Host "Tabla $table -> $rowCount filas"
}

$connection.Close()

[void]$sb.AppendLine("PRINT N'Carga de datos de AxarquiaHomeDb completada.';")
[void]$sb.AppendLine("GO")

Set-Content -Path $outFile -Value $sb.ToString() -Encoding UTF8

Write-Host "Script generado en: $outFile"
