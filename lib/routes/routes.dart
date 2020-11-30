import 'package:flutter/widgets.dart';
import 'package:lise_v1/pages/casa_page.dart';
import 'package:lise_v1/pages/home_page.dart';
import 'package:lise_v1/pages/services_page.dart';

Map<String, WidgetBuilder> getRoutes(){
  return {
    "/"    :(BuildContext context)=>HomePage(),
    "services":(BuildContext context)=>ServicesPage(),
    "casas"    :(BuildContext context)=>CasaPage(),
  };
}