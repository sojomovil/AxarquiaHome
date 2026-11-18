import { TestBed } from '@angular/core/testing';
import { HomeComponent } from './features/home/home.component';

describe('HomeComponent', () => {
  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [HomeComponent],
    }).compileComponents();
  });

  it('renders the Axarquía Home landing page', async () => {
    const fixture = TestBed.createComponent(HomeComponent);
    fixture.detectChanges();

    expect(fixture.nativeElement.textContent).toContain('Axarquía');
    expect(fixture.nativeElement.textContent).toContain(
      'El portal inmobiliario inteligente de la Axarquía.',
    );
  });

  it('keeps the landscape caption if the video fails to load', () => {
    const fixture = TestBed.createComponent(HomeComponent);
    fixture.detectChanges();

    const page: HTMLElement = fixture.nativeElement;
    const video = page.querySelector('video');
    expect(video?.controls).toBe(true);
    video?.dispatchEvent(new Event('error'));
    fixture.detectChanges();

    expect(page.querySelector('video')).toBeNull();
    expect(page.querySelector('[role="status"]')?.textContent).toContain(
      'No se pudo cargar el vídeo',
    );
    expect(page.querySelector('figcaption')?.textContent).toMatch(/Un territorio.*para vivirlo/);
  });
});
