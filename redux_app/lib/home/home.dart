import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_app/orders/orders.dart';
import 'package:redux_app/model/model.dart';
import 'package:redux_app/redux/actions.dart';
import 'package:redux_app/redux/app_state.dart';

class HomePage extends StatelessWidget{
  Widget build(context){
    return StoreConnector<AppState, List<Coffee>>(
              converter: (store)=> store.state.coffees,
              builder: (context, List<Coffee> allCoffees)=>
       Scaffold(
        backgroundColor: Colors.brown[100],
        appBar: AppBar(
          title: Text("Coffee menu"),
          centerTitle: true,
          brightness: Brightness.dark,
          elevation: 0.0,
          backgroundColor: Colors.brown[700],
          actions: [
            IconButton(
              icon: Icon(Icons.shopping_bag),
              onPressed: (){
                Navigator.push(context,
                MaterialPageRoute(builder: (context)=> Orders()));
              },
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Container(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...allCoffees.map(
                    (coffee) => ListTile(
                      leading: Image.asset("icon/starbucks.png",
                      width: 40,),
                      title: Text(coffee.name),
                subtitle: Text('\$${coffee.price}',
                style: TextStyle(
                  color: Colors.green[700]
                ),
                ),
                trailing: Checkbox(
                  value: coffee.selected,
                  onChanged: (value){
                    StoreProvider.of<AppState>(context).dispatch(
                        UpdateCoffeeAction(coffee)
                      );
                  },
                ),
                    )
                  )
                ]
              ),
            ),
          ),
        ),
      
    );
  }
}