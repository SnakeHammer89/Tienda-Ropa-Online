import {Component} from '@angular/core';
import {Articulo} from "../../models/Articulo";
import {ArticuloService} from "../../services/articulo.service";
import {Observable} from "rxjs";

@Component({
  selector: 'app-lista-articulos',
  templateUrl: './lista-articulos.component.html',
  styleUrls: ['./lista-articulos.component.css']
})
export class ListaArticulosComponent {

  articulos: Articulo[] = [];
  articulosPaginados: Articulo[] = [];
  paginaActual: number = 1;
  tamanoPaginado: number = 8;
  articulo: Articulo = new Articulo();

  categorias: string[] = ['Pantalon', 'Camiseta', 'Sudadera', 'Vestido','Pantalon Corto', 'Chaqueta', 'Falda', 'Blusa', 'Jeans', 'Chaleco'];
  categoriaSeleccionada: string = '';
  modelos: string[] = ['Slim', 'Basica', 'Con capucha', 'Formal', 'Deportivo', 'Invierno', 'Corto', 'Casual', 'Recto', 'Cool', 'Largo', 'Elegante', 'Skinny'];
  modeloSeleccionado: string = '';
  colores: string[] = ['Azul', 'Blanco', 'Negro', 'Rojo', 'Verde', 'Gris', 'Marron', 'Amarillo', 'Naranja', 'Rosa'];
  colorSeleccionado: string = '';
  tallas: string[] = ['XS', 'S', 'M', 'L', 'XL', 'XXL'];
  tallaSeleccionada: string = '';

  constructor(private articuloService: ArticuloService) {
  }


  ngOnInit(): void {
    this.MostrarArticulosId();

  }

  MostrarArticulosId() {
    this.articuloService.MostrarArticulos().subscribe((datos: []) => {
      this.articulos = this.MezclarArticulos(datos);
      console.log(this.articulos);
      this.CambiarPagina(1);
    });
  }

  FiltrarArticulosCategoria(){
    this.articuloService.BuscarArticulosPorCategoria(this.categoriaSeleccionada).subscribe((datos:[])=>{
      this.articulos = this.MezclarArticulos(datos);
      console.log(this.articulos);
      this.CambiarPagina(1);
    });
  }
  FiltrarArticulosModelo(){
    this.articuloService.BuscarArticulosPorModelo(this.modeloSeleccionado).subscribe((datos:[])=>{
      this.articulos = this.MezclarArticulos(datos);
      console.log(this.articulos);
      this.CambiarPagina(1);
    });
  }
  FiltrarArticulosColor(){
    this.articuloService.BuscarArticulosPorColor(this.colorSeleccionado).subscribe((datos:[])=>{
      this.articulos = this.MezclarArticulos(datos);
      console.log(this.articulos);
      this.CambiarPagina(1);
    });
  }
  FiltrarArticulosTalla(){
    this.articuloService.BuscarArticulosPorTalla(this.tallaSeleccionada).subscribe((datos:[])=>{
      this.articulos = this.MezclarArticulos(datos);
      console.log(this.articulos);
      this.CambiarPagina(1);
    });
  }

  BuscarArticulo(){

    const parametros: { categoria?: string; color?: string; talla?: string; modelo?: string } = {};
    if (this.categoriaSeleccionada) parametros.categoria = this.categoriaSeleccionada;
    if (this.colorSeleccionado) parametros.color = this.colorSeleccionado;
    if (this.tallaSeleccionada) parametros.talla = this.tallaSeleccionada;
    if (this.modeloSeleccionado) parametros.modelo = this.modeloSeleccionado;

    this.articuloService.BuscarArticulo(parametros).subscribe((datos: [])=>{
      this.articulos = datos;
      console.log(this.articulos);
      this.CambiarPagina(1);
    });
  }

  Agregar(): void {
    alert('Agregado al carrito!');
  }

  MezclarArticulos(lista: Articulo[]): Articulo[] {
    return lista.sort(() => Math.random() - 0.5);
  }

  CambiarPagina(numeroPagina: number): void {
    this.paginaActual = numeroPagina;
    const inicio = (numeroPagina - 1) * this.tamanoPaginado;
    const fin = inicio + this.tamanoPaginado;
    this.articulosPaginados = this.articulos.slice(inicio, fin);
  }

  ObtenerPaginas(): number[] {
    const totalPaginas = Math.ceil(this.articulos.length / this.tamanoPaginado);
    return Array.from({length: totalPaginas}, (_, i) => i + 1);
  }
}
