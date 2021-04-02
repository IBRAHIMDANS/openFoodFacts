import 'package:flutter/material.dart';
import 'package:openfoodfacts/AppColors.dart';
import 'package:openfoodfacts/app_icons.dart';

class TabBarCustom extends StatefulWidget {
  @override
  _TabBarCustomState createState() => _TabBarCustomState();
}

class _TabBarCustomState extends State<TabBarCustom> {
  ProductDetailCurrentTab currentTab = ProductDetailCurrentTab.sumary;
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        selectedIconTheme: IconThemeData(color: AppColors.blue),
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(AppIcons.tab_barcode),
            label: "Fiche",
          ),
          BottomNavigationBarItem(
            icon: Icon(AppIcons.tab_fridge),
            label: "Caracteristiques",
          ),
          BottomNavigationBarItem(
            icon: Icon(AppIcons.tab_nutrition),
            label: "Nutrition",
          ),
          BottomNavigationBarItem(
            icon: Icon(AppIcons.tab_array),
            label: "Tableau",
          )
        ],
        onTap: (int index) {
          setState(() {
            currentTab = ProductDetailCurrentTab.values.elementAt(index);
            print(index);
            selectedIndex = index;
          });
        });
  }
}

enum ProductDetailCurrentTab { sumary, info, nutrition, nutritionalValues }
