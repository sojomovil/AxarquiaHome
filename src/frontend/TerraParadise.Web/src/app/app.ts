import { Component } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { SiteLayoutComponent } from './shared/layout/site-layout.component';

@Component({
  imports: [RouterOutlet, SiteLayoutComponent],
  selector: 'app-root',
  templateUrl: './app.html',
})
export class App {}
