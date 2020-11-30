/*import 'dart:async';
import 'dart:math';


import 'package:flutter/material.dart';
import 'package:lise_v1/provider/menu_provider.dart';
import 'package:lise_v1/utils/icon_services.dart';


class ServicesPage extends StatefulWidget {
  @override
  _ServicesPageState createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  Color _colorBox1 = Color.fromRGBO(240, 94, 139, 1);
  Color _colorBox2 = Colors.white;
  Color _colorBox1Effect = Color.fromRGBO(242, 115, 153, 1);
  Color _colorBox2Effect = Color.fromRGBO(242, 242, 242, 1);
  final Map<int,bool> _desicion= {
    1: false,
    2: false,
    3: false,
    4: false,
  };

  _provider ()async {
    final provider = await menuProvider.cargarDatos();
    print(provider[1]);
  }
  @override
  Widget build(BuildContext context) {
    _provider();
    final Size _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      body: _body(_size, context),
    );
  }
  Widget _body(Size size, BuildContext context){
    return Column(
      children: [
        Container(
          height: size.height - 50.0,
          width:  size.width,
          decoration: BoxDecoration(
            //color: Color.fromRGBO(32, 30, 50, 1),
            gradient: LinearGradient(
                colors: [Color.fromRGBO(252, 202, 152, 1),Color.fromRGBO(246, 154, 171, 1),Color.fromRGBO(236, 130, 149, 1)],
                stops: [0.2,0.9,1],
                begin: Alignment.topLeft,
                end: Alignment.bottomLeft
            ),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: _servicesItems(size),
        ),
        Expanded(child: Center(
          child: Text("SERVICIOS LYSE",
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 30.0
            ),),
        )
        ),
      ],
    );
  }
  Widget _servicesItems(Size size){
    return SafeArea(
      child: Column(
        children: [
          _containerModel(context, size,1),
          _containerModel(context, size,2),
          _containerModel(context, size,3),
          _containerModel(context, size,4),
        ],
      ),
    );
  }
  Widget _containerModel(BuildContext context, Size size, int index){

    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(bottom: size.height * 0.02),
        height: size.height * 0.20,
        width: size.width * 0.45,
        decoration: BoxDecoration(
          //color: Color.fromRGBO(32, 30, 50, 1),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: _elementosItem(size, _setColor1(index), _setColor2(index)),
      ),
      onTap: (){
        _desicion[index] = true;
        Timer(Duration(milliseconds: 100), (){
          _desicion[index] = false;
          setState(() {});
        });
        setState(() {});
      },
    );
  }
  Widget _elementosItem(Size size, Color color1, Color color2){
    return Stack(
      children: [
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: color1,
                  borderRadius: BorderRadius.circular(20.0)
              ),
              height: size.height,
              width: size.width * 0.25,
              child: Row(
                children: [
                  Container(
                    height: size.height,
                    width: size.width * 0.15,
                    child: RotatedBox(
                        quarterTurns: -1,
                        child: Center(
                          child: Text("gfddsg", style: TextStyle(color: Colors.white),),
                        )
                    ),
                  ),
                ],
              ),
            ),
            Expanded(child: Container()),
          ],
        ),
        Row(
          children: [
            Expanded(child: Container()),
            Container(
              height: size.height,
              width: size.width * 0.30,
              decoration: BoxDecoration(
                  color: color2,
                  borderRadius: BorderRadius.circular(20.0)
              ),
            ),
          ],
        )
      ],
    );
  }
  Color _setColor1(int index){
    if (_desicion[index]){
      return _colorBox1Effect;
    }
    return _colorBox1;
  }
  Color _setColor2(int index){
    if (_desicion[index]){
      return _colorBox2Effect;
    }
    return _colorBox2;
  }
}
*/