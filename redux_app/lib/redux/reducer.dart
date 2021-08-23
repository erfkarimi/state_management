import 'package:redux_app/redux/actions.dart';
import 'package:redux_app/redux/app_state.dart';

AppState updateCofeesReducer(AppState state, dynamic action){
  if(action is UpdateCoffeeAction){
    action.updatedCoffee.selected = !action.updatedCoffee.selected;
    return AppState(
      coffees: state.coffees
      .map((coffee) => coffee.name == action.updatedCoffee.name
                  ? action.updatedCoffee : coffee
      )
      .toList(),
    );

    
  }

  return state;
}