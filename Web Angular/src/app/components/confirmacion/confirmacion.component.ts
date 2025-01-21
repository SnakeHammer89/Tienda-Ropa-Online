import { Component } from '@angular/core';
import {InfoService} from "../../info.service";

@Component({
  selector: 'app-confirmacion',
  templateUrl: './confirmacion.component.html',
  styleUrls: ['./confirmacion.component.css']
})
export class ConfirmacionComponent {

  nombre: string = '';
  total: number = 0;

  constructor(private infoService: InfoService) {}

  ngOnInit(): void {
    this.nombre = this.infoService.nombre;
    this.total = this.infoService.total;
  }

}
