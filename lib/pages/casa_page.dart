import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class CasaPage extends StatefulWidget {
  @override
  _CasaPageState createState() => _CasaPageState();
}

class _CasaPageState extends State<CasaPage> {
  Size _sizeScreeen (BuildContext context){
    return MediaQuery.of(context).size;
  }
  double _height (BuildContext context){
    return _sizeScreeen(context).height;
  }
  double _width (BuildContext context){
    return _sizeScreeen(context).width;
  }
  double _heightItem (BuildContext context){
    return _height(context)*0.35;
  }
  double _widthItem (BuildContext context){
    print(_width(context)*0.7);
    return _width(context)*0.7;
  }
  double _borderRadious = 10.0;
  List<BoxShadow> _boxShadow = <BoxShadow>[
    BoxShadow(
      offset: Offset(10.0, 10.0),
      color: Colors.black12,
      blurRadius: 10.0,
      spreadRadius: 2.0,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
    );
  }
  Widget _body(BuildContext context){
    return Container(
      height: _height(context),
      width: _width(context),
      decoration: BoxDecoration(
        //color: Color.fromRGBO(32, 30, 50, 1),
        gradient: LinearGradient(
            colors: [Color.fromRGBO(252, 202, 152, 1),Color.fromRGBO(246, 154, 171, 1),Color.fromRGBO(236, 130, 149, 1)],
            stops: [0.2,0.9,1],
            begin: Alignment.topLeft,
            end: Alignment.bottomLeft
        ),
      ),
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: _width(context)*0.05),
        children: _itemsContainer(context),
      )
    );
  }
  List<Widget> _itemsContainer(BuildContext context){
    return [
      SizedBox(
        height: _height(context)*0.05,
      ),
      Container(
        height: _height(context)*0.08,
        width: _widthItem(context),
        decoration: BoxDecoration(
          color: Color.fromRGBO(240, 94, 139, 1),
          borderRadius: BorderRadius.circular(_borderRadious),
          boxShadow: _boxShadow,
        ),
      ),
      SizedBox(
        height: _height(context)*0.05,
      ),
      Stack(
        children: [
          Column(
            children: [
              SizedBox(height: 15.0,),
              Container(
                alignment: Alignment.bottomLeft,
                height: _heightItem(context),
                width: _width(context)*0.86,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(249, 180, 61, 1),
                  borderRadius: BorderRadius.circular(_borderRadious),
                  boxShadow: _boxShadow,
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image(
                    image: AssetImage("assets/icons_subservices/logo.png"),
                    height: 50.0,
                    width: 50.0,
                  ),
                ],
              ),
            ],
          )
        ],
      ),
      SizedBox(
        height: _height(context)*0.03,
      ),
      Stack(
        children: [
          Column(
            children: [
              SizedBox(height: 15.0,),
              Container(
                alignment: Alignment.bottomLeft,
                height: _heightItem(context),
                width: _width(context)*0.86,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(199, 112, 184, 1),
                  borderRadius: BorderRadius.circular(_borderRadious),
                  boxShadow: _boxShadow,
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image(
                    image: AssetImage("assets/icons_subservices/logo.png"),
                    height: 50.0,
                    width: 50.0,
                  ),
                ],
              ),
            ],
          )
        ],
      ),
      SizedBox(
        height: _height(context)*0.03,
      ),
      Stack(
        children: [
          Column(
            children: [
              SizedBox(height: 15.0,),
              Container(
                alignment: Alignment.bottomLeft,
                height: _heightItem(context),
                width: _width(context)*0.86,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(104, 162, 192, 1),
                  borderRadius: BorderRadius.circular(_borderRadious),
                  boxShadow: _boxShadow,
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image(
                    image: AssetImage("assets/icons_subservices/logo.png"),
                    height: 50.0,
                    width: 50.0,
                  ),
                ],
              ),
            ],
          )
        ],
      ),
      SizedBox(
        height: _height(context)*0.03,
      ),
      Stack(
        children: [
          Column(
            children: [
              SizedBox(height: 15.0,),
              Container(
                alignment: Alignment.bottomLeft,
                height: _heightItem(context),
                width: _width(context)*0.86,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(192, 20, 162, 1),
                  borderRadius: BorderRadius.circular(_borderRadious),
                  boxShadow: _boxShadow,
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image(
                    image: AssetImage("assets/icons_subservices/logo.png"),
                    height: 50.0,
                    width: 50.0,
                  ),
                ],
              ),
            ],
          )
        ],
      ),
      SizedBox(
        height: _height(context)*0.03,
      ),
    ];
  }
}
