# Clean Architecture

## Dirección de dependencias

- **Domain**: tipos y reglas de dominio; sin referencia a frameworks ni otras capas.
- **Application**: casos de uso, contratos y DTOs; depende de Domain.
- **Infrastructure**: EF Core, SQL Server e implementaciones técnicas; depende de Application y Domain.
- **API**: HTTP, OpenAPI, middleware y composición; depende de Application e Infrastructure.
- **Worker**: host en segundo plano que reutiliza Application e Infrastructure.

El dominio y los casos de uso no deben conocer HTTP, SQL Server, Angular ni el contenedor. Los puntos de entrada enlazan abstracciones a implementaciones mediante métodos de extensión de DI.

Todavía no existen entidades de negocio ni repositorios porque no se han aprobado sus reglas. La excepción de dominio y la integración Identity son cimientos técnicos, no casos de uso.
