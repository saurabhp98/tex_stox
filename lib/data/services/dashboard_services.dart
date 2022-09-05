import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tex_stox/constants/strings.dart';

class DashboardServices {
  Future<List<dynamic>> fetchDashboardData() async {
    String baseUrl = 'http://127.0.0.1:8000/api/get_detail_sort_wise';
    final response = await http.get(Uri.parse(baseUrl));
    List currentStock = jsonDecode(response.body);

    return currentStock;
  }

  Future<String> fetchSoldStockMtr() async {
    String baseUrl = 'http://127.0.0.1:8000/api/get_sold_stock_mtr';
    final response = await http.get(Uri.parse(baseUrl));
    String soldMtr = response.body;

    return soldMtr;
  }

  Future<String> fetchCurrentStockMtr() async {
    String baseUrl = 'http://127.0.0.1:8000/api/get_current_stock_mtr';
    final response = await http.get(Uri.parse(baseUrl));
    String currentMtr = response.body;
    return currentMtr;
  }
}
