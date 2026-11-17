# Instrucciones de desarrollo para Axarquía Home

## Arquitectura

- Mantén Clean Architecture: Domain no depende de otras capas; Application depende solo de Domain; Infrastructure implementa las abstracciones de Application y contiene los detalles de EF Core; API y Worker son puntos de entrada.
- No accedas a `DbContext` desde endpoints. Añade casos de uso y abstracciones de Application cuando exista una necesidad concreta.
- Evita dependencias circulares, lógica de negocio en HTTP y abstracciones sin un consumidor real.
- Mantén nullable reference types habilitados y propaga `CancellationToken` en operaciones asíncronas.

## Alcance del producto

- No añadas propiedades, municipios, anuncios ficticios ni funcionalidades inmobiliarias sin una solicitud de fase explícita.
- No incorpores scraping ni integraciones de fuentes externas sin autorización y revisión legal.
- La autenticación, las suscripciones y los pagos están preparados como extensiones, pero todavía no tienen flujos funcionales.

## Persistencia y configuración

- SQL Server y EF Core son los componentes de persistencia previstos; no añadas migraciones de negocio hasta que se definan entidades y requisitos.
- No guardes contraseñas, cadenas de conexión reales, tokens ni claves en el repositorio. Usa User Secrets localmente y variables de entorno en contenedores/CI.
- Conserva `TerraParadiseDb` como nombre de base de datos y valida cambios de esquema con pruebas.

## API y seguridad

- Usa convenciones REST coherentes, respuestas Problem Details para errores y logs estructurados sin datos sensibles.
- Mantén CORS limitado a orígenes configurados y TLS en el punto de terminación HTTPS del entorno.
- No habilites autenticación o autorización por roles hasta definir los flujos y políticas correspondientes.

## Frontend y calidad

- Mantén Angular organizado en `core`, `shared` y `features`; usa componentes standalone, rutas explícitas y servicios inyectables.
- Mantén TypeScript estricto y accesibilidad básica: semántica HTML, navegación por teclado y textos alternativos.
- Añade pruebas que cubran comportamiento observable y límites arquitectónicos; no añadas pruebas vacías.
- Antes de entregar cambios, ejecuta `dotnet test TerraParadise.sln`, `npm run build` y `npm test -- --watch=false` en la aplicación Angular, según el alcance modificado.
