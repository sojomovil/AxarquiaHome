# TerraParadise.Web

Aplicación Angular standalone de Axarquía Home. La estructura separa servicios compartidos en `core`, elementos reutilizables en `shared` y páginas en `features`.

Desde este directorio:

```powershell
npm ci
npm start
npm run build
npm test -- --watch=false
```

La aplicación de desarrollo se sirve en `http://localhost:4200`. La URL base local de la API está en `src/environments/environment.ts`; producción usa `/api` y necesita un proxy configurado por el hosting. La guía general se encuentra en la raíz del repositorio.
