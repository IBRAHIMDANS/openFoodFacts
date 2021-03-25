import 'package:flutter/material.dart';
import 'package:openfoodfacts/app_icons.dart';

class DetailsScreen extends StatefulWidget {
  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  ProductDetailsCurrentTab currentTab = ProductDetailsCurrentTab.summary;
  int position = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Offstage(
            offstage: currentTab != ProductDetailsCurrentTab.summary,
            child: Text('1'),
          ),
          Offstage(
            offstage: currentTab != ProductDetailsCurrentTab.info,
            child: Text('2'),
          ),
          Offstage(
            offstage: currentTab != ProductDetailsCurrentTab.nutrition,
            child: Text('3'),
          ),
          Offstage(
            offstage: currentTab != ProductDetailsCurrentTab.nutritionalValues,
            child: Text('4'),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(AppIcons.tab_barcode), label: 'Fiche'),
          BottomNavigationBarItem(
              icon: Icon(AppIcons.tab_fridge), label: 'Caractéristiques'),
          BottomNavigationBarItem(
              icon: Icon(AppIcons.tab_nutrition), label: 'Nutrition'),
          BottomNavigationBarItem(
              icon: Icon(AppIcons.tab_array), label: 'Tableau'),
        ],
        currentIndex: position,
        onTap: (int position) {
          setState(() {
            currentTab = ProductDetailsCurrentTab.values.elementAt(position);
            this.position = position;
          });
        },
      ),
    );
  }

  Widget _body() {
    if (currentTab == ProductDetailsCurrentTab.summary) return Text('1');
    if (currentTab == ProductDetailsCurrentTab.info) return Text('2');
    if (currentTab == ProductDetailsCurrentTab.nutrition) return Text('3');
    if (currentTab == ProductDetailsCurrentTab.nutritionalValues)
      return Text('4');

    throw Exception('');
  }
}

enum ProductDetailsCurrentTab { summary, info, nutrition, nutritionalValues }
