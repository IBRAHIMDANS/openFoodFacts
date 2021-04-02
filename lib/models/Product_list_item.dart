class ProductListItem {
  final String barcode;
  final String name;
  final String brand;
  final String thumbnail;
  final String nutriscore;

  ProductListItem.fromAPI(Map<dynamic, dynamic> api)
      : barcode = api['Barcode'],
        name = api['Name'],
        brand = api['Brand'],
        thumbnail = api['Thumbnail'],
        nutriscore = api['Nutriscore'];
}
