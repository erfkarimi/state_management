import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/view/home/home.dart';

class App extends StatelessWidget{
  const App({Key? key}) : super(key: key);
  @override 
  Widget build(context){
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}