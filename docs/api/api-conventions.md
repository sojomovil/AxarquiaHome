# Convenciones de API

- REST sobre HTTPS en despliegues; JSON como formato de representación.
- OpenAPI está disponible únicamente en Development.
- `GET /health` reporta el estado del host; no implica una comprobación de conectividad de SQL Server.
- `GET /` identifica el servicio y su estado básico.
- Las excepciones no controladas se registran en logs y se devuelven como Problem Details genérico, sin exponer detalles internos.
- CORS usa `Cors:AllowedOrigins`; no se habilitan orígenes arbitrarios.
- Las operaciones futuras deben ser asíncronas, aceptar `CancellationToken`, validar entradas y versionar los contratos cuando haya compatibilidad que preservar.

No hay endpoints de usuarios, autenticación ni propiedades en esta entrega.
