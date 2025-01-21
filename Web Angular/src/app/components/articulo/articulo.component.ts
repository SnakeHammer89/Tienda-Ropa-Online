import {Component, EventEmitter, Input, OnInit, Output} from '@angular/core';
import {Articulo} from "../../models/Articulo";
import {CarritoService} from "../../services/carrito.service";
import {Cliente} from "../../models/Cliente";
import {AutentificacionService} from "../../services/autentificacion.service";
import {error} from "@angular/compiler-cli/src/transformers/util";


@Component({
  selector: 'app-articulo',
  templateUrl: './articulo.component.html',
  styleUrls: ['./articulo.component.css']
})
export class ArticuloComponent {

  cantidad_Articulo: number = 1;
  cliente: Cliente = this.autentificacionService.ObtenerUsuario();
  @Input() articulo: Articulo;
  @Output() agregar = new EventEmitter;

  constructor(private carritoService: CarritoService, private autentificacionService: AutentificacionService) {
    this.articulo = {
      iD_Articulo: 0,
      categoria: "",
      color: "",
      talla: "",
      modelo: "",
      precio: 0.0,
      stock: 0,
      cantidad: 0,
      url_Imagen: ""
    }
  }

  AlCarrito(articulo: Articulo): void {
    articulo.cantidad = this.cantidad_Articulo;
    const parametros = {
      id_Articulo: articulo.iD_Articulo,
      id_Cliente: this.cliente.iD_Cliente,
      cantidad_Articulo: this.cantidad_Articulo
    };
    this.carritoService.AgregarAlCarrito(parametros).subscribe((datos) => {
      console.log(datos);
    });
    alert('Agregado al carrito!');
    console.log(parametros);
  }

}
