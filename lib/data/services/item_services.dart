import 'dart:convert';

import '../../constants/strings.dart';
import 'package:http/http.dart' as http;

class ItemServices {
  String baseUrl = "$kBaseUrl/api/item";
  Future<List<dynamic>> getItemDetails() async {
    final response = await http.get(Uri.parse(baseUrl));
    List jsonDecondedData = await jsonDecode(response.body);
    // print(jsonDecondedData);
    return jsonDecondedData;
  }
}
