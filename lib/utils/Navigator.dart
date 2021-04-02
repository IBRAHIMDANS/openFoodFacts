import 'package:flutter/material.dart';
import 'package:openfoodfacts/screens/ProductDetailsScreen.dart';

void openDetailsScreen(BuildContext context, String barcode) {
  Navigator.push(
    context,
    MaterialPageRoute<void>(
      builder: (BuildContext context) => ProductDetailsScreen(barcode: barcode),
    ),
  );
}
