import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { CartComponent } from './components/cart/cart.component';
import { CestaComponent } from './components/cesta/cesta.component';
import { ConfirmacionComponent } from './components/confirmacion/confirmacion.component';
import { ConfirmationComponent } from './components/confirmation/confirmation.component';
import { LoginComponent } from './components/login/login.component';
import { ProductItemDetailComponent } from './components/product-item-detail/product-item-detail.component';
import { ProductListComponent } from './components/product-list/product-list.component';
import {ListaArticulosComponent} from "./components/lista-articulos/lista-articulos.component";
import {DetalleArticuloComponent} from "./components/detalle-articulo/detalle-articulo.component";
import {ErrorComponent} from "./components/error/error.component";
import {DetalleClienteComponent} from "./components/detalle-cliente/detalle-cliente.component";
import {InformacionPedidoComponent} from "./components/informacion-pedido/informacion-pedido.component";

const routes: Routes = [
  {path: 'login', component: LoginComponent},
  {path: '', component: ListaArticulosComponent },
  { path: 'informacion-pedido/:id', component: InformacionPedidoComponent },
  {path: 'cesta', component: CestaComponent},
  {path: 'detalle-cliente', component: DetalleClienteComponent},
  {path: 'confirmacion', component: ConfirmacionComponent},
  {path: ':articulo', component: DetalleArticuloComponent }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
