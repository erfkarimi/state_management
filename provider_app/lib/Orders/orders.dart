import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/provider/app_state.dart';

class Orders extends StatelessWidget{
  Widget build(context){
    return Scaffold(
      backgroundColor: Colors.brown[700],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.brown[700],
        title: Text("Orders"),
        elevation: 0.0,
        leading: IconButton(
         icon: Icon(Icons.arrow_back_ios_outlined,
        ),
        onPressed: (){
          Navigator.pop(context);
        }
        ),
        brightness: Brightness.dark,
      ),
      body: Consumer<AppState>(
        builder: (context, value, child){
          return Container(
            padding: EdgeInsets.all(8.0),
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Colors.brown[100],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30)
            )
          ),
            child: ListView.builder(
              itemCount: value.coffees
              .where((element) => element.selected)
              .length,
              itemBuilder: (context, index){
                return ListTile(
                  title: Text(
                    value.coffees
                    .where((element) => element.selected)
                    .toList()[index]
                    .name
                  ),
                  trailing: Text(
                    '\$${value.coffees
                    .where((element) => element.selected)
                    .toList()[index]
                    .price}',
                    style: TextStyle(
                      color: Colors.green[700],
                      fontSize: 15
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}