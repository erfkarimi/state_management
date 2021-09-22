import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getx_app/model/coffee_model.dart';
import 'package:getx_app/view/orders/orders.dart';
import 'package:getx_app/view_model/app_state/app_state.dart';

class Home extends StatefulWidget{
  const Home({Key? key}) : super(key: key);

  @override
  HomeState createState()=> HomeState();
}
class HomeState extends State<Home>{
  final appState = Get.put(AppState(
    coffees: RxList(<Coffee>[
          Coffee("Black coffee", 5, false),
          Coffee("Cappuccino", 10, false),
          Coffee("Espresso", 15, false),
          Coffee("Irish coffee", 17, false),
          Coffee("Latte", 20, false),
          Coffee("Macchiato", 21, false),
    ])
  ));
  @override
  Widget build(context){
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[700],
        title: const Text("Caffee Menu"),
        elevation: 0.0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.dark,
          systemNavigationBarColor: Colors.white
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_bag),
            onPressed: (){
              Get.to(()=> Orders());
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: appState.coffees.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.only(
              top: 12),

            child: ListTile(
              leading: Image.asset('icons/starbucks.png',
              width: 40,),
              title: Text(
                appState.coffees[index].name,
                style: const TextStyle(
                  color: Colors.black
                )
              ),
              subtitle: Text('\$ ${appState.coffees[index].price}',
              style: TextStyle(
                color: Colors.green[700]
              ),),
              trailing: Checkbox(
                value: appState.coffees[index].selected,
                onChanged: (value){
                  setState(() {
                    appState.selectedCoffe(index);
                  });
                },
              ),
            ),
          );
          },
        ),
    );
  }
}