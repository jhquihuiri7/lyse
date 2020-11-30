import 'dart:async';
import 'package:flutter/material.dart';

import 'package:lise_v1/model_services/servicios_model.dart';
import 'package:lise_v1/provider/menu_provider.dart';

class ServicesPage extends StatefulWidget {
  @override
  _ServicesPageState createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {

  //Set of colors for services items and on tap color effect
  Color _colorBox1 = Color.fromRGBO(240, 94, 139, 1);
  Color _colorBox2 = Colors.white;
  Color _colorBox1Effect = Color.fromRGBO(242, 115, 153, 1);
  Color _colorBox2Effect = Color.fromRGBO(242, 242, 242, 1);

  //Set of values for services items size and margin between them
  //Values change on portrait and landscape screen
  double _itemH = 0;
  double _itemW = 0;
  double _itemMBotton = 0;
  double _itemMRight = 0;


  @override
  Widget build(BuildContext context) {
    //Size for responsive screen elements in whole page
    final Size _size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),//Background in white, "SERVICIOS LYSE" text
      body: _body(_size, context),//_body which contains main Column with main Container and main Text
    );
  }

  //_body contains main Column with two children
  //Container with linear gradient, its child has each service item
  //Expanded with SERVICIOS LYSE text
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
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.0), bottomRight: Radius.circular(20.0)),
          ),
          child: _servicesItems(size),//_servicesItems receive size, and set item properties
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

  //_serviciosItems build items info with a Future Builder
  //Future builder receive a menuProvider instance which call "cargarDatos" method
  //Future evaluate if null => CircularProgressIndicator
  //Future if not null evaluate screen orientation to set height, width and margin values
  Widget _servicesItems(Size size){
    final menuProvider = new MenuProvider().cargarDatos();
    return SafeArea(
      child: FutureBuilder(
        future: menuProvider,
        builder: (BuildContext context, AsyncSnapshot<List<Servicio>> snapshot){
          final List<Widget> list = [];
          final data = snapshot.data;
          if (data== null){
            return Center(child: CircularProgressIndicator(),);
          }

          return OrientationBuilder(
            builder: (BuildContext context, Orientation orientation){

              //If orientation is portrait it return a column with items and botton margin
              if (orientation == Orientation.portrait){
                _itemH = size.height;
                _itemW = size.width;
                _itemMBotton = size.height * 0.02;
                _itemMRight = 0.0;
                data.forEach((element) {
                  list.add(_containerModel(element,context));//_containerModel set design of the item
                });
                return Column(
                  children: list,
                );
              }

              //If orientation is landscape it return a row with items and left margin
              _itemH = size.width;
              _itemW = size.height;
              _itemMBotton = 0.0;
              _itemMRight = size.height * 0.02;
              data.forEach((element) {
                list.add(_containerModel(element,context)); //_containerModel set design of the item
              });
              return Row(
                children: list,
              );
            },
          );
      },
      ),
    );
  }

  //_containerModel set item container background properties and onTap actions
  //_conatinerModel receive each item of type Servicio to send it to it child
  //Background container has nos color but a boxShadow
  //_containerModel child is _elementosItem and set foreground properties
  Widget _containerModel(Servicio item,BuildContext context){
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(bottom: _itemMBotton, right: _itemMRight),//sizes change with screen orientation
        height: _itemH * 0.20, //sizes change with screen orientation
        width: _itemW * 0.45, //sizes change with screen orientation
        decoration: BoxDecoration(
          //color: Color.fromRGBO(32, 30, 50, 1),
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black26,
              offset: Offset(2.0,5.0),
              spreadRadius: 2.0,
              blurRadius: 7.0,
            ),
          ]
        ),
        child: _elementosItem(item),
      ),
      onTap: (){
        item.tap = true;
        Timer(Duration(milliseconds: 100), (){
          item.tap = false;
          setState(() {});
        });
        setState(() {});
      },
    );
  }

  //Due to not multiple return values each method change items colors when on tap, to get a tapped effect
  Color _setColor1(Servicio item){
    if (item.tap){
      return _colorBox1Effect;
    }
    return _colorBox1;
  }
  Color _setColor2(Servicio item){
    if (item.tap){
      return _colorBox2Effect;
    }
    return _colorBox2;
  }


  Widget _elementosItem(Servicio item){
    return Stack(
      children: [
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: _setColor1(item),
                  borderRadius: BorderRadius.circular(20.0)
              ),
              height: _itemH,
              width: _itemW * 0.25,
              child: Row(
                children: [
                  Container(
                    height: _itemH,
                    width: _itemW * 0.15,
                    child: Center(
                      child: RotatedBox(
                        quarterTurns: -1,
                        child: Text(item.texto, style: TextStyle(color: Colors.white),textAlign: TextAlign.center,),
                      ),
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
              height: _itemH,
              width: _itemW * 0.30,
              decoration: BoxDecoration(
                  color: _setColor2(item),
                  borderRadius: BorderRadius.circular(20.0)
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: _itemH * 0.02),
                child: Image(
                  image: AssetImage("assets/icons_servicios/${item.icon}.png"),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
