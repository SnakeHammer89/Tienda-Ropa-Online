import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class InfoService {
  nombre: string = '';
  total: number = 0;
}
