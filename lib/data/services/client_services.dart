import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:tex_stox/data/repository/client_repository.dart';

import '../models/ClientModel.dart';
import 'package:http/http.dart' as http;

// this method is without using the repository pattern to fetch data
// Future<ClientModel?> fetchClient() async {
//   String baseUrl = "http://127.0.0.1:8000/api/client";
//   final response = await http.get(Uri.parse(baseUrl + "/1"));
//   final jsonResponse = await jsonDecode((response.body).toString());
//   if (response.statusCode == 200) {
//     print(jsonResponse);
//     return ClientModel.fromJson(jsonResponse);
//   } else {
//     throw Exception("Failed To Load Data");
//   }
// }

class ClientService {
  // initialising the ClientService --- pov its not needed
  // even if one doenst initialise the class in dart still it initialises itself
  // so that it can be accessed.

  ClientService();
  // adding the fetch function to fetch the clients

  Future<List<dynamic>> fetchClient() async {
    // url endpoint returning the json object
    String baseUrl = "http://127.0.0.1:8000/api/client";
    // get request to the endpoint using the url
    final response = await http.get(Uri.parse(baseUrl));
    // since dart doesnt work with json objects
    // there is need to decode this json
    final jsonResponse = await jsonDecode((response.body));

    // returning the decoded json data to as a list
    // so that it can be accessed as list by the repository
    // and can be easily iterated by repository
    return jsonResponse as List;
  }

// adding the data recd from the repositoy to the database
  Future addClient(client) async {
    // url end point
    String baseUrl = "http://127.0.0.1:8000/api/client";
    // encoding the json data through tojosn() method
    // so that it can be accaptable for the api end point
    String recData = jsonEncode(client.tojson());
    // using the post method to add data to the database
    // post method takes url and that needed to be parsed
    // and takes headers that should be also passed else it is gonna
    // return 302 error .
    // so it is important to add contenttype header
    // and accept header of json
    // and the body with the encoded json data .

    final response = await http.post(Uri.parse(baseUrl),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.acceptHeader: 'application/json'
        },
        body: recData);
  }

  Future editClient(ClientModel client, id) async {
    String baseUrl = "http://127.0.0.1:8000/api/client/$id";
    String recData = jsonEncode(client.tojson());
    final response = await http.patch(Uri.parse(baseUrl),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.acceptHeader: 'application/json'
        },
        body: recData);
  }

  Future deleteClientFromClientCubit(id) async {
    String baseUrl = "http://127.0.0.1:8000/api/client/$id";
    final response = await http.delete(
      Uri.parse(baseUrl),
    );
  }
}
