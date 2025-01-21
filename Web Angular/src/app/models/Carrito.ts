import {Articulo} from "./Articulo";

export class Carrito {
  iD_Carrito: number = 0;
  iD_Cliente: number = 0;
  iD_Articulo: number = 0;
  cantidad_Articulo: number = 0;
  precio_Articulo: number = 0;
  Categoria: string = "";
  Modelo: string = "";
  Url_Imagen: string = "";
  articulo?: Articulo;
}
