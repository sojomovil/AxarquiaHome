import { provideHttpClient } from '@angular/common/http';
import { HttpTestingController, provideHttpClientTesting } from '@angular/common/http/testing';
import { TestBed } from '@angular/core/testing';
import { environment } from '../../../environments/environment';
import { AgenciesComponent } from './agencies.component';

const endpoint = `${environment.apiBaseUrl}/api/agencies`;
const agency = {
  id: 8,
  name: 'Agencia de pruebas',
  taxIdentifier: null,
  email: null,
  phoneNumber: null,
  website: null,
  address: null,
  description: null,
  isActive: true,
};

function setup() {
  TestBed.configureTestingModule({
    imports: [AgenciesComponent],
    providers: [provideHttpClient(), provideHttpClientTesting()],
  });
  const fixture = TestBed.createComponent(AgenciesComponent);
  const http = TestBed.inject(HttpTestingController);
  const page: HTMLElement = fixture.nativeElement;
  const click = (name: string) => {
    const button = [...page.querySelectorAll('button')].find(
      (item) => (item.getAttribute('aria-label') ?? item.textContent.trim()) === name,
    );
    if (!button) throw new Error(`Botón no encontrado: ${name}`);
    button.click();
    fixture.detectChanges();
  };
  http.expectOne({ method: 'GET', url: endpoint }).flush([agency]);
  fixture.detectChanges();
  return { fixture, http, page, click };
}

describe('Agencias', () => {
  afterEach(() => TestBed.inject(HttpTestingController).verify());

  it('muestra la ficha de solo lectura y permite cerrarla sin enviar cambios', () => {
    const { click, page } = setup();
    click(`Ver ${agency.name}`);
    expect(page.querySelector('#agency-details-title')?.textContent).toBe(agency.name);
    expect(page.querySelector('dl')?.textContent).toContain('Activa');
    expect(page.querySelector('form')).toBeNull();
    click('Cerrar');
    expect(page.querySelector('#agency-details-title')).toBeNull();
  });

  it('edita una agencia y refresca el directorio con los datos guardados', () => {
    const { click, fixture, http, page } = setup();
    click(`Editar ${agency.name}`);
    const input = page.querySelector<HTMLInputElement>('input[formControlName="name"]')!;
    expect(input.value).toBe(agency.name);
    input.value = 'Nombre actualizado';
    input.dispatchEvent(new Event('input'));
    click('Guardar');
    const update = http.expectOne({ method: 'PUT', url: `${endpoint}/${agency.id}` });
    expect(update.request.body.name).toBe('Nombre actualizado');
    const updated = { ...agency, name: 'Nombre actualizado' };
    update.flush(updated);
    http.expectOne({ method: 'GET', url: endpoint }).flush([updated]);
    fixture.detectChanges();
    expect(page.querySelector('tbody')?.textContent).toContain(updated.name);
  });

  it('pide confirmación al borrar y conserva la agencia si tiene inmuebles asociados', () => {
    const { click, fixture, http, page } = setup();
    click(`Eliminar ${agency.name}`);
    http.expectNone({ method: 'DELETE', url: `${endpoint}/${agency.id}` });
    click('Confirmar eliminación');
    http
      .expectOne({ method: 'DELETE', url: `${endpoint}/${agency.id}` })
      .flush({}, { status: 409, statusText: 'Conflict' });
    fixture.detectChanges();
    expect(page.querySelector('[role="alert"]')?.textContent).toContain('inmuebles asociados');
    expect(page.querySelector('tbody')?.textContent).toContain(agency.name);
  });
});
