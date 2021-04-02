import 'package:flutter/material.dart';
import 'package:openfoodfacts/AppColors.dart';
import 'package:openfoodfacts/screens/HomeScreen.dart';
import 'package:openfoodfacts/widgets/TabBar.widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ProductDetailCurrentTab currentTab = ProductDetailCurrentTab.sumary;
  int position = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Open Foods Facts',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: AppColors.blue,
          primaryColorDark: AppColors.blueDark,
          accentColor: AppColors.yellow,
          appBarTheme: AppBarTheme(
              elevation: 0.0,
              textTheme: TextTheme(
                  headline6: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(color: AppColors.blue)),
              backgroundColor: AppColors.white,
              titleTextStyle: TextStyle(color: AppColors.blue),
              actionsIconTheme: IconThemeData(color: AppColors.blue)),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
              selectedItemColor: AppColors.blue,
              unselectedItemColor: AppColors.gray2)),
      home: HomeScreen(),
    );
  }
}
