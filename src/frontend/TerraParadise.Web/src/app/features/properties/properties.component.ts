import { Component, DestroyRef, inject, signal } from '@angular/core';
import { takeUntilDestroyed } from '@angular/core/rxjs-interop';
import { finalize } from 'rxjs';
import { ApiService } from '../../core/services/api.service';

interface PropertyListItem {
  id: number;
  title: string;
  price: number;
  currencyCode: string;
  propertyType: string;
  municipality: string;
  locality: string | null;
  bedrooms: number | null;
  bathrooms: number | null;
  builtAreaM2: number | null;
  isFeatured: boolean;
}

const endpoint = '/api/properties';

@Component({
  selector: 'app-properties',
  templateUrl: './properties.component.html',
  styleUrl: './properties.component.scss',
})
export class PropertiesComponent {
  private readonly api = inject(ApiService);
  private readonly destroyRef = inject(DestroyRef);

  protected readonly properties = signal<PropertyListItem[]>([]);
  protected readonly loading = signal(false);
  protected readonly listError = signal('');

  constructor() {
    this.load();
  }

  protected load(): void {
    this.loading.set(true);
    this.listError.set('');

    this.api
      .get<PropertyListItem[]>(endpoint)
      .pipe(
        takeUntilDestroyed(this.destroyRef),
        finalize(() => this.loading.set(false)),
      )
      .subscribe({
        next: (properties) => this.properties.set(properties),
        error: () => this.listError.set('No se pudieron cargar las propiedades en venta.'),
      });
  }

  protected formatPrice(property: PropertyListItem): string {
    return new Intl.NumberFormat('es-ES', {
      style: 'currency',
      currency: property.currencyCode,
      maximumFractionDigits: 0,
    }).format(property.price);
  }
}
