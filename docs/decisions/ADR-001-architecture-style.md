# ADR-001: Estilo de arquitectura

- **Estado:** Aceptado
- **Decisión:** separar Domain, Application, Infrastructure y los hosts API/Worker mediante Clean Architecture pragmática.
- **Motivo:** facilitar el crecimiento de capacidades sin acoplar reglas al transporte o la persistencia.
- **Consecuencias:** algunas abstracciones y contratos aparecerán cuando exista un caso de uso; no se crean repositorios vacíos ni módulos de negocio especulativos.
