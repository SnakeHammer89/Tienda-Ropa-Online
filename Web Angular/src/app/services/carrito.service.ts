import {Injectable} from '@angular/core';
import {HttpClient, HttpParams} from "@angular/common/http";
import {environment} from "../../environments/environment";
import {Observable} from "rxjs";
import {formatNumber} from "@angular/common";
import {Carrito} from "../models/Carrito";

@Injectable({
  providedIn: 'root'
})
export class CarritoService {

  private baseUrl = environment.apiURL;

  constructor(private http: HttpClient) {
  }

  VerCarrito(id_Cliente: number): Observable<any> {
    const parametroId = new HttpParams().set('id_Cliente', id_Cliente);
    return this.http.get(`${this.baseUrl}Api/Carrito/VerCarrito`, {params: parametroId});
  }

  AgregarAlCarrito(parametros: {
    id_Articulo: number;
    id_Cliente: number;
    cantidad_Articulo: number
  }): Observable<any> {
    return this.http.post(`${this.baseUrl}Api/Carrito/InsertarAlCarrito`, parametros);
  }

  ModificarCantidadArticulo(parametros: { id_Articulo: number, cantidad_Articulo: number }): Observable<any> {
    return this.http.put(`${this.baseUrl}Api/Carrito/ModificarCantidadArticulo`, parametros);
  }

  EliminarDelCarrito(iD_Articulo: number): Observable<any> {
    const parametroId = new HttpParams().set('iD_Articulo', iD_Articulo);
    return this.http.delete(`${this.baseUrl}Api/Carrito/EliminarDelCarrito`, {params: parametroId});
  }

  FinalizarCarrito(iD_Cliente: number): Observable<any> {
    const parametroId = new HttpParams().set('iD_Cliente', iD_Cliente);
    return this.http.delete(`${this.baseUrl}Api/Carrito/FinalizarCarrito`, {params: parametroId});
  }
}

