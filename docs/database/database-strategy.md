# Estrategia de base de datos

SQL Server es el motor previsto y EF Core 10 el ORM. La base local predeterminada de Compose se denomina `TerraParadiseDb`. El `TerraParadiseDbContext` hereda de IdentityDbContext y registra el usuario de aplicación y los roles para permitir incorporar autenticación posteriormente.

El modelo Identity es independiente del modelo generado desde la base existente. No se crea en una base real hasta que se genere y aplique una migración revisada.

La API registra `TerraParadiseDataDbContext` mediante Infrastructure para que los componentes de persistencia puedan usarlo en las operaciones CRUD. Ambos contextos leen `ConnectionStrings:TerraParadiseDb`. Al ejecutar la API localmente en `Development`, configura esa clave en sus User Secrets para apuntar a `AxarquiaHomeDb`. Compose usa por defecto una cadena construida a partir de `MSSQL_SA_PASSWORD`; para usar la base existente en otro entorno, inyecta `ConnectionStrings__TerraParadiseDb` desde su gestor de secretos. No se guardan credenciales en `appsettings*.json`.

Compose usa SQL Server 2022 Developer y volumen nombrado para conservar datos locales. Developer no es una licencia de producción.

## Generar el modelo desde SQL Server (database-first)

`TerraParadise.Data` contiene las entidades generadas en `Generated\Models` y el contexto `TerraParadiseDataDbContext` en `Generated`. El esquema de origen es `AxarquiaHomeDb`. La API se usa como proyecto de inicio para que EF Core pueda leer su configuración y sus User Secrets. El scaffolding no modifica la base de datos.

Antes de ejecutar el comando, configura una cadena que apunte a `AxarquiaHomeDb` en los User Secrets de la API con la clave `ConnectionStrings:TerraParadiseDb`, o en la variable de entorno `ConnectionStrings__TerraParadiseDb` de la terminal. `TerraParadiseDb` es el nombre de la clave de configuración; no tiene que coincidir con `Initial Catalog`. En Visual Studio puedes usar **Administrar secretos de usuario** en el proyecto de la API. Usa una cuenta con acceso a los metadatos de los objetos que quieras generar.

Desde la raíz de la solución, en PowerShell:

```powershell
dotnet tool restore
dotnet ef dbcontext scaffold 'Name=ConnectionStrings:TerraParadiseDb' Microsoft.EntityFrameworkCore.SqlServer `
  --project '.\src\backend\TerraParadise.Data' `
  --startup-project '.\src\backend\TerraParadise.Api' `
  --context TerraParadiseDataDbContext --context-dir Generated --output-dir 'Generated\Models' `
  --no-onconfiguring -- --environment Development
```

`--no-onconfiguring` evita generar código de configuración de la conexión. Si la base contiene objetos ajenos a la aplicación (por ejemplo, tablas de Identity), limita la selección con `--schema` o `--table` **antes** de `-- --environment Development`. No uses `--force` salvo para regenerar archivos tras revisar los cambios: sobrescribe archivos generados, pero no elimina los correspondientes a objetos retirados del esquema. Mantén las extensiones parciales fuera de `Generated`.

### Incorporar cambios sin reemplazar el modelo existente

Para un scaffolding incremental, genera en directorios temporales fuera de los proyectos, manteniendo los namespaces actuales mediante `--namespace TerraParadise.Data.Generated.Models` y `--context-namespace TerraParadise.Data.Generated`. Incluye las tablas modificadas y sus principales para obtener sus relaciones completas. No reemplaces el contexto existente por el contexto parcial generado: perderías los mapeos de las tablas no seleccionadas. Integra solo las entidades nuevas, las propiedades y navegaciones afectadas, los `DbSet` y los bloques de configuración correspondientes; después elimina los archivos temporales y valida compilación y pruebas.

El modelo incorpora `PropertyListing`, `RentalBooking` y la relación opcional `PriceHistory.PropertyListingId`. Se conservan las relaciones con `Property`, `AppUser` y `Source`, así como los índices, valores predeterminados y comportamientos de eliminación generados desde SQL Server. Esto no habilita flujos de anuncios o reservas, ni añade migraciones o cambios a la base de datos.
