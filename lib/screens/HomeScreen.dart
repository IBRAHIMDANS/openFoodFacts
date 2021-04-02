import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openfoodfacts/app_icons.dart';
import 'package:openfoodfacts/blocs/ProductHistoryBloc.dart';
import 'package:openfoodfacts/screens/EmptyListDisplay.dart';
import 'package:openfoodfacts/screens/ProductListScreen.dart';
import 'package:openfoodfacts/states/Product_list.state.dart';
import 'package:openfoodfacts/utils/Navigator.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductsHistoryBloc>(
      create: (_) => ProductsHistoryBloc(),
      child: Builder(
        builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Mes scans'),
              actions: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: 10.0),
                  child: IconButton(
                    icon: Icon(AppIcons.barcode),
                    onPressed: () {
                      openDetailsScreen(context, '5000159484695');
                    },
                  ),
                )
              ],
            ),
            body: BlocBuilder<ProductsHistoryBloc, ProductsListState>(
              builder: (BuildContext context, ProductsListState state) {
                if (state.history.isEmpty) {
                  return EmptyListDisplay();
                } else {
                  return ProductListDisplay();
                }
              },
            ),
          );
        },
      ),
    );
  }
}
