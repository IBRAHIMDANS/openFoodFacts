import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openfoodfacts/AppColors.dart';
import 'package:openfoodfacts/blocs/ProductBloc.dart';
import 'package:openfoodfacts/enum/ProductDetailsCurrent.dart';
import 'package:share/share.dart';

import '../app_icons.dart';

class ProductDetailsScreen extends StatefulWidget {
  final String barcode;

  ProductDetailsScreen({required this.barcode});

  @override
  _ProductDetailsScreenState createState() =>
      _ProductDetailsScreenState(barcode: barcode);
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  ProductDetailsCurrentTab currentTab = ProductDetailsCurrentTab.summary;

  final String barcode;

  _ProductDetailsScreenState({required this.barcode});

  void _changeTab(int tabIndex) {
    setState(() {
      currentTab = getProductDetailsCurrentTabFromValue(tabIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductBloc>(
      create: (_) => ProductBloc(barcode),
      lazy: false,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          actions: <Widget>[
            IconButton(
              icon: Icon(AppIcons.share, color: AppColors.white),
              onPressed: () => <void>{
                Share.share('https://fr.openfoodfacts.org/produit/$barcode')
              },
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(AppIcons.tab_barcode),
              label: 'Fiche',
            ),
            BottomNavigationBarItem(
              icon: Icon(AppIcons.tab_fridge),
              label: 'Caractéristiques',
            ),
            BottomNavigationBarItem(
              icon: Icon(AppIcons.tab_nutrition),
              label: 'Nutrition',
            ),
            BottomNavigationBarItem(
              icon: Icon(AppIcons.tab_array),
              label: 'Tableau',
            ),
          ],
          currentIndex: getProductDetailsCurrentTabValue(currentTab),
          onTap: _changeTab,
        ),
        body: getProductDetailsCurrentTabWidget(currentTab),
      ),
    );
  }
}
