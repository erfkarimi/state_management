import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider_app/model/model.dart';

class AppState with ChangeNotifier{
  List<Coffee> coffees;

  AppState({
    this.coffees = const[],
    
  });

 updateState(index){
   coffees[index].selected = !coffees[index].selected;
    notifyListeners();
 }



 

  
}