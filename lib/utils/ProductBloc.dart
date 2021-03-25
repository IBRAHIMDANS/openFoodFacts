import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:openfoodfacts/utils/NetworkManager.dart';
import 'package:openfoodfacts/utils/ProductState.dart';

class ProductBloc extends Bloc<ProductEvents, ProductState> {
  int counter = 0;

  ProductBloc() : super(InitialState());

  void incrementCounter() {
    add(const IncrementCounterEvent());
  }

  @override
  Stream<ProductState> mapEventToState(ProductEvents event) async* {
    if (event is IncrementCounterEvent) {
      counter++;
      yield CurrentState(counter);
    }
  }
}
