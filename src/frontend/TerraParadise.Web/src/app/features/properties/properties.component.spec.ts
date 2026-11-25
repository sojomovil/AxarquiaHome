import { provideHttpClient } from '@angular/common/http';
import { HttpTestingController, provideHttpClientTesting } from '@angular/common/http/testing';
import { TestBed } from '@angular/core/testing';
import { environment } from '../../../environments/environment';
import { PropertiesComponent } from './properties.component';

const endpoint = `${environment.apiBaseUrl}/api/properties`;
const property = {
  id: 44,
  title: 'Ático con vistas al mar',
  price: 325000,
  currencyCode: 'EUR',
  propertyType: 'Ático',
  municipality: 'Torrox',
  locality: 'Torrox Costa',
  bedrooms: 2,
  bathrooms: 2,
  builtAreaM2: 95,
  isFeatured: true,
};

describe('Propiedades', () => {
  afterEach(() => TestBed.inject(HttpTestingController).verify());

  it('muestra el listado de propiedades en venta', () => {
    TestBed.configureTestingModule({
      imports: [PropertiesComponent],
      providers: [provideHttpClient(), provideHttpClientTesting()],
    });

    const fixture = TestBed.createComponent(PropertiesComponent);
    const http = TestBed.inject(HttpTestingController);

    http.expectOne({ method: 'GET', url: endpoint }).flush([property]);
    fixture.detectChanges();

    const page: HTMLElement = fixture.nativeElement;
    expect(page.querySelector('h1')?.textContent).toContain('Propiedades en venta');
    expect(page.textContent).toContain(property.title);
    expect(page.textContent).toContain('Destacada');
  });

  it('permite reintentar cuando falla la carga', () => {
    TestBed.configureTestingModule({
      imports: [PropertiesComponent],
      providers: [provideHttpClient(), provideHttpClientTesting()],
    });

    const fixture = TestBed.createComponent(PropertiesComponent);
    const http = TestBed.inject(HttpTestingController);
    const page: HTMLElement = fixture.nativeElement;

    http.expectOne({ method: 'GET', url: endpoint }).flush({}, { status: 500, statusText: 'Error' });
    fixture.detectChanges();

    const retry = [...page.querySelectorAll('button')].find(
      (button) => button.textContent?.trim() === 'Reintentar',
    );
    expect(retry).toBeTruthy();

    retry?.click();
    fixture.detectChanges();

    http.expectOne({ method: 'GET', url: endpoint }).flush([]);
    fixture.detectChanges();

    expect(page.textContent).toContain('No hay propiedades en venta publicadas.');
  });
});
