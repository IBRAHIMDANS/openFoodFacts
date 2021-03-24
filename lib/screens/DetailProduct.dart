import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:openfoodfacts/AppColors.dart';
import 'package:openfoodfacts/res/app_images.dart';

import '../app_icons.dart';

class DetailProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MediaQueryData query = MediaQuery.of(context);
    double sreenWidth = query.size.width;
    double sreenHeight = query.size.height;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            AppImages.pancakes,
            height: 290.0,
            fit: BoxFit.cover,
          ),
          Container(
              margin: EdgeInsets.all(0.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
              ),
              child: Column(
                children: [
                  Title(
                      title: "Petit Pois et carottes", subtitle: "Cassegrain"),
                  DescriptionProduct()
                ],
              ))
        ],
      ),
    );
  }
}

class Title extends StatelessWidget {
  final title, subtitle;

  Title({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.headline4),
        Text(subtitle, style: Theme.of(context).textTheme.subtitle1),
      ],
    );
  }
}

class DescriptionProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColors.gray2,
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  children: [
                    Text("Nutri-Score"),
                    Image.asset(AppImages.nutriscoreA),
                  ],
                ),
                Divider(height: 20),
                Column(
                  children: [
                    Text("eee"),
                    Text("lorem ipsum "),
                  ],
                )
              ],
            ),
            Column(
              children: [
                Text("Eco Score"),
                Row(
                  children: [Icon(AppIcons.barcode), Text("lorem")],
                )
              ],
            )
          ],
        ));
  }
}
