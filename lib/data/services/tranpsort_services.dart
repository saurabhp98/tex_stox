import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:tex_stox/constants/strings.dart';

class TransportServices {
  String baseUrl = "$kBaseUrl/api/transport";
  Future<List<dynamic>> getTransportDetails() async {
    final response = await http.get(Uri.parse(baseUrl));
    List jsonDecondedData = await jsonDecode(response.body);
    // print(jsonDecondedData);
    return jsonDecondedData;
  }
}
