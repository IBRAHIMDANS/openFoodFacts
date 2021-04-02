import 'package:flutter/material.dart';
import 'package:openfoodfacts/AppColors.dart';

class ProductListItemWidget extends StatelessWidget {
  final dynamic item;

  const ProductListItemWidget({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 50.0),
      child: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(30.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              color: AppColors.white,
            ),
            child: Row(
              children: <Widget>[
                SizedBox(width: 160.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '${item.name}',
                        style: Theme.of(context).textTheme.headline5?.copyWith(
                              color: AppColors.blueDark,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Text(
                        '${item.brand}',
                        style: Theme.of(context).textTheme.headline6?.copyWith(
                              color: Colors.grey,
                            ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          children: <Widget>[
                            Container(
                              width: 20.0,
                              height: 20.0,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                                color: AppColors.nutriscoreA,
                              ),
                            ),
                            SizedBox(width: 10.0),
                            Text('Nutriscore : ${item.nutriscore}'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 30.0,
            bottom: 30.0,
            child: Container(
              width: 130.0,
              height: 130.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                image: DecorationImage(
                  fit: BoxFit.fitHeight,
                  alignment: FractionalOffset.topCenter,
                  image: NetworkImage(item.thumbnail),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
