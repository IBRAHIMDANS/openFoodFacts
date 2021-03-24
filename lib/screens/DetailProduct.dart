import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:openfoodfacts/AppColors.dart';
import 'package:openfoodfacts/res/app_images.dart';
import 'package:openfoodfacts/widgets/DynamicDivider.dart';
import 'package:openfoodfacts/widgets/TabBar.dart';

import '../app_icons.dart';

class DetailProduct extends StatefulWidget {
  @override
  _DetailProductState createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData query = MediaQuery.of(context);
    double sreenWidth = query.size.width;
    double sreenHeight = query.size.height;
    return Scaffold(
      body: Body(),
      bottomNavigationBar: TabBarCustom(),
    );
  }
}

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
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
                    title: "Petit Pois et carottes",
                    subtitle: "Cassegrain",
                    description:
                        "Petits pois et carottes à l'étuvée avec graniture",
                  ),
                  const SizedBox(height: 20.0),
                  DescriptionProduct(),
                ],
              ))
        ],
      ),
    );
  }
}

class Title extends StatefulWidget {
  final title, subtitle, description;

  Title(
      {required this.title, required this.subtitle, required this.description});

  @override
  _TitleState createState() => _TitleState();
}

class _TitleState extends State<Title> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.title, style: Theme.of(context).textTheme.headline5),
              Text(widget.subtitle,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      ?.copyWith(color: Colors.grey)),
              Text(widget.description,
                  style: Theme.of(context).textTheme.bodyText2),
            ],
          ),
        ),
        // Icon(Icons.star, color: Colors.red),
        // Text('41'),
      ],
    );
  }
}

class DescriptionProduct extends StatefulWidget {
  @override
  _DescriptionProductState createState() => _DescriptionProductState();
}

class _DescriptionProductState extends State<DescriptionProduct> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.gray1,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Text(
                    "Nutri-Score",
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10.0),
                  Image.asset(
                    AppImages.nutriscoreA,
                    width: 100,
                  ),
                ],
              ),
              DynamicDividerWidget(axis: Axis.horizontal),
              Column(children: [
                Text(
                  "Groupe NOVA",
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                        color: AppColors.black,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 10.0),
                Text("Produit alimentaire "),
              ])
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Eco Score",
                style: Theme.of(context).textTheme.headline6?.copyWith(
                      color: AppColors.black,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Row(
                children: [
                  Icon(AppIcons.ecoscore_d),
                  Padding(padding: EdgeInsets.only(left: 20.0)),
                  Text(
                    "Impact env élévé ",
                    style: Theme.of(context).textTheme.subtitle2?.copyWith(
                          color: AppColors.gray3,
                        ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
