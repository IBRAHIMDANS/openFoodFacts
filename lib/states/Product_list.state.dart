import 'package:openfoodfacts/models/Product_list_item.dart';

abstract class ProductsListState {
  final List<ProductListItem> history;

  ProductsListState(this.history);

  ProductsListState.empty() : this.history = List<ProductListItem>.empty();
}

class ResultProductsListState extends ProductsListState {
  ResultProductsListState(List<ProductListItem> history) : super(history);

  ResultProductsListState.empty() : super.empty();
}
