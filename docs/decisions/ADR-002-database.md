# ADR-002: Base de datos

- **Estado:** Aceptado
- **Decisión:** SQL Server con EF Core 10; base local `TerraParadiseDb`.
- **Motivo:** compatibilidad con el stack objetivo y soporte de SQL Server en desarrollo mediante Docker.
- **Consecuencias:** configuración por secretos/entorno, sin contraseña versionada. No se aplica una migración hasta que el modelo de identidad o negocio esté aprobado.
