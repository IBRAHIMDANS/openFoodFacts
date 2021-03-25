// part of 'counter_bloc_bloc.dart';

import 'package:flutter/widgets.dart';

@immutable
abstract class ProductState {
  final int count;
  const ProductState(this.count);
}

class InitialState extends ProductState {
  const InitialState() : super(0);
}

class CurrentState extends ProductState {
  CurrentState(dynamic data) : super(data);
}
