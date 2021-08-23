import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/Orders/orders.dart';
import 'package:provider_app/provider/app_state.dart';

class HomePage extends StatelessWidget{
  Widget build(context){
    return Scaffold(
      backgroundColor: Colors.brown[700],
      appBar: AppBar(
        title: Text("Coffee menu"),
        centerTitle: true,
        backgroundColor: Colors.brown[700],
        elevation: 0.0,
        brightness: Brightness.dark,
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_bag),
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context)=> Orders())
              );
            },
          )
        ],
      ),
      body: Consumer<AppState>(
        builder: (context, value, child)
        => Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30)
            ),
            color: Colors.brown[100]
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 12),
            child: ListView.builder(
              itemCount: value.coffees.length,
              itemBuilder: (context, index){
                return ListTile(
                  leading: Image.asset('icon/starbucks.png',
                  width: 40,),
                  title: Text(value.coffees[index].name),
                  subtitle: Text('\$${value.coffees[index].price}',
                  style: TextStyle(
                    color: Colors.green[700]
                  ),
                  ),
                  trailing: Checkbox(
                    value: value.coffees[index].selected,
                    onChanged: (vle){
                      value.updateState(index);
                    },
                  ),
                );
              },
            ),
          )
        )
      )
    );
  }
}