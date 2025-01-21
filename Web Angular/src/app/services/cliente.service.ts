import {Injectable} from '@angular/core';
import {environment} from "../../environments/environment";
import {HttpClient, HttpParams} from "@angular/common/http";
import {Observable} from "rxjs";

@Injectable({
  providedIn: 'root'
})
export class ClienteService {

  private baseUrl = environment.apiURL;

  constructor(private http: HttpClient) {
  }

  InsertarUsuario(parametros: {email: string, contrasenia: string, nombre: string, apellidos: string, telefono: string, direccion_Envio: string}): Observable<any> {
    return this.http.post(`${this.baseUrl}Api/Clientes/InsertarCliente`, parametros);
  }

  // InsertarUsuario(parametros: {email: string, contrasenia: string, nombre: string, apellidos: string, telefono: string, direccion_Envio: string}): Observable<any> {
  //   const parametro = new HttpParams()
  //     .set('email', parametros.email)
  //     .set('contraseña', parametros.contrasenia)
  //     .set('nombre', parametros.nombre)
  //     .set('apellidos', parametros.apellidos)
  //     .set('telefono', parametros.telefono)
  //     .set('direccion_Envio', parametros.direccion_Envio);
  //   return this.http.post(`${this.baseUrl}Api/Clientes/InsertarCliente`, {params: parametro});
  // }

  VerificarUsuario(parametros: {email: string, contrasenia: string}): Observable<any> {
    const parametro = new HttpParams()
      .set('email', parametros.email)
      .set('contrasenia', parametros.contrasenia)
    return this.http.get(`${this.baseUrl}Api/Clientes/VerificarCliente`, {params: parametro});
  }


  ModificarUsuario(parametros: {id: number, email: string, contrasenia: string, nombre: string, apellidos: string, telefono: string, direccion_envio: string}): Observable<any> {
    const parametro = new HttpParams()
      .set('id', parametros.id)
      .set('email', parametros.email || '')
      .set('contrasenia', parametros.contrasenia || '')
      .set('nombre', parametros.nombre || '')
      .set('apellidos', parametros.apellidos || '')
      .set('telefono', parametros.telefono || '')
      .set('direccionEnvio', parametros.direccion_envio || '');
    return this.http.put(`${this.baseUrl}Api/Clientes/ModificarCliente`, {params: parametro});
  }

  EliminarUsuario(id: number): Observable<any> {
    const parametro = new HttpParams().set('id', id);
    return this.http.post(`${this.baseUrl}Api/Clientes/InsertarCliente`, {params: parametro});
  }
}
