import {Component, OnInit} from '@angular/core';
import {Articulo} from "../../models/Articulo";
import {CarritoService} from "../../services/carrito.service";
import {InfoService} from "../../info.service";
import {Router} from "@angular/router";
import {Cliente} from "../../models/Cliente";
import {AutentificacionService} from "../../services/autentificacion.service";
import {Carrito} from "../../models/Carrito";
import {Observable} from "rxjs";
import {ArticuloService} from "../../services/articulo.service";

@Component({
  selector: 'app-cesta',
  templateUrl: './cesta.component.html',
  styleUrls: ['./cesta.component.css']
})
export class CestaComponent implements OnInit {

  carrito: Carrito[] = [];
  listaCarrito: Articulo[] = [];
  total: number = 0;
  nombre: string = '';
  cliente: Cliente = this.autentificacionService.ObtenerUsuario();


  constructor(
    private carritoService: CarritoService,
    private autentificacionService: AutentificacionService,
    private infoService: InfoService,
    private articuloService: ArticuloService,
    private router: Router
  ) {
  }

  ngOnInit(): void {
    this.MostrarCarrito();
  }

  MostrarCarrito() {
    this.carritoService.VerCarrito(this.cliente.iD_Cliente).subscribe((datos: any[]) => {
      this.carrito = datos;
      console.log(this.carrito);
      this.total = 0;
      for (var item of this.carrito) {
        this.total += item.precio_Articulo * item.cantidad_Articulo;
        this.articuloService.MostrarArticulosPorID(item.iD_Articulo).subscribe((articulo) => {
          item.articulo = articulo;
        })
      }
      this.total = parseFloat(this.total.toFixed(2));
    })
  }

  CambiarCantidad() {
    this.total = 0;
    for (var item of this.carrito) {
      if (item.cantidad_Articulo == 0) {
        this.carritoService.EliminarDelCarrito(item.iD_Articulo).subscribe((datos) => {
          console.log(datos);
        })
        alert('¡Eliminado del carrito!');
      } else {
        const parametros = {
          id_Articulo: item.iD_Articulo,
          cantidad_Articulo: item.cantidad_Articulo
        }
        this.carritoService.ModificarCantidadArticulo(parametros).subscribe((datos) => {
          console.log(datos);
        })
        this.total += item.precio_Articulo * item.cantidad_Articulo;
      }
    }
    this.total = parseFloat(this.total.toFixed(2));
  }

  FinalizarCarrito() {
    console.log(this.cliente.iD_Cliente);
    this.carritoService.FinalizarCarrito(this.cliente.iD_Cliente).subscribe((datos: any) => {
      console.log(datos);
    })
    this.infoService.total = this.total;
    this.infoService.nombre = this.cliente.nombre;
    this.router.navigate(['/confirmacion'])
  }
}
