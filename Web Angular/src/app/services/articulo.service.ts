import {Injectable} from '@angular/core';
import {Observable} from "rxjs";
import {HttpClient, HttpParams} from "@angular/common/http";
import {environment} from "../../environments/environment";


@Injectable({
  providedIn: 'root'
})
export class ArticuloService {

  private baseUrl = environment.apiURL;

  constructor(private http: HttpClient) {
  }

  MostrarArticulos(): Observable<any> {
    return this.http.get(`${this.baseUrl}Api/Articulos/MostrarArticulos`);
  }

  MostrarArticulosPorID(idArticulo: number): Observable<any> {
    const parametroId = new HttpParams().set("id_Articulo", idArticulo);
    return this.http.get(`${this.baseUrl}Api/Articulos/MostrarArticulosPorID`, {params: parametroId});
  }

  BuscarArticulosPorCategoria(categoria: string): Observable<any> {
    const parametroCategoria = new HttpParams().set('categoria', categoria);
    return this.http.get(`${this.baseUrl}Api/Articulos/BuscarArticulosPorCategoria`, {params: parametroCategoria});
  }

  BuscarArticulosPorColor(color: string): Observable<any> {
    const parametroColor = new HttpParams().set('color', color);
    return this.http.get(`${this.baseUrl}Api/Articulos/BuscarArticulosPorColor`, {params: parametroColor});
  }

  BuscarArticulosPorTalla(talla: string): Observable<any> {
    const parametroTalla = new HttpParams().set('talla', talla);
    return this.http.get(`${this.baseUrl}Api/Articulos/BuscarArticulosPorTalla`, {params: parametroTalla});
  }

  BuscarArticulosPorModelo(modelo: string): Observable<any> {
    const parametroModelo = new HttpParams().set('modelo', modelo);
    return this.http.get(`${this.baseUrl}Api/Articulos/BuscarArticulosPorModelo`, {params: parametroModelo});
  }

  BuscarArticulo(parametros: {categoria?: string; color?: string; talla?: string; modelo?: string}): Observable<any> {
    let parametro = new HttpParams()
    if (parametros.categoria) parametro = parametro.set('categoria', parametros.categoria);
    if (parametros.color) parametro = parametro.set('color', parametros.color);
    if (parametros.talla) parametro = parametro.set('talla', parametros.talla);
    if (parametros.modelo) parametro = parametro.set('modelo', parametros.modelo);
    return this.http.get(`${this.baseUrl}Api/Articulos/BuscarArticulo`, {params: parametro});
  }
}
