# Estrategia de pruebas

Los cuatro proyectos de pruebas usan xUnit. NSubstitute está disponible para dobles de contratos cuando haya casos de uso que lo necesiten; no se crean sustitutos sin consumidor.

- **Domain.Tests** verifica la frontera de dependencias del dominio.
- **Application.Tests** verifica la dependencia hacia Domain y la ausencia de referencias a las capas externas.
- **Infrastructure.Tests** inspecciona el modelo Identity en EF Core y confirma que no se añadieron entidades de negocio.
- **Api.Tests** usa `WebApplicationFactory` para comprobar el endpoint de salud sin requerir una instancia SQL Server.

Ejecutar `dotnet test TerraParadise.sln --configuration Release`. Angular incluye una prueba de renderizado de su página inicial; ejecutar `npm test -- --watch=false` desde su directorio. Docker Compose no puede ejecutarse en una máquina sin Docker.
