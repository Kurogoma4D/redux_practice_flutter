import 'package:redux_practice_flutter/redux/actions/home_fab_actions.dart';
import 'package:redux_practice_flutter/redux/states/app_state.dart';

AppState appReducer(AppState state, action) {
  if (action is HomeMinusOneAction) {
    return AppState(count: state.count - 1);
  }
  if (action is HomePlusOneAction) {
    return AppState(count: state.count + 1);
  }

  return AppState(count: state.count);
}
