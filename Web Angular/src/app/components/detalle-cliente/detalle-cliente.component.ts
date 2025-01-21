import {Component, OnInit} from '@angular/core';
import {AutentificacionService} from "../../services/autentificacion.service";
import {InfoService} from "../../info.service";
import {ArticuloService} from "../../services/articulo.service";
import {Router} from "@angular/router";
import {Cliente} from "../../models/Cliente";
import {PedidoService} from "../../services/pedido.service";
import {Pedido} from "../../models/Pedido";

@Component({
  selector: 'app-detalle-cliente',
  templateUrl: './detalle-cliente.component.html',
  styleUrls: ['./detalle-cliente.component.css']
})
export class DetalleClienteComponent implements OnInit {

  pedidos: Pedido[] = [];
  total: number = 0;
  nombre: string = '';
  email: string = '';
  fecha: Date = new Date();
  cliente: Cliente = this.autentificacionService.ObtenerUsuario();
  pedido: Pedido = new Pedido();

  constructor(
    private pedidoService: PedidoService,
    private autentificacionService: AutentificacionService,
    private router: Router
  ) {
  }

  ngOnInit(): void {
    this.MostrarPedidos();
  }

  MostrarPedidos() {
    this.pedidoService.VerPedidos(this.cliente.email).subscribe((datos: any) => {
      this.pedidos = datos;
      console.log(this.pedidos);
    });
  }
}
