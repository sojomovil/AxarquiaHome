# Axarquía Home

Arquitectura inicial para una plataforma inmobiliaria especializada en la comarca de la Axarquía. Esta fase entrega los cimientos técnicos; no incluye anuncios, búsqueda, integraciones, cuentas ni pagos.

## Requisitos

- .NET SDK 10
- Node.js LTS y npm
- Docker Desktop con Docker Compose (solo para SQL Server y ejecución en contenedores)

## Tecnologías

| Componente | Versión |
|---|---|
| .NET / ASP.NET Core | 10 |
| Entity Framework Core / SQL Server provider | 10.0.13 |
| Angular CLI / Angular | 22.2.7 / 22.2.x |
| TypeScript | 6.0.x |
| Node.js | 26 LTS |
| SQL Server en desarrollo | 2022 Developer |
| xUnit | 2.9.3 |
| NSubstitute | 5.3.0 |

## Estructura

```text
src/
  backend/
    TerraParadise.Domain/
    TerraParadise.Application/
    TerraParadise.Infrastructure/
    TerraParadise.Api/
    TerraParadise.Worker/
  frontend/
    TerraParadise.Web/
tests/
  TerraParadise.Domain.Tests/
  TerraParadise.Application.Tests/
  TerraParadise.Infrastructure.Tests/
  TerraParadise.Api.Tests/
docs/
  architecture/ database/ api/ security/ testing/ development/ decisions/
```

La API y el Worker dependen de Application e Infrastructure. Infrastructure depende de Application y Domain; Application depende únicamente de Domain. El frontend es independiente.

## SQL Server local con Docker

1. Copia `.env.example` a `.env` y establece en `MSSQL_SA_PASSWORD` una contraseña local fuerte que cumpla los requisitos de SQL Server. `.env` está excluido de Git.
2. Desde la raíz, ejecuta `docker compose up --build`.
3. La API queda disponible en `http://localhost:8080`; su comprobación de salud es `/health`. El SQL Server se publica en el puerto `1433`.
4. Detén los contenedores con `docker compose down`. El volumen de datos se conserva.

La imagen SQL Server usa Developer edition para desarrollo local. La configuración de Compose pasa las credenciales solo mediante variables de entorno; no se versionan contraseñas.

## Ejecutar API y Worker fuera de Docker

Configura la cadena de conexión como User Secret (no la guardes en `appsettings.json`):

```powershell
dotnet user-secrets set "ConnectionStrings:TerraParadiseDb" "Server=localhost,1433;Database=TerraParadiseDb;User Id=sa;Password=<tu-contraseña-local>;Encrypt=True;TrustServerCertificate=True" --project src\backend\TerraParadise.Api
dotnet user-secrets set "ConnectionStrings:TerraParadiseDb" "Server=localhost,1433;Database=TerraParadiseDb;User Id=sa;Password=<tu-contraseña-local>;Encrypt=True;TrustServerCertificate=True" --project src\backend\TerraParadise.Worker
dotnet run --project src\backend\TerraParadise.Api --launch-profile http
```

Para ejecutar el Worker, abre otra terminal y ejecuta `dotnet run --project src\backend\TerraParadise.Worker`. En esta fase solo registra que está listo y queda a la espera; no procesa trabajos ni consulta la base de datos.

La API publica OpenAPI en desarrollo y health checks en `/health`. La redirección HTTPS se controla con `Https:Redirect`; en producción, termina TLS en el proxy o gateway y configura CORS según el origen del frontend.

## Frontend Angular

```powershell
cd src\frontend\TerraParadise.Web
npm ci
npm start
```

La aplicación de desarrollo se sirve en `http://localhost:4200`. Para compilar y probar:

```powershell
npm run build
npm test -- --watch=false
```

La URL base de la API local se define en `src/environments/environment.ts`. La configuración de producción usa una ruta relativa (`/api`) que requiere que el hosting configure un proxy hacia la API.

## Compilar y probar el backend

Desde la raíz:

```powershell
dotnet restore TerraParadise.sln
dotnet build TerraParadise.sln --configuration Release
dotnet test TerraParadise.sln --configuration Release
```

No hay migraciones iniciales: aún no se han definido tablas funcionales y el modelo Identity solo está preparado. Cuando se apruebe el alcance de identidad, se podrá generar y revisar la primera migración.

## Secretos

- Desarrollo: .NET User Secrets.
- Contenedores: `.env` local o variables seguras del entorno.
- CI: secretos del proveedor, si fueran necesarios.
- No publiques archivos `.env`, contraseñas, tokens ni cadenas de conexión reales.

## Documentación técnica

Consulta [`docs/architecture/architecture-overview.md`](docs/architecture/architecture-overview.md) y los documentos especializados bajo `docs/`. La estrategia para continuar el desarrollo se recoge en [`.github/copilot-instructions.md`](.github/copilot-instructions.md).
