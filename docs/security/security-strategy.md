# Estrategia de seguridad

Esta entrega no expone cuentas, autenticación ni autorización por roles. Infrastructure registra ASP.NET Core Identity y los nombres de roles como puntos de extensión; `Anonymous` describe el acceso sin autenticar y no debe asignarse como rol persistido.

- Mantener contraseñas y cadenas de conexión fuera del código y de los logs.
- Limitar CORS a los orígenes del entorno y terminar TLS en Kestrel o en un proxy confiable.
- Responder a fallos inesperados sin serializar mensajes internos ni stack traces.
- Añadir políticas de autorización explícitas antes de publicar endpoints protegidos; no confiar en ocultar enlaces del frontend.
- Usar cuentas SQL de mínimo privilegio y configuración distinta para desarrollo y producción.
- Revisar dependencias y actualizar parches compatibles mediante CI.

No se ha aplicado una migración Identity ni se han creado usuarios o roles en una base de datos.
