import 'package:get/get.dart';
import 'package:getx_app/model/coffee_model.dart';

class AppState extends GetxController{
  RxList<Coffee> coffees = <Coffee>[].obs;


  AppState({
    required this.coffees 
  });

  selectedCoffe(int index){
      coffees[index].selected = !coffees[index].selected;
  
  }
}