import { Routes } from '@angular/router';
import { environment } from '../environments/environment';
import { HomeComponent } from './features/home/home.component';

export const routes: Routes = [
  { path: '', component: HomeComponent, title: 'Axarquía Home' },
  ...(environment.production
    ? []
    : [
        {
          path: 'agencias',
          title: 'Agencias | Axarquía Home',
          loadComponent: () =>
            import('./features/agencies/agencies.component').then(
              (module) => module.AgenciesComponent,
            ),
        },
        {
          path: 'propiedades',
          title: 'Propiedades en venta | Axarquía Home',
          loadComponent: () =>
            import('./features/properties/properties.component').then(
              (module) => module.PropertiesComponent,
            ),
        },
      ]),
  { path: '**', redirectTo: '' },
];
