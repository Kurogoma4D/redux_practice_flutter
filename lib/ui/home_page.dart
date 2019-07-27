import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_practice_flutter/redux/actions/home_fab_actions.dart';
import 'package:redux_practice_flutter/redux/reducers/app_reducer.dart';
import 'package:redux_practice_flutter/redux/states/app_state.dart';

class MyApp extends StatelessWidget {
  final Store<AppState> store;

  MyApp()
      : store = Store<AppState>(
          appReducer,
          initialState: AppState.initialState(),
        );

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'Flutter Demo',
        home: MyHomePage(title: 'Redux Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({this.title});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: (store) {
        return _ViewModel(
          count: store.state.count,
          onMinusOne: () => store.dispatch(HomeMinusOneAction()),
          onPlusOne: () => store.dispatch(HomePlusOneAction()),
        );
      },
      builder: (context, viewModel) {
        return Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("${viewModel.count}"),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: RaisedButton(
                    padding: const EdgeInsets.all(20),
                    color: Colors.blue[300],
                    onPressed: () => viewModel.onPlusOne(),
                    child: Text("+1"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: RaisedButton(
                    padding: const EdgeInsets.all(20),
                    color: Colors.red[300],
                    onPressed: () => viewModel.onMinusOne(),
                    child: Text("-1"),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _ViewModel {
  final int count;
  final VoidCallback onMinusOne;
  final VoidCallback onPlusOne;

  _ViewModel({
    this.count,
    this.onMinusOne,
    this.onPlusOne,
  });
}
