import 'package:flutter/material.dart';

@immutable
class AppState {
  final int count;

  AppState({
    this.count,
  });

  AppState.initialState() : count = 0;
  
}
