

import 'package:flutter/cupertino.dart';

Map <String, String> _iconsServices = {
  "oficinas"    :"assets/icons_servicios/oficinas.png",
  "especial"    :"assets/icons_servicios/especial.png",
  "eventos"     :"assets/icons_servicios/eventos.png",
  "casas"       :"assets/icons_servicios/casas.png",
};
AssetImage getIconsServicios(String icon){
  return AssetImage(_iconsServices[icon]);
}
