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
});
