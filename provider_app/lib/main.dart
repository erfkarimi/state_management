import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/model/model.dart';
import 'package:provider_app/provider/app_state.dart';

import 'home/home.dart';

void main() {
  runApp(
    ChangeNotifierProvider<AppState>(
      create: (_)=> AppState(
        coffees: [
          Coffee("Black coffee", 5, false),
          Coffee("Cappuccino", 10, false),
          Coffee("Espresso", 15, false),
          Coffee("Irish coffee", 17, false),
          Coffee("Latte", 20, false),
          Coffee("Macchiato", 21, false),
        ],
      ),
      child: App(),
    )
  );
}

class App extends StatelessWidget{
  Widget build(context){
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        )
      );
    return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomePage(),

    );
  }
}