import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_app/orders/orders.dart';
import 'package:redux_app/model/model.dart';
import 'package:redux_app/redux/app_state.dart';
import 'package:redux_app/redux/reducer.dart';

import 'home/home.dart';

void main(){
  runApp(App());
}

class App extends StatelessWidget{
  final Store<AppState> store = Store<AppState>(
    updateCofeesReducer,
    initialState: AppState(
      coffees: [
          Coffee("Black coffee", 5, false),
          Coffee("Cappuccino", 10, false),
          Coffee("Espresso", 15, false),
          Coffee("Irish coffee", 17, false),
          Coffee("Latte", 20, false),
          Coffee("Macchiato", 21, false),
      ]
    )
  );
  Widget build(context){
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        )
      );
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
          home: HomePage())
      
    );
  }
}

