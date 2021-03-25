import 'package:flutter/material.dart';
import 'package:openfoodfacts/AppColors.dart';
import 'package:openfoodfacts/screens/DetailProduct.dart';
import 'package:openfoodfacts/screens/EmptyBasket.dart';
import 'package:openfoodfacts/screens/HomeProduct.dart';
import 'package:openfoodfacts/widgets/TabBar.dart';

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
      title: 'Flutter Demo',
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
      home: Stack(
        children: [
          Offstage(
            offstage: currentTab != ProductDetailCurrentTab.sumary,
            child: EmptyListScreen(),
          ),
          Offstage(
            offstage: currentTab != ProductDetailCurrentTab.info,
            child: DetailProduct(),
          ),
          Offstage(
            offstage: currentTab != ProductDetailCurrentTab.nutrition,
            child: Mountain(),
          ),
          // Offstage(
          //   offstage: currentTab != ProductDetailCurrentTab.nutritionalValues,
          //   child: Text('4'),
          // ),
        ],
      ),
    );
  }
}
