import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openfoodfacts/blocs/ProductHistoryBloc.dart';
import 'package:openfoodfacts/states/Product_list.state.dart';
import 'package:openfoodfacts/widgets/ProductListItem.widget.dart';

class ProductListDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: BlocBuilder<ProductsHistoryBloc, ProductsListState>(
          builder: (BuildContext context, ProductsListState state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 42.0, vertical: 42.0),
          child: ListView.builder(
            itemCount: state.history.length,
            itemBuilder: (BuildContext context, int position) {
              dynamic item = state.history[position];

              return ProductListItemWidget(item: item);
            },
          ),
        );
      }),
    );
  }
}
