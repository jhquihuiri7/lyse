import 'package:flutter/material.dart';
import 'package:lise_v1/routes/routes.dart';
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: ServicesPage(),
      initialRoute: "/",
      routes: getRoutes(),
      theme: ThemeData(
        primaryColor: Color.fromRGBO(252, 202, 152, 1),
      ),
    );
  }
}