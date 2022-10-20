import 'dart:convert';
import 'dart:io';

import 'package:tex_stox/constants/strings.dart';
import 'package:tex_stox/data/models/AddStockModel.dart';
import 'package:http/http.dart' as http;

class StockServices {
  void addBulkStock(AddStockModel addStockModel) {
    final baseUrl = "$kBaseUrl/api/add_bulk_stock";
    final jsonEncodedData = jsonEncode(addStockModel);
    http.post(Uri.parse(baseUrl),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.acceptHeader: 'application/json'
        },
        body: jsonEncodedData);
    print(jsonEncodedData);
  }
}
