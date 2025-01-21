import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from '../../environments/environment';

// Interfaces opcionales para tipar las respuestas
import { Product } from '../models/product'; // Ejemplo de modelo. Crea más según necesidad.

@Injectable({
  providedIn: 'root',
})
export class ApiService {
  private baseUrl = environment.apiURL;

  constructor(private http: HttpClient) {}

  // ------------------------------
  // Métodos para Artículos
  // ------------------------------
  mostrarArticuloPorId(id: number): Observable<any> {
    return this.http.get(`${this.baseUrl}/Api/Articulos/MostrarArticulosPorID`);
  }

  buscarArticulo(query: string): Observable<any> {
    return this.http.get(`${this.baseUrl}/Api/Articulos/BuscarArticulo?query=${query}`);
  }

  buscarArticulosPorCategoria(categoria: string): Observable<any> {
    return this.http.get(`${this.baseUrl}/Api/Articulos/BuscarArticulosPorCategoria?categoria=${categoria}`);
  }

  buscarArticulosPorColor(color: string): Observable<any> {
    return this.http.get(`${this.baseUrl}/Api/Articulos/BuscarArticulosPorColor?color=${color}`);
  }

  buscarArticulosPorTalla(talla: string): Observable<any> {
    return this.http.get(`${this.baseUrl}/Api/Articulos/BuscarArticulosPorTalla?talla=${talla}`);
  }

  buscarArticulosPorModelo(modelo: string): Observable<any> {
    return this.http.get(`${this.baseUrl}/Api/Articulos/BuscarArticulosPorModelo?modelo=${modelo}`);
  }

  insertarArticulo(articulo: any): Observable<any> {
    return this.http.post(`${this.baseUrl}/Api/Articulos/InsertarArticulo`, articulo);
  }

  modificarStock(id: number, cantidad: number): Observable<any> {
    return this.http.put(`${this.baseUrl}/Api/Articulos/ModificarStock`, { id, cantidad });
  }

  eliminarArticulo(id: number): Observable<any> {
    return this.http.delete(`${this.baseUrl}/Api/Articulos/EliminarArticulo?id=${id}`);
  }

  // ------------------------------
  // Métodos para Carrito
  // ------------------------------
  insertarAlCarrito(carrito: any): Observable<any> {
    return this.http.post(`${this.baseUrl}/Api/Carrito/InsertarAlCarrito`, carrito);
  }

  modificarCantidadArticulo(id: number, cantidad: number): Observable<any> {
    return this.http.put(`${this.baseUrl}/Api/Carrito/ModificarCantidadArticulo`, { id, cantidad });
  }

  finalizarCarrito(carrito: any): Observable<any> {
    return this.http.post(`${this.baseUrl}/Api/Carrito/FinalizarCarrito`, carrito);
  }

  // ------------------------------
  // Métodos para Clientes
  // ------------------------------
  mostrarClientes(): Observable<any> {
    return this.http.get(`${this.baseUrl}Api/Clientes/MostrarClientes`);
  }

  buscarCliente(query: string): Observable<any> {
    return this.http.get(`${this.baseUrl}Api/Clientes/BuscarCliente?query=${query}`);
  }

  insertarCliente(cliente: any): Observable<any> {
    return this.http.post(`${this.baseUrl}Api/Clientes/InsertarCliente`, cliente);
  }

  modificarCliente(id: number, cliente: any): Observable<any> {
    return this.http.put(`${this.baseUrl}Api/Clientes/ModificarCliente`, { id, ...cliente });
  }

  eliminarCliente(id: number): Observable<any> {
    return this.http.delete(`${this.baseUrl}Api/Clientes/EliminarCliente?id=${id}`);
  }

  // ------------------------------
  // Métodos para Pedidos
  // ------------------------------
  mostrarPedidos(): Observable<any> {
    return this.http.get(`${this.baseUrl}/Api/Pedidos/MostrarPedidos`);
  }

  mostrarDetallesPedido(id: number): Observable<any> {
    return this.http.get(`${this.baseUrl}/Api/Pedidos/MostrarDetallesPedido?id=${id}`);
  }
}
