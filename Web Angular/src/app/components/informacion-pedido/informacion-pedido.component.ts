import {Component, OnInit} from '@angular/core';
import {AutentificacionService} from "../../services/autentificacion.service";
import {PedidoService} from "../../services/pedido.service";
import {Router} from "@angular/router";
import {Pedido} from "../../models/Pedido";
import {Cliente} from "../../models/Cliente";
import {DetallePedido} from "../../models/DetallePedido";
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-informacion-pedido',
  templateUrl: './informacion-pedido.component.html',
  styleUrls: ['./informacion-pedido.component.css']
})

export class InformacionPedidoComponent implements OnInit {

  detallesPedidos: DetallePedido [] = [];
  email: string = '';
  detallePedido: DetallePedido = new DetallePedido();
  cliente: Cliente = this.autentificacionService.ObtenerUsuario();

  constructor(
    private pedidoService: PedidoService,
    private autentificacionService: AutentificacionService,
    private router: Router
  ) {
  }

  ngOnInit(): void {
    this.MostrarDetallesPedido();
  }

  volverALista(): void {
    this.router.navigate(['/detalle-cliente']);
  }

  MostrarDetallesPedido(): void {
    const email = this.autentificacionService.ObtenerUsuario().email;
    this.pedidoService.VerDetallesPedido(this.cliente.email).subscribe((datos: any) => {
        this.detallesPedidos = datos;
        console.log(this.detallesPedidos);
      });
  }
}





