# ADR-003: Aplicación frontend

- **Estado:** Aceptado
- **Decisión:** aplicación Angular standalone con TypeScript estricto y estructura `core`, `shared` y `features`.
- **Motivo:** separar infraestructura HTTP, componentes reutilizables y páginas, manteniendo el frontend desplegable de forma independiente.
- **Consecuencias:** el frontend habla con la API mediante un servicio HTTP base; el hosting de producción debe configurar la ruta relativa `/api`.
