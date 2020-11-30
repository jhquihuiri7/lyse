

import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:lise_v1/model_services/servicios_model.dart';

class MenuProvider{
  MenuProvider(){}
  List<Servicio> opciones = [];
  Future <List<Servicio>>cargarDatos() async{
    final resp = await rootBundle.loadString("data/menu_opts.json");
    Map opc = json.decode(resp);
    final servicios = Servicios.fromJsonList(opc["rutas"]);
    return servicios.servicios;
  }
}
