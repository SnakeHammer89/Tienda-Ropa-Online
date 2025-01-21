import {Component} from '@angular/core';
import {Articulo} from "../../models/Articulo";
import {ActivatedRoute} from "@angular/router";
import {ArticuloService} from '../../services/articulo.service';
import {CarritoService} from "../../services/carrito.service";
import {AutentificacionService} from "../../services/autentificacion.service";
import {Cliente} from "../../models/Cliente";

@Component({
  selector: 'app-detalle-articulo',
  templateUrl: './detalle-articulo.component.html',
  styleUrls: ['./detalle-articulo.component.css']
})
export class DetalleArticuloComponent {

  articuloCategoria: string | null = "";
  articulo: Articulo = new Articulo();
  cantidad_Articulo: number = 1;
  cliente: Cliente = this.autentificacionService.ObtenerUsuario()

  constructor(
    private route: ActivatedRoute,
    private articuloService: ArticuloService,
    private carritoService: CarritoService,
    private autentificacionService: AutentificacionService,
  ) {
  }

  ngOnInit(): void {
    this.MostrarDetalleArticulo();
  }

  MostrarDetalleArticulo() {
    this.articuloCategoria = this.route.snapshot.paramMap.get('articulo');

    if (this.articuloCategoria) {

      const [categoria, modelo, color, talla] = this.articuloCategoria.split('-');

      this.articuloService.MostrarArticulos().subscribe(datos => {
        for (let a of datos) {
          if (a.categoria === categoria && a.modelo === modelo && a.color === color && a.talla === talla) {
            this.articulo = a;
            break;
          }
        }
      });
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
