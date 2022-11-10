import { Component } from '@angular/core';
import { FormGroup } from '@angular/forms';
import { Router } from '@angular/router';

import { AuthService } from '@app/auth/shared/services/auth.service';
import {HttpClient, HttpHeaders} from '@angular/common/http';


@Component({
  selector: 'app-login',
  templateUrl: './login.component.html'
})
export class LoginComponent {

  error: string;

  constructor(
    private authService: AuthService,
    private router: Router,
    private http: HttpClient
  ) {}

  async loginUser(event: FormGroup) {
    const { email, password } = event.value;

    try {
      await this.authService.loginUser(email, password);
      const headers = new HttpHeaders()
        .set('Content-Type' , 'application/json');

      const body = {
        email,
        password,
      };

      this.http.post<any>('http://localhost:3000/api/auth/login', body, { headers })
        .toPromise().then((data: any) => {
        localStorage.setItem('tokenAuth', data.token);
        this.router.navigate(['/']);
      });

    } catch (err) {
      this.error = err.message;
    }
  }


}
