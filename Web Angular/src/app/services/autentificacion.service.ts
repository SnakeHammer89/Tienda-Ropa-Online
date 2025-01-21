import { Injectable } from '@angular/core';
import {BehaviorSubject} from "rxjs";
import {Cliente} from "../models/Cliente";

@Injectable({
  providedIn: 'root'
})
export class AutentificacionService {
  // Maneja el estado del usuario logueado
  private userSubject = new BehaviorSubject<any>(null);
  // Observable para escuchar cambios
  public usuario$ = this.userSubject.asObservable();

  constructor() {}

  EstablecerUsuario(usuario: any) {
    console.log("Estableciendo usuario: " + usuario);
    this.userSubject.next(usuario);
  }

  ObtenerUsuario() {
    console.log("ObtenerUsuario: " + JSON.stringify(this.userSubject.value));
    return this.userSubject.value;
  }

  LimpiarUsuario() {
    this.userSubject.next(null);
  }
}
