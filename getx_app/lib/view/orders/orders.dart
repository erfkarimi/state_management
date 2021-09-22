import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/view/home/home.dart';
import 'package:getx_app/view_model/app_state/app_state.dart';

class Orders extends StatelessWidget{
   Orders({Key? key}) : super(key: key);
  
  final appState = Get.find<AppState>();
  @override 
  Widget build(context){
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        title: const Text("Orders"),
        backgroundColor: Colors.brown[700],
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: (){
            Get.back(result: const Home());
          }
        ),
      ),
      body: ListView.builder(
        itemCount: appState.coffees
        .where((element) => element.selected)
        .length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.only(
              top: 12
            ),
            child: ListTile(
              title: Text(
                appState.coffees[index].name,
                style: const TextStyle(
                  color: Colors.black
                ),
              ),
              trailing: Text(
                '\$${appState.coffees[index].price}',
                style: TextStyle(
                  color: Colors.green[700]
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}