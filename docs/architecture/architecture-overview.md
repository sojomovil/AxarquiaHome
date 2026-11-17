# Visión general de arquitectura

Axarquía Home parte de una solución modular .NET 10 con Clean Architecture y una aplicación Angular independiente. En esta fase se entrega el esqueleto técnico, sin funcionalidad inmobiliaria ni datos de anuncios.

```text
Angular Web ──HTTP──> ASP.NET Core API ──> Application ──> Domain
                                   └──────> Infrastructure ──> SQL Server
Worker ───────────────────────────┬──────> Application
                                  └──────> Infrastructure
```

Domain contiene el lenguaje y reglas de negocio cuando se definan. Application coordinará casos de uso y contratos. Infrastructure implementa persistencia e integraciones técnicas. API y Worker son hosts separados y reutilizan las capas internas.

La identidad de ASP.NET Core se prepara sobre EF Core, sin registro, inicio de sesión ni migraciones todavía. Las futuras capacidades deben añadirse en módulos/casos de uso concretos, sin convertir la base técnica en una capa de negocio prematura.

La solución incluye cinco proyectos backend, cuatro proyectos de pruebas, una aplicación Angular, Docker Compose para SQL Server/API/Worker, CI y documentación arquitectónica.
