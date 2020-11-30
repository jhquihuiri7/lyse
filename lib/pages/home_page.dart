import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:animated_text_kit/animated_text_kit.dart' as animatedText;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  double _value = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      //backgroundColor: Colors.white,
      body: _body(context, size),
    );
  }

  Widget _body(BuildContext context, Size size){
    _value = size.height;
    return Stack(
      children: <Widget>[
        _background(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _firstPart(),
            _secondPart(context),
            SizedBox(width: double.infinity,),
          ],
        ),

      ],
    );
  }
  Widget _background(){
    setState(() {

    });
    return Stack(
      children: <Widget>[
        _backgroundContainer(Color.fromRGBO(252, 202, 152, 0.9),20.0,-80.0),
        _backgroundContainer(Color.fromRGBO(246, 154, 171, 0.9),-100.0,-80.0),
        _backgroundContainer(Color.fromRGBO(236, 130, 149, 0.9),-220.0,-80.0),
      ],
    );
  }
  Widget _backgroundContainer(Color color, double left, double top){
    return Positioned(
      left: left,
      top: top,
      child: Transform.rotate(
        angle: pi/4 ,
        child: Container(
          height: _value * 0.7,
          width: _value * 0.7,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadiusDirectional.circular(60.0),
          ),
        ),
      ),
    );
  }
  Widget _firstPart(){
    return Container(
      height: _value * 0.75,
      width: double.infinity,
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: _value * 0.1),
            child: Row(
              children: [
                Expanded(child: SizedBox()),
                Image(
                  image: AssetImage("assets/icon/iconblanco.png"),
                  height: _value * 0.5,
                ),
                Expanded(child: SizedBox()),
              ],
            ),
          ),
          Padding(
              padding: EdgeInsets.only(top: _value * 0.50),
              child: Row(
                children: [
                  Expanded(child: SizedBox()),
                  animatedText.RotateAnimatedTextKit(
                    repeatForever: true, //this will ignore [totalRepeatCount]
                    pause: Duration(milliseconds:  1000),
                    text: ["LYSE", "Tu app de limpieza"],
                    textStyle: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold, color: Colors.white),
                    textAlign: TextAlign.center,
                    isRepeatingAnimation: true,
                  ),
                  Expanded(child: SizedBox()),
                ],
              )
          ),
        ],
      ),
    );
  }

  Widget _secondPart(BuildContext context) {
    return Container(
      height: _value * 0.25,
      child: Column(
        children: [
          _button("Ingresar", Color.fromRGBO(252, 202, 152, 1), Colors.white, "services"),
          SizedBox(height: 30.0,),
          _button("Invitado", Color.fromRGBO(247, 229, 225, 1),Color.fromRGBO(195, 110, 79, 1), "services"),
          Expanded(child: SizedBox()),
        ],
      ),
    );
  }
  Widget _button(String text, Color colorB, Color colorT, String route){
    final TextStyle _style = TextStyle(
      color: colorT,
      fontSize: 25.0
    );
    return RaisedButton(
      onPressed: (){
        Navigator.pushNamed(context, route);
      },
      padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
      elevation: 10.0,
      color: colorB,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0)
      ),
      child: Text(text, style: _style,),
    );
  }
}
