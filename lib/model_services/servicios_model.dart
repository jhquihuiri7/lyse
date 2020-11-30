class Servicios{
  List<Servicio> servicios = [];
  Servicios.fromJsonList(List<dynamic> list){
    if (list.isNotEmpty){
      list.forEach((element) {
        final servicio = Servicio.fromJson(element);
        servicios.add(servicio);
      });
    }
  }
}
class Servicio {
  String ruta;
  String icon;
  String texto;
  bool tap;


  Servicio({
      this.ruta, 
      this.icon, 
      this.texto,
      this.tap});

  Servicio.fromJson(Map<String, dynamic> json) {
    ruta = json["ruta"];
    icon = json["icon"];
    texto = json["texto"];
    tap = json["tap"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["ruta"] = ruta;
    map["icon"] = icon;
    map["texto"] = texto;
    map["tap"] = tap;
    return map;
  }

}