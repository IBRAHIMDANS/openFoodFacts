import 'package:dio/dio.dart';
import 'package:openfoodfacts/models/Product.dart';

class NetworkManager {
  static final NetworkManager _networkManager = NetworkManager._internal();

  factory NetworkManager() {
    return _networkManager;
  }

  NetworkManager._internal();

  Future<Product> fetchProduct(String barcode) async {
    Map<String, String> query = <String, String>{
      'barcode': barcode,
    };

    Response<dynamic> response;
    Dio dio = Dio();
    response = await dio.get('https://api.formation-android.fr/v2/getProduct',
        queryParameters: query);
    return Product.fromJson(response.data);
  }
}
