import { Component } from '@angular/core';
import { RouterLink } from '@angular/router';
import { environment } from '../../../environments/environment';

@Component({
  selector: 'app-site-layout',
  imports: [RouterLink],
  templateUrl: './site-layout.component.html',
  styleUrl: './site-layout.component.scss',
})
export class SiteLayoutComponent {
  protected readonly showAgencies = !environment.production;
}
