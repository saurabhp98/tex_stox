import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:tex_stox/data/models/PurchaseModel.dart';

import '../../constants/strings.dart';

class PurchaseServices {
  Future addPurchase(PurchaseModel purchaseData) async {
    String baseUrl = '$kBaseUrl/api/purchase';
    final recData = jsonEncode(purchaseData.toJson());
    final response = await http.post(Uri.parse(baseUrl),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.acceptHeader: 'application/json'
        },
        body: recData);

    if (response.statusCode == 201) {
      return response.statusCode;
      print('data added successfully');
    } else {
      print(response.headers);
    }
  }
}
