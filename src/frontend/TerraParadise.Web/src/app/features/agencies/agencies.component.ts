import { HttpErrorResponse } from '@angular/common/http';
import {
  afterNextRender,
  Component,
  DestroyRef,
  ElementRef,
  inject,
  Injector,
  signal,
  viewChild,
} from '@angular/core';
import { takeUntilDestroyed } from '@angular/core/rxjs-interop';
import { FormBuilder, ReactiveFormsModule, Validators } from '@angular/forms';
import { finalize } from 'rxjs';
import { ApiService } from '../../core/services/api.service';

interface Agency {
  id: number;
  name: string;
  taxIdentifier: string | null;
  email: string | null;
  phoneNumber: string | null;
  website: string | null;
  address: string | null;
  description: string | null;
  isActive: boolean;
}

const endpoint = '/api/agencies';

@Component({
  selector: 'app-agencies',
  imports: [ReactiveFormsModule],
  templateUrl: './agencies.component.html',
  styleUrl: './agencies.component.scss',
})
export class AgenciesComponent {
  private readonly api = inject(ApiService);
  private readonly injector = inject(Injector);
  private readonly destroyRef = inject(DestroyRef);
  private readonly actionFocus = viewChild<ElementRef<HTMLElement>>('actionFocus');

  protected readonly agencies = signal<Agency[]>([]);
  protected readonly loading = signal(false);
  protected readonly busy = signal(false);
  protected readonly listError = signal('');
  protected readonly actionError = signal('');
  protected readonly feedback = signal('');
  protected readonly editor = signal<'create' | Agency | null>(null);
  protected readonly deleting = signal<Agency | null>(null);
  protected readonly viewing = signal<Agency | null>(null);
  protected readonly form = inject(FormBuilder).nonNullable.group({
    name: ['', [Validators.required, Validators.pattern(/\S/), Validators.maxLength(180)]],
    taxIdentifier: ['', Validators.maxLength(30)],
    email: ['', [Validators.email, Validators.maxLength(256)]],
    phoneNumber: ['', Validators.maxLength(30)],
    website: ['', [Validators.pattern(/https?:\/\/\S+/i), Validators.maxLength(500)]],
    address: ['', Validators.maxLength(300)],
    description: ['', Validators.maxLength(2000)],
    isActive: true,
  });

  constructor() {
    this.load();
  }

  protected load(): void {
    this.loading.set(true);
    this.listError.set('');
    this.api
      .get<Agency[]>(endpoint)
      .pipe(
        takeUntilDestroyed(this.destroyRef),
        finalize(() => this.loading.set(false)),
      )
      .subscribe({
        next: (agencies) => this.agencies.set(agencies),
        error: () => this.listError.set('No se pudieron cargar las agencias.'),
      });
  }

  protected openEditor(agency: Agency | 'create'): void {
    this.clearAction();
    this.editor.set(agency);
    this.form.reset(
      agency === 'create'
        ? undefined
        : {
            name: agency.name,
            taxIdentifier: agency.taxIdentifier ?? '',
            email: agency.email ?? '',
            phoneNumber: agency.phoneNumber ?? '',
            website: agency.website ?? '',
            address: agency.address ?? '',
            description: agency.description ?? '',
            isActive: agency.isActive,
          },
    );
    this.focusAction();
  }

  protected openDetails(agency: Agency): void {
    this.clearAction();
    this.viewing.set(agency);
    this.focusAction();
  }

  protected save(): void {
    const editing = this.editor();
    if (!editing || this.busy()) return;
    this.form.markAllAsTouched();
    if (this.form.invalid) return;

    this.busy.set(true);
    this.actionError.set('');
    const value = this.form.getRawValue();
    const payload = {
      name: value.name.trim(),
      taxIdentifier: value.taxIdentifier.trim() || null,
      email: value.email.trim() || null,
      phoneNumber: value.phoneNumber.trim() || null,
      website: value.website.trim() || null,
      address: value.address.trim() || null,
      description: value.description.trim() || null,
      isActive: value.isActive,
    };
    const request =
      editing === 'create'
        ? this.api.post<Agency>(endpoint, payload)
        : this.api.put<Agency>(`${endpoint}/${editing.id}`, payload);

    request
      .pipe(
        takeUntilDestroyed(this.destroyRef),
        finalize(() => this.busy.set(false)),
      )
      .subscribe({
        next: () => {
          this.clearAction();
          this.feedback.set(editing === 'create' ? 'Agencia creada.' : 'Cambios guardados.');
          this.load();
        },
        error: (error: HttpErrorResponse) =>
          this.actionError.set(
            error.status === 404
              ? 'La agencia ya no existe.'
              : 'No se pudo guardar la agencia. Revisa los datos e inténtalo de nuevo.',
          ),
      });
  }

  protected requestDelete(agency: Agency): void {
    this.clearAction();
    this.deleting.set(agency);
    this.focusAction();
  }

  protected confirmDelete(): void {
    const agency = this.deleting();
    if (!agency || this.busy()) return;

    this.busy.set(true);
    this.actionError.set('');
    this.api
      .delete(`${endpoint}/${agency.id}`)
      .pipe(
        takeUntilDestroyed(this.destroyRef),
        finalize(() => this.busy.set(false)),
      )
      .subscribe({
        next: () => {
          this.clearAction();
          this.feedback.set('Agencia eliminada.');
          this.load();
        },
        error: (error: HttpErrorResponse) =>
          this.actionError.set(
            error.status === 409
              ? 'La agencia tiene inmuebles asociados. Puedes editarla y marcarla como inactiva.'
              : error.status === 404
                ? 'La agencia ya no existe.'
                : 'No se pudo eliminar la agencia.',
          ),
      });
  }

  protected clearAction(): void {
    this.editor.set(null);
    this.deleting.set(null);
    this.viewing.set(null);
    this.actionError.set('');
    this.feedback.set('');
  }

  private focusAction(): void {
    afterNextRender(() => this.actionFocus()?.nativeElement.focus(), { injector: this.injector });
  }
}
