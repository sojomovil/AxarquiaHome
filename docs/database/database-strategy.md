# Estrategia de base de datos

SQL Server es el motor previsto y EF Core 10 el ORM. La base local se denomina `TerraParadiseDb`. El `TerraParadiseDbContext` hereda de IdentityDbContext y registra el usuario de aplicación y los roles para permitir incorporar autenticación posteriormente.

No hay entidades inmobiliarias ni migraciones en esta fase. El modelo Identity no se crea en una base real hasta que se genere y aplique una migración revisada. No debe añadirse un modelo de negocio por anticipado.

La cadena de conexión se obtiene de `ConnectionStrings:TerraParadiseDb`. En desarrollo se configura con User Secrets; Compose la construye a partir de `MSSQL_SA_PASSWORD`; los entornos desplegados deben inyectarla desde su gestor de secretos. No se guardan credenciales en `appsettings*.json`.

Compose usa SQL Server 2022 Developer y volumen nombrado para conservar datos locales. Developer no es una licencia de producción.
