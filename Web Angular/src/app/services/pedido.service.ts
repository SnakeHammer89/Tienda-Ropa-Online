import {Injectable} from '@angular/core';
import {Observable} from "rxjs";
import {HttpClient, HttpParams} from "@angular/common/http";
import {environment} from "../../environments/environment";

@Injectable({
  providedIn: 'root'
})

export class PedidoService {

  private baseUrl = environment.apiURL;

  constructor(private http: HttpClient) {
  }

  VerPedidos(email: string): Observable<any> {
    const parametroId = new HttpParams().set('email', email);
    return this.http.get(`${this.baseUrl}Api/Pedidos/MostrarPedidos`, {params: parametroId});
  }

  VerDetallesPedido(email: string): Observable<any> {
    const parametroId = new HttpParams().set('email', email);
    return this.http.get(`${this.baseUrl}Api/Pedidos/MostrarDetallesPedido`, {params: parametroId});
  }

}


