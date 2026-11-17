# Entorno de desarrollo

## Requisitos

- Windows, macOS o Linux con .NET SDK 10.
- Node.js LTS y npm para Angular.
- Docker Desktop/Engine y Compose para levantar SQL Server, API y Worker en contenedores.

## Inicio local

1. Copia `.env.example` a `.env` y configura una contraseña de desarrollo segura.
2. Ejecuta `docker compose up --build`; usa `docker compose down` para detener servicios sin borrar el volumen de SQL.
3. Para ejecutar .NET fuera de Compose, establece `ConnectionStrings:TerraParadiseDb` como User Secret tanto para API como para Worker.
4. Arranca la API con `dotnet run --project src\backend\TerraParadise.Api --launch-profile http`.
5. Arranca Angular con `npm ci` y `npm start` desde `src\frontend\TerraParadise.Web`.

El Worker queda en espera sin ejecutar trabajos. No se crean tablas; Identity debe migrarse explícitamente en una fase posterior. La API local usa el puerto HTTP 5135 y Angular 4200. Compose publica la API en 8080.

## Validación

Desde la raíz: `dotnet restore TerraParadise.sln`, `dotnet build TerraParadise.sln -c Release` y `dotnet test TerraParadise.sln -c Release`. En el frontend: `npm run build` y `npm test -- --watch=false`.
