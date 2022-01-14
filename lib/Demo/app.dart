import 'package:flutter/material.dart';
import 'package:demo_2_flutter/Demo/login.dart';
import 'package:demo_2_flutter/Demo/home.dart';
class FissApp extends StatelessWidget{
  const FissApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FISH',
      home: const HomePage(),
      initialRoute: '/login',
      onGenerateRoute: _getRoute,
    );
  }

  Route<dynamic>? _getRoute(RouteSettings settings){
    if(settings.name!='/login'){
      return null;
    }

    return MaterialPageRoute(
      settings: settings,
      builder: (BuildContext context) => const loginPage(),
      fullscreenDialog: true,
    );
  }
}