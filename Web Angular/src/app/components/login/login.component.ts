import {Component, EventEmitter, Input, Output} from '@angular/core';
import {Cliente} from "../../models/Cliente";
import {ClienteService} from "../../services/cliente.service";
import {Router} from "@angular/router";
import {AutentificacionService} from "../../services/autentificacion.service";

@Component({
    selector: 'app-login',
    templateUrl: './login.component.html',
    styleUrls: ['./login.component.css']
})
export class LoginComponent {


    //@Output() registrarCliente = new EventEmitter;


    iD_Cliente: number = 0;
    emailIntroducido: string = "";
    contraseniaIntroducida: string = "";
    nombreIntroducido: string = "";
    apellidosIntroducido: string = "";
    telefonoIntroducido: string = "";
    direccionEnvioIntroducido: string = "";
    clienteLogueado: Cliente = new Cliente();

    constructor(private autentificacionService: AutentificacionService, private clienteService: ClienteService, private router: Router) {
    }

    RegistrarCliente() {
        const parametros = {
            email: this.emailIntroducido,
            contrasenia: this.contraseniaIntroducida,
            nombre: this.nombreIntroducido,
            apellidos: this.apellidosIntroducido,
            telefono: this.telefonoIntroducido,
            direccion_Envio: this.direccionEnvioIntroducido
        };
        console.log(parametros);

        this.clienteService.InsertarUsuario(parametros).subscribe((datos: any) => {
            console.log(datos);
            alert('Cliente registrado correctamente');
            this.router.navigate(['/']);
        });
    }

    LoguearUsuario(): void {
        const parametros = {
            email: this.emailIntroducido,
            contrasenia: this.contraseniaIntroducida
        };
        console.log(parametros);

        this.clienteService.VerificarUsuario(parametros).subscribe((datos: any) => {
            if (datos && datos.length > 0) {
                console.log('los datos recogidos son: ' + JSON.stringify(datos));
                alert('Cliente logueado correctamente');
                this.clienteLogueado = datos[0];
                console.log("El usuario logueado es: " + JSON.stringify(this.clienteLogueado));
                this.autentificacionService.EstablecerUsuario(this.clienteLogueado);
                this.router.navigate(['/']);
                return
            }
            alert("Creedenciales erroneas o usuario no encontrado")
        })
    }
}
