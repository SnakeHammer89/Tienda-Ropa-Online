import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { HttpClientModule } from '@angular/common/http';
import { FormsModule } from '@angular/forms';
import { FlexLayoutModule } from '@angular/flex-layout';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { HeaderComponent } from './layout/header/header.component';
import { FooterComponent } from './layout/footer/footer.component';
import { ProductListComponent } from './components/product-list/product-list.component';
import { ProductItemComponent } from './components/product-item/product-item.component';
import { ProductItemDetailComponent } from './components/product-item-detail/product-item-detail.component';
import { CartComponent } from './components/cart/cart.component';
import { ConfirmationComponent } from './components/confirmation/confirmation.component';
import { ArticuloComponent } from './components/articulo/articulo.component';
import { ListaArticulosComponent } from './components/lista-articulos/lista-articulos.component';
import { DetalleArticuloComponent } from './components/detalle-articulo/detalle-articulo.component';
import { ConfirmacionComponent } from './components/confirmacion/confirmacion.component';
import { CestaComponent } from './components/cesta/cesta.component';
import { LoginComponent } from './components/login/login.component';
import {ClienteService} from "./services/cliente.service";
import { DetalleClienteComponent } from './components/detalle-cliente/detalle-cliente.component';
import { InformacionPedidoComponent } from './components/informacion-pedido/informacion-pedido.component';


@NgModule({
  declarations: [
    AppComponent,
    HeaderComponent,
    FooterComponent,
    ProductListComponent,
    ProductItemComponent,
    ProductItemDetailComponent,
    CartComponent,
    ConfirmationComponent,
    ArticuloComponent,
    ListaArticulosComponent,
    DetalleArticuloComponent,
    ConfirmacionComponent,
    CestaComponent,
    LoginComponent,
    DetalleClienteComponent,
    InformacionPedidoComponent,
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    FormsModule,
    FlexLayoutModule
  ],
  providers: [ClienteService],
  bootstrap: [AppComponent]
})
export class AppModule { }
