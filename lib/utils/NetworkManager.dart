import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NetworkManager {
  dynamic getProductByBarCode({String barCode: "5000159484695"}) async {
    dynamic url = Uri.https(
        'api.formation-android.fr/v2', '/getProduct', {'barcode': barCode});
    var response = await getRequest(url: url);
    return response;
  }

  Future<dynamic> getRequest({required Uri url}) async {
    try {
      var resp = await http.get(url);
      return jsonDecode(resp.body);
    } catch (err) {
      return err;
    }
  }
}

@immutable
abstract class ProductEvents {
  const ProductEvents();
}

@immutable
class IncrementCounterEvent extends ProductEvents {
  const IncrementCounterEvent();
}
