import {Component, OnInit} from '@angular/core';
import {AutentificacionService} from "../../services/autentificacion.service";
import {Cliente} from "../../models/Cliente";

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.css']
})
export class HeaderComponent implements OnInit {
  usuario: Cliente = new Cliente(); // Usuario logueado

  constructor(private autentificacionService: AutentificacionService) {
  }

  ngOnInit() {
    // Escucha cambios en el estado del usuario
    this.autentificacionService.usuario$.subscribe((usuario) => {
      console.log("el header recoge: " + JSON.stringify(usuario));
      this.usuario = usuario;
    });
  }



  Desloguear() {
    this.autentificacionService.LimpiarUsuario(); // Limpia el estado
    alert('Sesión cerrada');
  }
}
