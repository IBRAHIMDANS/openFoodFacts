import 'package:flutter/material.dart';
import 'package:openfoodfacts/AppColors.dart';

class TabBarCustom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final int selectedIndex = 0;
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: selectedIndex,
      selectedIconTheme: IconThemeData(color: AppColors.blue),
      unselectedItemColor: Colors.grey,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.contacts),
          label: "Fiche",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.info),
          label: "Caracteristiques",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.adb_rounded),
          label: "Nutrition",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "Tableau",
        )
      ],
      onTap: (int index) {
        print(index);
      },
    );
  }
}
