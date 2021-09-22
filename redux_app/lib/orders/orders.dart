import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_app/model/model.dart';
import 'package:redux_app/redux/app_state.dart';

class Orders extends StatelessWidget{
  Widget build(context){
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[700],
        title: Text("Orders"),
        centerTitle: true,
        elevation: 0.0,
        brightness: Brightness.dark,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 12.0
        ),
        child: StoreConnector<AppState, List<Coffee>>(
          converter: (store)=> store.state.coffees,
          builder: (context, List<Coffee> allCoffees)=> Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index)=> ListTile(
                        title: Text(
                          allCoffees
                           .where((element) => element.selected)
                           .toList()[index]
                           .name
                        ),
                        trailing: Text(
                          '\$${
                          allCoffees
                          .where((element) => element.selected)
                          .toList()[index]
                          .price}',
                          style: TextStyle(
                            color: Colors.green[700]
                          ),
                        ),
                      ),
                      itemCount: allCoffees
                      .where((element) => element.selected)
                      .length
                    ),
                  ),
            ],
          )
        ),
      )
    );
  }
}